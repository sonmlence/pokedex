import 'package:flutter/material.dart';

class CalcButtonWidget extends StatefulWidget {
  const CalcButtonWidget({
    super.key,
    required this.text,
    this.onTap,
    this.color,
    this.textColor
  });

  final String text;
  final Function()? onTap;
  final Color? color;
  final Color? textColor;

  @override
  State<CalcButtonWidget> createState() => _CalcButtonWidgetState();
}

class _CalcButtonWidgetState extends State<CalcButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
          color: widget.color ?? Colors.white,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 24,
              color: widget.textColor != null ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
