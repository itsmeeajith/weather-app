import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class BuildTextWidget extends StatefulWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? size;
  final String? fontFamily;
  const BuildTextWidget(
      {super.key,
      required this.text,
      this.color,
      this.fontWeight,
      this.size,
      this.fontFamily});

  @override
  State<BuildTextWidget> createState() => _BuildTextWidgetState();
}

class _BuildTextWidgetState extends State<BuildTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: widget.color,
        fontWeight: widget.fontWeight,
        fontSize: widget.size,
        fontFamily: widget.fontFamily,
      ),
    );
  }
}
