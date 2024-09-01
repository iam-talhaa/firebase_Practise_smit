import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Custom_button extends StatelessWidget {
  final B_color;
  final VoidCallback ontap;
  final B_text;
  final B_height;
  final B_width;

  Custom_button(
      {super.key,
      required this.B_color,
      required this.ontap,
      required this.B_text,
      required this.B_height,
      required this.B_width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: B_height,
        width: B_width,
        decoration: BoxDecoration(
            color: B_color, borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          B_text,
          style: TextStyle(fontSize: 20),
        )),
      ),
    );
  }
}
