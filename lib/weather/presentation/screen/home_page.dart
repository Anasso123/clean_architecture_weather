import 'package:flutter/material.dart';
import 'package:weather_app/weather/presentation/widgets/input_form_field.dart';

import '../../data/datasource/remote_datasource.dart';
import '../../data/repository/weather_repository.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repository/weather_repository.dart';
import '../../domain/usecases/get_weather_by_country.dart';

class HomePage extends StatelessWidget {
  TextEditingController editingController = TextEditingController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter the county',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.50,
              child: InputFormField(
                obscureText: false,
                controller: editingController,
                message: 'Input some data...',
                hint: 'Enter your country',
                icon: Icons.home_work,
              ),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () async {
                  BaseRemoteDataSource baseRemoteDataSource =
                      RemoteDataSource();
                  BaseWeatherRepository baseWeatherRepository =
                      WeatherRepository(baseRemoteDataSource);
                  Weather weather =
                      await GetWeatherByCountryName(baseWeatherRepository)
                          .execute(editingController.text);
                  print(weather.description);
                },
                child: const Text('Get Data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
