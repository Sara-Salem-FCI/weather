import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather/views/search_screen.dart';
import 'package:weather/widgets/no_weather_body.dart';
import 'package:weather/widgets/weather_body.dart';
import '../cubits/weather_cubit/weather_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return const SearchScreen();
                }),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (BuildContext context, WeatherState state) {
          if (state is NoWeatherState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherBody(weather: state.weatherModel,);
          } else {
            return const Center(
                child: Text('Oops There was an error, Try again later.'));
          }
        },
      ),
    );
  }
}
