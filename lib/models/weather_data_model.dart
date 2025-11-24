class WeatherDataModel {
  Current? current;
  List<Hourly>? hourly;
  List<Daily>? daily;

  WeatherDataModel({this.current, this.hourly, this.daily});

  WeatherDataModel.fromJson(Map<String, dynamic> json) {
    current = json['current'] != null
        ? Current.fromJson(json['current'])
        : null;
    if (json['hourly'] != null) {
      hourly = <Hourly>[];
      json['hourly'].forEach((v) {
        hourly!.add(Hourly.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily!.add(Daily.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (hourly != null) {
      data['hourly'] = hourly!.map((v) => v.toJson()).toList();
    }
    if (daily != null) {
      data['daily'] = daily!.map((v) => v.toJson()).toList();
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
    humidity = (json['humidity']);
    clouds = json['clouds'];
    windSpeed = (json['wind_speed'] as num?)?.toDouble();
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['humidity'] = humidity;
    data['clouds'] = clouds;
    data['wind_speed'] = windSpeed;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
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
    windSpeed = (json['wind_speed'] as num?)?.toDouble();
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['humidity'] = humidity;
    data['clouds'] = clouds;
    data['wind_speed'] = windSpeed;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    return data;
  }
}

class Rain {
  double? d1h;

  Rain({this.d1h});

  Rain.fromJson(Map<String, dynamic> json) {
    d1h = (json['1h'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1h'] = d1h;
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
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    humidity = json['humidity'];
    windSpeed = (json['wind_speed'] as num?)?.toDouble();
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'];
    rain = (json['rain'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (temp != null) {
      data['temp'] = temp!.toJson();
    }
    data['humidity'] = humidity;
    data['wind_speed'] = windSpeed;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['clouds'] = clouds;
    data['rain'] = rain;
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
    day = (json['day'] as num?)?.toDouble();
    min = (json['min'] as num?)?.toDouble();
    max = (json['max'] as num?)?.toDouble();
    night = (json['night'] as num?)?.toDouble();
    eve = (json['eve'] as num?)?.toDouble();
    morn = (json['morn'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['min'] = min;
    data['max'] = max;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
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
    day = (json['day'] as num?)?.toDouble();
    night = (json['night'] as num?)?.toDouble();
    eve = (json['eve'] as num?)?.toDouble();
    morn = (json['morn'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}
