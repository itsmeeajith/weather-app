import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart';

class BuildDragableSheetWidget extends StatefulWidget {
  final Widget child;
  const BuildDragableSheetWidget({super.key, required this.child});

  @override
  State<BuildDragableSheetWidget> createState() =>
      _BuildDragableSheetWidgetState();
}

class _BuildDragableSheetWidgetState extends State<BuildDragableSheetWidget> {
  // final sheet = GlobalKey();
  final controller = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints) {
      return DraggableScrollableSheet(
          // key: sheet,
          initialChildSize: 0.3,
          maxChildSize: 0.4,
          minChildSize: 0.30,

          // expand: true,
          // snap: true,
          // snapSizes: [60 / constraints.maxHeight, 0.5],
          builder: (BuildContext context, ScrollController scrollController) {
            return DecoratedBox(
              decoration: BoxDecoration(
                  color: Constants.kitGradients[0],
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22))),
              child: CustomScrollView(controller: scrollController, slivers: [
                SliverToBoxAdapter(
                  child: widget.child,
                )
              ]),
            );
          });
    });
  }
}
