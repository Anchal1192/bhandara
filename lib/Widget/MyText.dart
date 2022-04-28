import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyText extends StatefulWidget {
  final String? text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final VoidCallback? onClick;

  MyText({
    @required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.onClick,
  });

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: widget.onClick,
      child: Text(
        widget.text!,
        style: TextStyle(
          fontSize: widget.size,
          fontWeight: widget.fontWeight,
          color: widget.color,
        ),
      )
    );
  }
}