import 'dart:ui';
import 'package:flutter/material.dart';

import '../models/today_weather_model.dart';

class Constants {
  static const String BOX_NAME = "BloodDonation";
  static List<Color> kitGradients = [
    Colors.white, //0
    Colors.black, //1
    const Color(0xff191970), //2
    const Color(0xff7bcbec), //2
  ];
  static List<TodayWeather> todayWeather = [
    TodayWeather(
        time: '14:00',
        celsius: '32°',
        weatherImage: 'assets/icon_images/4102328_hot_sun_weather_icon.png'),
    TodayWeather(
        time: '15:00',
        celsius: '32°',
        weatherImage: 'assets/icon_images/4102328_hot_sun_weather_icon.png'),
    TodayWeather(
        time: '16:00',
        celsius: '30°',
        weatherImage:
            'assets/icon_images/4102314_cloud_cloudy_sun_sunny_weather_icon.png'),
    TodayWeather(
        time: '17:00',
        celsius: '30°',
        weatherImage:
            'assets/icon_images/4102314_cloud_cloudy_sun_sunny_weather_icon.png'),
    TodayWeather(
        time: '18:00',
        celsius: '29°',
        weatherImage: 'assets/icon_images/4102315_cloud_weather_icon.png'),
    TodayWeather(
        time: '19:00',
        celsius: '28°',
        weatherImage:
            'assets/icon_images/4102321_crescent_half_half moon_moon_night_icon.png'),
    TodayWeather(
        time: '20:00',
        celsius: '27°',
        weatherImage:
            'assets/icon_images/4102321_crescent_half_half moon_moon_night_icon.png'),
    TodayWeather(
        time: '21:00',
        celsius: '26°',
        weatherImage:
            'assets/icon_images/4102321_crescent_half_half moon_moon_night_icon.png'),
    TodayWeather(
        time: '14:00',
        celsius: '32°',
        weatherImage: 'assets/icon_images/4102328_hot_sun_weather_icon.png'),
    TodayWeather(
        time: '14:00',
        celsius: '32°',
        weatherImage: 'assets/icon_images/4102328_hot_sun_weather_icon.png'),
    TodayWeather(
        time: '19:00',
        celsius: '28°',
        weatherImage:
            'assets/icon_images/4102321_crescent_half_half moon_moon_night_icon.png'),
    TodayWeather(
        time: '19:00',
        celsius: '28°',
        weatherImage:
            'assets/icon_images/4102321_crescent_half_half moon_moon_night_icon.png'),
  ];
}
