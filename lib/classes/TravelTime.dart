class TravelTime {
  final List<String> destinations;
  final List<String> origins;
  final List<Element> elements;
  final String status;

  TravelTime({this.destinations, this.origins, this.elements, this.status});

  factory TravelTime.fromJson(Map<String, dynamic> json) {
    var destinationsJson = json['destination_addresses'];
    var originsJson = json['origin_addresses'];
    var rowsJson = json['rows'][0]['elements'] as List;

    return TravelTime(
        destinations: destinationsJson.cast<String>(),
        origins: originsJson.cast<String>(),
        elements: rowsJson.map((i) => new Element.fromJson(i)).toList(),
        status: json['status']);
  }
}

class Element {
  final Distance distance;
  final Duration duration;
  final String status;

  Element({this.distance, this.duration, this.status});

  factory Element.fromJson(Map<String, dynamic> json) {
    return Element(
        distance: new Distance.fromJson(json['distance']),
        duration: new Duration.fromJson(json['duration']),
        status: json['status']);
  }
}

class Distance {
  final String text;
  final int value;

  Distance({this.text, this.value});

  factory Distance.fromJson(Map<String, dynamic> json) {
    return new Distance(text: json['text'], value: json['value']);
  }
}

class Duration {
  final String text;
  final int value;

  Duration({this.text, this.value});

  factory Duration.fromJson(Map<String, dynamic> json) {
    return new Duration(text: json['text'], value: json['value']);
  }
}
