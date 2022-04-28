import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final double? textSize;
  final Color color;

  const MyButton(
      {Key? key, required this.onPressed, required this.text, this.textSize, required this.color})
      : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
        ),
        backgroundColor:
        MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
      ),
      onPressed: () {
        widget.onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 100),
        child: Text(
          widget.text,
          style: TextStyle(fontSize: widget.textSize, color: widget.color),
        ),
      ),
    );
  }
}