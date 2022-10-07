import 'package:weather_app/weather/data/datasource/remote_datasource.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';
import 'package:weather_app/weather/domain/repository/weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository {
  final BaseRemoteDataSource remoteDataSource;

  WeatherRepository(this.remoteDataSource);

  @override
  Future<Weather> getWeatherByCityName(String countryName) async {
    return (await remoteDataSource.getWeatherByCountryName(countryName))!;
  }
}
