class WeatherModel {
  final String city;
  final DateTime updatedTime;
  final String? weatherImage;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String condition;

  WeatherModel({required this.city,
    required this.updatedTime,
    required this.weatherImage,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.condition});

  factory WeatherModel.fromJson(json){
    return WeatherModel(city: json['location']['name'],
        updatedTime: DateTime.parse(json['current']['last_updated']),
        weatherImage: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        condition: json['forecast']['forecastday'][0]['hour'][0]['condition']['text']);
  }
}