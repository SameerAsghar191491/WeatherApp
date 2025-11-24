class WeatherDataModel {
  Current? current;
  List<Hourly>? hourly;
  List<Daily>? daily;

  WeatherDataModel({
    this.current,
    this.hourly,
    this.daily,
  });

  WeatherDataModel.fromJson(Map<String, dynamic> json) {
    current = json['current'] != null
        ? new Current.fromJson(json['current'])
        : null;
    if (json['hourly'] != null) {
      hourly = <Hourly>[];
      json['hourly'].forEach((v) {
        hourly!.add(new Hourly.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily!.add(new Daily.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    if (this.hourly != null) {
      data['hourly'] = this.hourly!.map((v) => v.toJson()).toList();
    }
    if (this.daily != null) {
      data['daily'] = this.daily!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Current {
  double? temp;
  int? humidity;
  int? clouds;
  double? windSpeed;
  List<Weather>? weather;

  Current({
    this.temp,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
  });

  Current.fromJson(Map<String, dynamic> json) {
    temp = (json['temp'] as num).toDouble();
    humidity = json['humidity'];
    clouds = json['clouds'];
    windSpeed = json['wind_speed'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['humidity'] = this.humidity;
    data['clouds'] = this.clouds;
    data['wind_speed'] = this.windSpeed;
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}

class Hourly {
  double? temp;
  int? humidity;
  int? clouds;
  double? windSpeed;
  List<Weather>? weather;
  Rain? rain;

  Hourly({
    this.temp,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
    this.rain,
  });

  Hourly.fromJson(Map<String, dynamic> json) {
    temp = (json['temp'] as num).toDouble();
    humidity = json['humidity'];
    clouds = json['clouds'];
    windSpeed = json['wind_speed'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
    rain = json['rain'] != null ? new Rain.fromJson(json['rain']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['humidity'] = this.humidity;
    data['clouds'] = this.clouds;
    data['wind_speed'] = this.windSpeed;
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    if (this.rain != null) {
      data['rain'] = this.rain!.toJson();
    }
    return data;
  }
}

class Rain {
  double? d1h;

  Rain({this.d1h});

  Rain.fromJson(Map<String, dynamic> json) {
    d1h = json['1h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1h'] = this.d1h;
    return data;
  }
}

class Daily {
  Temp? temp;
  int? humidity;
  double? windSpeed;
  List<Weather>? weather;
  int? clouds;
  double? rain;

  Daily({
    this.temp,
    this.humidity,
    this.windSpeed,
    this.weather,
    this.clouds,
    this.rain,
  });

  Daily.fromJson(Map<String, dynamic> json) {
    temp = json['temp'] != null ? new Temp.fromJson(json['temp']) : null;
    humidity = json['humidity'];
    windSpeed = json['wind_speed'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
    clouds = json['clouds'];
    rain = json['rain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.temp != null) {
      data['temp'] = this.temp!.toJson();
    }
    data['humidity'] = this.humidity;
    data['wind_speed'] = this.windSpeed;
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    data['clouds'] = this.clouds;
    data['rain'] = this.rain;
    return data;
  }
}

class Temp {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['min'] = this.min;
    data['max'] = this.max;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}

class FeelsLike {
  double? day;
  double? night;
  double? eve;
  double? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  FeelsLike.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}
