import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newspaper_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:newspaper_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:newspaper_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:newspaper_app/features/storage/data/remote_data_source/cloud_storage_remote_data_source.dart';
import 'package:newspaper_app/features/storage/data/remote_data_source/cloud_storage_remote_data_source_impl.dart';
import 'package:newspaper_app/features/storage/data/repository/cloud_storage_repository_impl.dart';
import 'package:newspaper_app/features/storage/domain/repository/cloud_storage_repository.dart';
import 'package:newspaper_app/features/storage/domain/usecases/upload_group_image_usecase.dart';
import 'package:newspaper_app/features/storage/domain/usecases/upload_profile_image_usecase.dart';
import '../features/daily_news/data/data_sources/local/app_database.dart';
import '../features/daily_news/domain/usecases/get_article.dart';
import '../features/daily_news/domain/usecases/get_saved_article.dart';
import '../features/daily_news/domain/usecases/remove_article.dart';
import '../features/daily_news/domain/usecases/save_article.dart';
import '../features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import '../features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import '../features/user/data/remote_data_source/user_remote_data_source.dart';
import '../features/user/data/remote_data_source/user_remote_data_source_impl.dart';
import '../features/user/data/repository/user_repository_impl.dart';
import '../features/user/domain/repository/user_repository.dart';
import '../features/user/domain/usercases/forgot_password_usecase.dart';
import '../features/user/domain/usercases/get_all_users_usecase.dart';
import '../features/user/domain/usercases/get_create_current_user_usecase.dart';
import '../features/user/domain/usercases/get_current_uid_usecase.dart';
import '../features/user/domain/usercases/get_single_user_usecase.dart';
import '../features/user/domain/usercases/get_update_user_usecase.dart';
import '../features/user/domain/usercases/google_auth_usecase.dart';
import '../features/user/domain/usercases/is_sign_in_usecase.dart';
import '../features/user/domain/usercases/sign_in_usecase.dart';
import '../features/user/domain/usercases/sign_out_usecase.dart';
import '../features/user/domain/usercases/sign_up_usecase.dart';
import '../features/user/presentation/cubit/auth/auth_cubit.dart';
import '../features/user/presentation/cubit/credential/credential_cubit.dart';
import '../features/user/presentation/cubit/single_user/single_user_cubit.dart';
import '../features/user/presentation/cubit/user/user_cubit.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  /// External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseStorage storage = FirebaseStorage.instance;

  injector.registerLazySingleton(() => auth);
  injector.registerLazySingleton(() => fireStore);
  injector.registerLazySingleton(() => googleSignIn);
  injector.registerLazySingleton(() => storage);

  //////////////================================

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  injector.registerSingleton<AppDatabase>(database);

  // Dio
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<NewsApiService>(NewsApiService(injector()));

  injector.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(injector(),injector())
  );

  // injector.registerSingleton<AllArticleRepository>(
  //     AllArticleRepositoryImpl(injector())
  // );

  //UseCases
  injector.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(injector())
  );

  injector.registerSingleton<GetSavedArticleUseCase>(
      GetSavedArticleUseCase(injector())
  );

  injector.registerSingleton<SaveArticleUseCase>(
      SaveArticleUseCase(injector())
  );

  injector.registerSingleton<RemoveArticleUseCase>(
      RemoveArticleUseCase(injector())
  );

  // injector.registerSingleton<SaveAllArticleUseCase>(
  //     SaveAllArticleUseCase(injector())
  // );


  //Blocs
  injector.registerFactory<RemoteArticlesBloc>(
          ()=> RemoteArticlesBloc(injector())
  );

  injector.registerFactory<LocalArticleBloc>(
          ()=> LocalArticleBloc(injector(),injector(),injector())
  );
  
  //============================================================================
  injector.registerFactory<AuthCubit>(() => AuthCubit(
      isSignInUseCase: injector.call(),
      signOutUseCase: injector.call(),
      getCurrentUIDUseCase: injector.call()));

  injector.registerFactory<SingleUserCubit>(
          () => SingleUserCubit(getSingleUserUseCase: injector.call()));

  injector.registerFactory<UserCubit>(() => UserCubit(
    getAllUsersUseCase: injector.call(),
    getUpdateUserUseCase: injector.call(),
  ));

  injector.registerFactory<CredentialCubit>(() => CredentialCubit(
      forgotPasswordUseCase: injector.call(),
      googleAuthUseCase: injector.call(),
      signInUseCase: injector.call(),
      signUpUseCase: injector.call()));

  //UseCases
  injector.registerLazySingleton<ForgotPasswordUseCase>(
          () => ForgotPasswordUseCase(repository: injector.call()));
  injector.registerLazySingleton<GetAllUsersUseCase>(
          () => GetAllUsersUseCase(repository: injector.call()));
  injector.registerLazySingleton<GetCreateCurrentUserUseCase>(
          () => GetCreateCurrentUserUseCase(repository: injector.call()));
  injector.registerLazySingleton<GetCurrentUIDUseCase>(
          () => GetCurrentUIDUseCase(repository: injector.call()));
  injector.registerLazySingleton<GetSingleUserUseCase>(
          () => GetSingleUserUseCase(repository: injector.call()));
  injector.registerLazySingleton<GetUpdateUserUseCase>(
          () => GetUpdateUserUseCase(repository: injector.call()));
  injector.registerLazySingleton<GoogleAuthUseCase>(
          () => GoogleAuthUseCase(repository: injector.call()));
  injector.registerLazySingleton<IsSignInUseCase>(
          () => IsSignInUseCase(repository: injector.call()));
  injector.registerLazySingleton<SignInUseCase>(
          () => SignInUseCase(repository: injector.call()));
  injector.registerLazySingleton<SignOutUseCase>(
          () => SignOutUseCase(repository: injector.call()));
  injector.registerLazySingleton<SignUpUseCase>(
          () => SignUpUseCase(repository: injector.call()));

  //Repository
  injector.registerLazySingleton<UserRepository>(
          () => UserRepositoryImpl(remoteDataSource: injector.call()));

  // RemoteDataSource

  injector.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(
      fireStore: injector.call(), auth: injector.call(), googleSignIn: injector.call()));
//======================================================================================
  ///UseCases
  injector.registerLazySingleton<UploadProfileImageUseCase>(() =>
      UploadProfileImageUseCase(repository: injector.call()));
  injector.registerLazySingleton<UploadGroupImageUseCase>(() =>
      UploadGroupImageUseCase(repository: injector.call()));

  /// Repository
  injector.registerLazySingleton<CloudStorageRepository>(
          () => CloudStorageRepositoryImpl(remoteDataSource: injector.call()));

  /// Remote DataSource
  injector.registerLazySingleton<CloudStorageRemoteDataSource>(
          () => CloudStorageRemoteDataSourceImpl(storage: injector.call()));

}