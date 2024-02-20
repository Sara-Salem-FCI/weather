import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather/cubits/weather_cubit/weather_states.dart';
import 'package:weather/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetWeatherCubit(),
      child: Builder(
        builder:(context)=> BlocBuilder<GetWeatherCubit,WeatherState>(
          builder: (BuildContext context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.condition),
              ),
              home: const HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}


MaterialColor getThemeColor(String? condition) {
  if(condition==null){return Colors.blue;}
  switch (condition) {
    case 'Sunny':
      return Colors.deepOrange;
    case 'Clear':
      return Colors.deepOrange;
    case 'Partly cloudy':
      return Colors.blue;
    case 'Cloudy':
      return Colors.blueGrey;
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
      return Colors.lightBlue;
    case 'Patchy rain possible':
      return Colors.indigo;
    case 'Patchy sleet possible':
      return Colors.lightBlue;
    case 'Patchy freezing drizzle possible':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
      return Colors.amber;
    case 'Fog':
      return Colors.blueGrey;
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Patchy light drizzle':
      return Colors.blueGrey;
    case 'Light drizzle':
      return Colors.blueGrey;
    case 'Freezing drizzle':
      return Colors.blueGrey;
    case 'Heavy freezing drizzle':
      return Colors.blueGrey;
    case 'Patchy light rain':
      return Colors.indigo;
    case 'Light rain':
      return Colors.indigo;
    case 'Moderate rain at times':
      return Colors.indigo;
    case 'Moderate rain':
      return Colors.indigo;
    case 'Heavy rain at times':
      return Colors.indigo;
    case 'Heavy rain':
      return Colors.indigo;
    case 'Light freezing rain':
      return Colors.indigo;
    case 'Moderate or heavy freezing rain':
      return Colors.indigo;
    case 'Light sleet':
      return Colors.lightBlue;
    case 'Moderate or heavy sleet':
      return Colors.lightBlue;
    case 'Ice pellets':
      return Colors.blue;
    case 'Light rain shower':
      return Colors.indigo;
    case 'Moderate or heavy rain shower':
      return Colors.indigo;
    case 'Torrential rain shower':
      return Colors.indigo;
    case 'Light sleet showers':
      return Colors.lightBlue;
    case 'Moderate or heavy sleet showers':
      return Colors.lightBlue;
    case 'Light showers of ice pellets':
      return Colors.blue;
    case 'Moderate or heavy showers of ice pellets':
      return Colors.blue;
    case 'Patchy light rain with thunder':
      return Colors.amber;
    case 'Moderate or heavy rain with thunder':
      return Colors.amber;
    case 'Patchy light snow with thunder':
      return Colors.amber;
    case 'Moderate or heavy snow with thunder':
      return Colors.amber;
    default:
      return Colors.lightBlue;
  }
}
