import 'package:dio_log/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeText extends StatefulWidget {
  final String? text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? textcolor;
  final TextStyle? style;

  const CustomeText({
    Key? key,
    this.text,
    this.size,
    this.fontWeight,
    this.textcolor,
    this.style,
  }) : super(key: key);

  @override
  State<CustomeText> createState() => _CustomeTextState();
}

class _CustomeTextState extends State<CustomeText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text!,
      style:widget.style,
    );
  }
}
