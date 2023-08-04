




import 'package:newspaper_app/features/user/domain/entities/user_entity.dart';
import 'package:newspaper_app/features/user/domain/repository/user_repository.dart';

class GetAllUsersUseCase{
  final UserRepository repository;

  GetAllUsersUseCase({required this.repository});

  Stream<List<UserEntity>> call(UserEntity user){
    return repository.getAllUsers(user);
  }
}