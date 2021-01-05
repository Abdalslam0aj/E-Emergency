class HelpRequest {
  var id;
  var latitude;
  var longitude;
  String civilianPhoneNumber;
  String status;
  String description;
  String timeOfArrivel;
  String timeOfEnd;
  int numberOfHumans;

  HelpRequest(
      {this.id,
      this.latitude,
      this.longitude,
      this.civilianPhoneNumber,
      this.status,
      this.description,
      this.timeOfArrivel,
      this.timeOfEnd,
      this.numberOfHumans});

  factory HelpRequest.fromJson(Map<String, dynamic> json) {
    return HelpRequest(
      id: json['id'],
      civilianPhoneNumber: json['civilianPhoneNumber'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      status: json['status'],
      description: json['description'],
      timeOfArrivel: json['timeOfArrivel'],
      timeOfEnd: json['timeOfEnd'],
      numberOfHumans: json['numberOfHumans'],
    );
  }
}
