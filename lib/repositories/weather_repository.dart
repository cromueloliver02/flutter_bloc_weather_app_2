import '../models/direct_geocoding.dart';
import '../models/weather.dart';
import '../models/custom_error.dart';
import '../services/weather_api_service.dart';
import '../utils/weather_exception.dart';

class WeatherRepository {
  final WeatherApiService weatherApiService;

  WeatherRepository({required this.weatherApiService});

  Future<Weather> fetchWeather(String city) async {
    try {
      final directGeocodingJson =
          await weatherApiService.getDirectGeocoding(city);
      final DirectGeocoding directGeocoding =
          DirectGeocoding.fromJson(directGeocodingJson);

      final weatherJson = await weatherApiService.fetchWeather(directGeocoding);
      final Weather tempWeather = Weather.fromJson(weatherJson);

      final weather = tempWeather.copyWith(
        city: directGeocoding.city,
        country: directGeocoding.country,
      );

      return weather;
    } on WeatherException catch (err) {
      throw CustomError(message: err.message);
    } catch (err) {
      throw CustomError(message: err.toString());
    }
  }
}
