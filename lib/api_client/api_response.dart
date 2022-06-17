class ApiResponse {
  final bool _isSuccess;
  final String? _message;
  dynamic response = null;
  ApiResponse(this._isSuccess, this._message, {this.response});
  String? get message => _message;
  bool get isSuccess => _isSuccess;
  dynamic get _response => response;
}
