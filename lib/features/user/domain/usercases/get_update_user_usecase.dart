






import 'package:newspaper_app/features/user/domain/entities/user_entity.dart';
import 'package:newspaper_app/features/user/domain/repository/user_repository.dart';

class GetUpdateUserUseCase{
  final UserRepository repository;

  GetUpdateUserUseCase({required this.repository});
  Future<void> call(UserEntity user){
    return repository.getUpdateUser(user);
  }
}