class EarthQuakeListModel {
  bool? status;
  int? httpStatus;
  int? serverloadms;
  String? desc;
  Metadata? metadata;
  List<Result>? result;

  EarthQuakeListModel(
      {this.status,
      this.httpStatus,
      this.serverloadms,
      this.desc,
      this.metadata,
      this.result});

  EarthQuakeListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    httpStatus = json['httpStatus'];
    serverloadms = json['serverloadms'];
    desc = json['desc'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['httpStatus'] = this.httpStatus;
    data['serverloadms'] = this.serverloadms;
    data['desc'] = this.desc;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  String? dateStarts;
  String? dateEnds;
  int? total;

  Metadata({this.dateStarts, this.dateEnds, this.total});

  Metadata.fromJson(Map<String, dynamic> json) {
    dateStarts = json['date_starts'];
    dateEnds = json['date_ends'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_starts'] = this.dateStarts;
    data['date_ends'] = this.dateEnds;
    data['total'] = this.total;
    return data;
  }
}

class Result {
  String? sId;
  String? earthquakeId;
  String? provider;
  String? title;
  String? date;
  dynamic? mag;
  dynamic? depth;
  Geojson? geojson;
  LocationProperties? locationProperties;
  Null? rev;
  String? dateTime;
  int? createdAt;
  String? locationTz;

  Result(
      {this.sId,
      this.earthquakeId,
      this.provider,
      this.title,
      this.date,
      this.mag,
      this.depth,
      this.geojson,
      this.locationProperties,
      this.rev,
      this.dateTime,
      this.createdAt,
      this.locationTz});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    earthquakeId = json['earthquake_id'];
    provider = json['provider'];
    title = json['title'];
    date = json['date'];
    mag = json['mag'];
    depth = json['depth'];
    geojson =
        json['geojson'] != null ? new Geojson.fromJson(json['geojson']) : null;
    locationProperties = json['location_properties'] != null
        ? new LocationProperties.fromJson(json['location_properties'])
        : null;
    rev = json['rev'];
    dateTime = json['date_time'];
    createdAt = json['created_at'];
    locationTz = json['location_tz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['earthquake_id'] = this.earthquakeId;
    data['provider'] = this.provider;
    data['title'] = this.title;
    data['date'] = this.date;
    data['mag'] = this.mag;
    data['depth'] = this.depth;
    if (this.geojson != null) {
      data['geojson'] = this.geojson!.toJson();
    }
    if (this.locationProperties != null) {
      data['location_properties'] = this.locationProperties!.toJson();
    }
    data['rev'] = this.rev;
    data['date_time'] = this.dateTime;
    data['created_at'] = this.createdAt;
    data['location_tz'] = this.locationTz;
    return data;
  }
}

class Geojson {
  String? type;
  List<double>? coordinates;

  Geojson({this.type, this.coordinates});

  Geojson.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class LocationProperties {
  ClosestCity? closestCity;
  EpiCenter? epiCenter;
  List<Airports>? airports;

  LocationProperties({this.closestCity, this.epiCenter, this.airports});

  LocationProperties.fromJson(Map<String, dynamic> json) {
    closestCity = json['closestCity'] != null
        ? new ClosestCity.fromJson(json['closestCity'])
        : null;
    epiCenter = json['epiCenter'] != null
        ? new EpiCenter.fromJson(json['epiCenter'])
        : null;

    if (json['airports'] != null) {
      airports = <Airports>[];
      json['airports'].forEach((v) {
        airports!.add(new Airports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.closestCity != null) {
      data['closestCity'] = this.closestCity!.toJson();
    }
    if (this.epiCenter != null) {
      data['epiCenter'] = this.epiCenter!.toJson();
    }

    if (this.airports != null) {
      data['airports'] = this.airports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClosestCity {
  String? name;
  int? cityCode;
  double? distance;
  int? population;

  ClosestCity({this.name, this.cityCode, this.distance, this.population});

  ClosestCity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cityCode = json['cityCode'];
    distance = json['distance'];
    population = json['population'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cityCode'] = this.cityCode;
    data['distance'] = this.distance;
    data['population'] = this.population;
    return data;
  }
}

class EpiCenter {
  String? name;
  int? cityCode;
  int? population;

  EpiCenter({this.name, this.cityCode, this.population});

  EpiCenter.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cityCode = json['cityCode'];
    population = json['population'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cityCode'] = this.cityCode;
    data['population'] = this.population;
    return data;
  }
}

class Airports {
  double? distance;
  String? name;
  String? code;
  Geojson? coordinates;

  Airports({this.distance, this.name, this.code, this.coordinates});

  Airports.fromJson(Map<String, dynamic> json) {
    distance = json['distance'];
    name = json['name'];
    code = json['code'];
    coordinates = json['coordinates'] != null
        ? new Geojson.fromJson(json['coordinates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['distance'] = this.distance;
    data['name'] = this.name;
    data['code'] = this.code;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    return data;
  }
}
