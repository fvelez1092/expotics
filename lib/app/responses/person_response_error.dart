class PersonResponseError {
  String error = '';
  bool ok = false;

  PersonResponseError({required this.error, required ok});

  factory PersonResponseError.fromJson(Map<String, dynamic> json) {
    return PersonResponseError(
      ok: json['ok'],
      error: json['error'],
    );
  }
  @override
  String toString() {
    return "error: $error ";
  }
}
