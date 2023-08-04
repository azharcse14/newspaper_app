import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspaper_app/core/config/routes/routes.dart';
import 'package:newspaper_app/core/config/theme/app_themes.dart';
import 'package:newspaper_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'core/injection_container.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'features/user/presentation/cubit/auth/auth_cubit.dart';
import 'features/user/presentation/cubit/credential/credential_cubit.dart';
import 'features/user/presentation/cubit/single_user/single_user_cubit.dart';
import 'features/user/presentation/cubit/user/user_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => injector<AuthCubit>()..appStarted()),
        BlocProvider<RemoteArticlesBloc>(create: (_) => injector<RemoteArticlesBloc>()..add(const GetArticles())),
        BlocProvider<CredentialCubit>(create: (_) => injector<CredentialCubit>()),
        BlocProvider<SingleUserCubit>(create: (_) => injector<SingleUserCubit>()),
        BlocProvider<UserCubit>(create: (_) => injector<UserCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home:  DailyNews()
      ),
    );
  }
}

