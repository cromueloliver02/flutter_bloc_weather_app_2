import 'dart:convert';

import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String city;
  final String description;
  final String country;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;
  final DateTime lastUpdated;

  const Weather({
    required this.city,
    required this.description,
    required this.country,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.lastUpdated,
  });

  factory Weather.initial() {
    return Weather(
      city: '',
      description: '',
      country: '',
      icon: '',
      temp: 100.0,
      tempMin: 100.0,
      tempMax: 100.0,
      lastUpdated: DateTime(1970),
    );
  }

  @override
  List<Object> get props {
    return [
      city,
      description,
      country,
      icon,
      temp,
      tempMin,
      tempMax,
      lastUpdated,
    ];
  }

  @override
  String toString() {
    return 'Weather(city: $city, description: $description, country: $country, icon: $icon, temp: $temp, tempMin: $tempMin, tempMax: $tempMax, lastUpdated: $lastUpdated)';
  }

  Weather copyWith({
    String? city,
    String? description,
    String? country,
    String? icon,
    double? temp,
    double? tempMin,
    double? tempMax,
    DateTime? lastUpdated,
  }) {
    return Weather(
      city: city ?? this.city,
      description: description ?? this.description,
      country: country ?? this.country,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'city': city});
    result.addAll({'description': description});
    result.addAll({'country': country});
    result.addAll({'icon': icon});
    result.addAll({'temp': temp});
    result.addAll({'tempMin': tempMin});
    result.addAll({'tempMax': tempMax});
    result.addAll({'lastUpdated': lastUpdated.millisecondsSinceEpoch});

    return result;
  }

  factory Weather.fromJson(String json) {
    final Map<String, dynamic> map = jsonDecode(json);
    final weather = map['weather'][0];
    final main = map['main'];

    return Weather(
      city: '',
      country: '',
      description: weather['description'] ?? '',
      icon: weather['icon'] ?? '',
      temp: main['temp']?.toDouble() ?? 0.0,
      tempMin: main['temp_min']?.toDouble() ?? 0.0,
      tempMax: main['temp_max']?.toDouble() ?? 0.0,
      lastUpdated: DateTime.now(),
    );
  }
}
