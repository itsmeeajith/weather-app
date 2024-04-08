import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/services/location_provider.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:weather_app/widgets/build_dragable_scrollable_bottom_sheet_widget.dart';
import 'package:weather_app/widgets/build_text_widget.dart';
import '../services/weather_service_provider.dart';
import '../widgets/build_today_weather_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    locationProvider.determinePosition().then((_) {
      if (locationProvider.currentLocationName != null) {
        var city = locationProvider.currentLocationName!.locality;
        if (city != null) {
          Provider.of<WeatherServiceProvider>(context, listen: false)
              .fetchWeatherDataByCity(city.toString());
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    final weatherProvider = Provider.of<WeatherServiceProvider>(context);

    int sunriseTimestamp = weatherProvider.weather?.sys?.sunrise ??
        0; // Replace 0 with a default timestamp if needed
    int sunsetTimestamp = weatherProvider.weather?.sys?.sunset ?? 0;

    DateTime sunriseDateTime =
        DateTime.fromMillisecondsSinceEpoch(sunriseTimestamp * 1000);
    DateTime sunsetDateTime =
        DateTime.fromMillisecondsSinceEpoch(sunsetTimestamp * 1000);

    // String formattedSunrise = DateFormat.Hm().format(sunriseDateTime);
    // String formattedSunset = DateFormat.Hm().format(sunsetDateTime);

    return Scaffold(
      backgroundColor: Constants.kitGradients[2],
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenHeight(context, dividedBy: 30),
                ),
                Container(
                  child: Consumer<LocationProvider>(
                      builder: (context, locationProvider, child) {
                    var locationcity;
                    if (locationProvider.currentLocationName != null) {
                      locationcity =
                          locationProvider.currentLocationName!.locality;
                    } else {
                      locationcity = 'Unknown Location';
                    }
                    return BuildTextWidget(
                        text: locationcity.toString(),
                        color: Constants.kitGradients[0],
                        fontWeight: FontWeight.bold,
                        size: 17);
                  }),
                ),
                BuildTextWidget(
                  text: 'Sun,November 16',
                  size: 9,
                  color: Constants.kitGradients[0],
                ),
                SizedBox(
                  height: screenHeight(context, dividedBy: 27),
                ),
                Lottie.asset(
                    width: screenWidth(context, dividedBy: 1.5),
                    height: screenHeight(context, dividedBy: 3),
                    'assets/lotties/Animation - 1710055335201.json'),
                Padding(
                  padding: const EdgeInsets.only(right: 165),
                  child: BuildTextWidget(
                    text: weatherProvider.weather!.weather![0].main.toString(),
                    color: Constants.kitGradients[0].withOpacity(0.6),
                    size: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      BuildTextWidget(
                        text:
                            "${weatherProvider.weather!.main!.temp?.toStringAsFixed(0)}\u00B0",
                        size: 75,
                        fontWeight: FontWeight.w500,
                        color: Constants.kitGradients[0],
                      ),
                      SizedBox(
                        width: screenWidth(context, dividedBy: 3.4),
                      ),
                      BuildTextWidget(
                          text: '^32°', color: Constants.kitGradients[0]),
                      SizedBox(
                        width: screenWidth(context, dividedBy: 11),
                      ),
                      BuildTextWidget(
                          text: '^25°', color: Constants.kitGradients[0]),
                    ],
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: BuildDragableSheetWidget(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  BuildTextWidget(
                      text: 'Good Morning',
                      fontWeight: FontWeight.w500,
                      color: Constants.kitGradients[2],
                      size: 25),
                  SizedBox(
                    height: screenHeight(context, dividedBy: 45),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: screenHeight(context, dividedBy: 8),
                            width: screenWidth(context, dividedBy: 5),
                            child: Image.asset(
                                'assets/icon_images/temperature-high.png')),
                        Column(
                          children: [
                            BuildTextWidget(
                              text: 'Temp Max',
                              color: Constants.kitGradients[2],
                              size: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            BuildTextWidget(
                                text:
                                    "${weatherProvider.weather?.main!.tempMax!.toStringAsFixed(0)} \u00B0C" ??
                                        "N/A",
                                size: 17,
                                fontWeight: FontWeight.bold,
                                color: Constants.kitGradients[2]),
                          ],
                        ),
                        Column(
                          children: [
                            BuildTextWidget(
                              text: 'Temp Min',
                              color: Constants.kitGradients[2],
                              size: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            BuildTextWidget(
                                text:
                                    "${weatherProvider.weather?.main!.tempMin!.toStringAsFixed(0)} \u00B0C" ??
                                        "N/A",
                                size: 17,
                                fontWeight: FontWeight.bold,
                                color: Constants.kitGradients[2]),
                          ],
                        ),
                        SizedBox(
                            height: screenHeight(context, dividedBy: 8),
                            width: screenWidth(context, dividedBy: 5),
                            child: Image.asset(
                                'assets/icon_images/temperature-low.png')),
                      ],
                    ),
                  ),
                  Divider(indent: 30, endIndent: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: screenHeight(context, dividedBy: 8),
                            width: screenWidth(context, dividedBy: 5),
                            child: Image.asset(
                                'assets/icon_images/4102328_hot_sun_weather_icon.png')),
                        Column(
                          children: [
                            BuildTextWidget(
                              text: 'Sunrise',
                              color: Constants.kitGradients[2],
                              size: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            BuildTextWidget(
                                text:
                                    "${weatherProvider.weather?.sys?.sunrise?.toStringAsFixed(0)} AM",
                                size: 14,
                                fontWeight: FontWeight.bold,
                                color: Constants.kitGradients[2]),
                          ],
                        ),
                        Column(
                          children: [
                            BuildTextWidget(
                              text: 'Sunset',
                              color: Constants.kitGradients[2],
                              size: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            BuildTextWidget(
                                text:
                                    "${weatherProvider.weather?.sys?.sunset?.toStringAsFixed(0)} PM",
                                size: 14,
                                fontWeight: FontWeight.bold,
                                color: Constants.kitGradients[2]),
                          ],
                        ),
                        SizedBox(
                            height: screenHeight(context, dividedBy: 8),
                            width: screenWidth(context, dividedBy: 5),
                            child: Image.asset(
                                'assets/icon_images/4102321_crescent_half_half moon_moon_night_icon.png')),
                      ],
                    ),
                  ),

                  // Wrap(
                  //   spacing: 10,
                  //   runSpacing: 6.0,
                  //   children: List.generate(
                  //     Constants.todayWeather.length,
                  //     (index) => BuildTodayWeatherWidget(
                  //       time: Constants.todayWeather[index].time,
                  //       celsius: Constants.todayWeather[index].celsius,
                  //       weatherImage:
                  //           Constants.todayWeather[index].weatherImage,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 280),
                  //   child: BuildTextWidget(
                  //       text: 'Every Day',
                  //       color: Constants.kitGradients[2],
                  //       fontWeight: FontWeight.w500),
                  // ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
