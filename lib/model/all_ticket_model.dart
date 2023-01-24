class AllTicket {
  String code;
  String message;

  AllTicket({required this.code, required this.message});

  factory AllTicket.fromJson(Map<String, dynamic> json) {
    return AllTicket(
      code: json["TotalRecordCount"],
      message: json["Records"],
    );
  }
}
