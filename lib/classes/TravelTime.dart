/*class TravelTime {
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
  final Durations duration;
  final String status;

  Element({this.distance, this.duration, this.status});

  factory Element.fromJson(Map<dynamic, dynamic> json) {
    return Element(
        distance: new Distance.fromJson(json['distance']),
        duration: new Durations.fromJson(json['duration']),
        status: json['status']);
  }
}

class Distance {
  final String text;
  final int value;

  Distance({this.text, this.value});

  factory Distance.fromJson(Map<dynamic, dynamic> json) {
    return new Distance(text: json['text'], value: json['value']);
  }
}

class Durations {
  final String text;
  final int value;

  Durations({this.text, this.value});

  factory Durations.fromJson(Map<dynamic, dynamic> json) {
    return new Durations(text: json['text'], value: json['value']);
  }
}*/
/*class TravelTime {
  List<String> destinationAddresses;
  List<String> originAddresses;
  List<Rows> rows;
  String status;

  TravelTime(
      {this.destinationAddresses,
      this.originAddresses,
      this.rows,
      this.status});

  TravelTime.fromJson(Map<String, dynamic> json) {
    destinationAddresses = json['destination_addresses'].cast<String>();
    originAddresses = json['origin_addresses'].cast<String>();
    if (json['rows'] != null) {
      rows = new List<Rows>();
      json['rows'].forEach((v) {
        rows.add(new Rows.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['destination_addresses'] = this.destinationAddresses;
    data['origin_addresses'] = this.originAddresses;
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Rows {
  List<Elements> elements;

  Rows({this.elements});

  Rows.fromJson(Map<String, dynamic> json) {
    if (json['elements'] != null) {
      elements = new List<Elements>();
      json['elements'].forEach((v) {
        elements.add(new Elements.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.elements != null) {
      data['elements'] = this.elements.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Elements {
  Distances distance;
  Distances duration;
  String status;

  Elements({this.distance, this.duration, this.status});

  Elements.fromJson(Map<String, dynamic> json) {
    distance = json['distance'] != null
        ? new Distances.fromJson(json['distance'])
        : null;
    duration = json['duration'] != null
        ? new Distances.fromJson(json['duration'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.distance != null) {
      data['distance'] = this.distance.toJson();
    }
    if (this.duration != null) {
      data['duration'] = this.duration.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Distances {
  String text;
  int value;

  Distances({this.text, this.value});

  Distances.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['value'] = this.value;
    return data;
  }
}*/
class TT {
  var time;
  TT({this.time});

  factory TT.fromJson(Map<String, dynamic> json) {
    print(json['tta']);
    return TT(time: json['tta']);
  }
}
