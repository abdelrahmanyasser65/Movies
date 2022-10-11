import 'package:first/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageError errorMessageError;

  const ServerException({
    required
    this.errorMessageError});
}
