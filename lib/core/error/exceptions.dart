import 'package:coffee_app/core/error/error_message_model.dart';

class ServerException implements Exception {
  ErrorMessageModel errorMessageModel;
  ServerException({
    required this.errorMessageModel,
  });
}

class StaticException implements Exception {
  ErrorMessageModel errorMessageModel;
  StaticException({
    required this.errorMessageModel,
  });
}

class CacheException implements Exception {
  ErrorMessageModel errorMessageModel;
  CacheException({
    required this.errorMessageModel,
  });
}
