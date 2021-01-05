class HelpRequest {
  int id;
  var latitude;
  var longitude;
  int civilianPhoneNumber;
  String status;
  String description;
  var timeOfArrivel;
  var timeOfEnd;
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
      latitude: json['latitude'],
      longitude: json['longitude'],
      civilianPhoneNumber: json['civilianPhoneNumber'],
      status: json['status'],
      description: json['description'],
      timeOfArrivel: json['timeOfArrivel'],
      timeOfEnd: json['timeOfEnd'],
      numberOfHumans: json['numberOfHumans'],
    );
  }
}
