class ConnectionSuccess {
  int? code;
  Object response;
  ConnectionSuccess({this.code, required this.response});
}

class ConnectionFailure {
  int code;
  Object errorResponse;
  ConnectionFailure({required this.code, required this.errorResponse});
}
