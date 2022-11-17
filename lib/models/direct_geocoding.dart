import 'dart:convert';

import 'package:equatable/equatable.dart';

class DirectGeocoding extends Equatable {
  final String city;
  final String country;
  final double lon;
  final double lat;

  const DirectGeocoding({
    required this.city,
    required this.country,
    required this.lon,
    required this.lat,
  });

  @override
  List<Object> get props => [city, country, lon, lat];

  @override
  String toString() {
    return 'DirectGeocoding(city: $city, country: $country, lon: $lon, lat: $lat)';
  }

  factory DirectGeocoding.fromJson(String json) {
    final map = jsonDecode(json)[0];

    return DirectGeocoding(
      city: map['name'] ?? '',
      country: map['country'] ?? '',
      lon: map['lon']?.toDouble() ?? 0.0,
      lat: map['lat']?.toDouble() ?? 0.0,
    );
  }
}
