


import 'package:newspaper_app/features/user/domain/repository/user_repository.dart';



class GoogleAuthUseCase {
 final UserRepository repository;

  GoogleAuthUseCase({required this.repository});


  Future<void> call() {
    return repository.googleAuth();
  }


}