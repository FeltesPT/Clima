import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'cbbe8f121c3fd448b06b4590280c040c';
const baseURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getLocationWeather() async {
    Location local = Location();
    await local.getCurrentLocation();

    NetworkHelper helper = NetworkHelper(url: "$baseURL?lat=${local.latitude}&lon=${local.longitude}&appid=$apiKey&units=metric");
    var data = await helper.getData();

    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
