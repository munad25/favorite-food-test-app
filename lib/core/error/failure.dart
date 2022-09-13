class Failure {
  final String code;
  final String message;
  final Map<String, dynamic>? data;

  const Failure({required this.code, required this.message, this.data});
}
