class ErrorMessageError {
  final int statusCode;
  final String statusMessage;
 final bool success;

 const ErrorMessageError(
      {required this.statusCode,
      required this.statusMessage,
      required this.success});

  factory ErrorMessageError.formJson(Map<String, dynamic> json) {
    return ErrorMessageError(
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        success: json["success"]);
  }
}
