



import 'dart:io';

import 'package:newspaper_app/features/storage/data/remote_data_source/cloud_storage_remote_data_source.dart';
import 'package:newspaper_app/features/storage/domain/repository/cloud_storage_repository.dart';

class CloudStorageRepositoryImpl implements CloudStorageRepository{


  final CloudStorageRemoteDataSource remoteDataSource;

  CloudStorageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<String> uploadGroupImage({required File file}) async =>
      remoteDataSource.uploadGroupImage(file: file);

  @override
  Future<String> uploadProfileImage({required File file})  async =>
      remoteDataSource.uploadProfileImage(file: file);

}