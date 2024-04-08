import 'package:flutter/cupertino.dart';

import '../utils/constants.dart';
import '../utils/utils.dart';
import 'build_text_widget.dart';

class BuildTodayWeatherWidget extends StatefulWidget {
  final String? time;
  final String? celsius;
  final String? weatherImage;
  const BuildTodayWeatherWidget(
      {super.key, this.time, this.celsius, this.weatherImage});

  @override
  State<BuildTodayWeatherWidget> createState() =>
      _BuildTodayWeatherWidgetState();
}

class _BuildTodayWeatherWidgetState extends State<BuildTodayWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context, dividedBy: 9.5),
      width: screenWidth(context, dividedBy: 7.5),
      decoration: BoxDecoration(
          color: Constants.kitGradients[1].withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          BuildTextWidget(
            text: widget.time!,
            size: 12,
            color: Constants.kitGradients[2],
          ),
          BuildTextWidget(
            text: widget.celsius!,
            size: 12,
            color: Constants.kitGradients[2],
          ),
          Image(height: 35, width: 35, image: AssetImage(widget.weatherImage!))
        ]),
      ),
    );
  }
}
