









import 'package:newspaper_app/features/user/domain/entities/user_entity.dart';
import 'package:newspaper_app/features/user/domain/repository/user_repository.dart';

class SignInUseCase{
  final UserRepository repository;

  SignInUseCase({required this.repository});

  Future<void> call(UserEntity user){
    return repository.signIn(user);
  }
}