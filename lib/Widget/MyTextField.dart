import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatefulWidget {
  final String? hintText;
  final Function(String)? value;
  final bool? obscureText;
  final bool? autofocus;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final bool? readOnly;
  final int? maxLength;
  final List<TextInputFormatter>? textInputFormatter;

  MyTextField(
      {Key? key,
        this.hintText,
        this.value,
        this.obscureText,
        this.autofocus,
        this.controller,
        this.focusNode,
        this.textInputType,
        this.readOnly,
        this.maxLength,
        this.textInputFormatter
      }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius:  BorderRadius.all(const Radius.circular(8)),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 3, offset: Offset(0, 1)) // changes position of shadow
        ],
      ),
      child: TextField(
        autofocus: widget.autofocus == null ? false : true,
        obscureText: widget.obscureText == null ? false : true,
        readOnly: widget.readOnly==null?false:true,
        focusNode: widget.focusNode,
        autocorrect: false,
        keyboardType: widget.textInputType,
        controller: widget.controller,
        maxLength: widget.maxLength,
        onChanged: (s) {
          widget.value!(s);
        },
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();

        },
        inputFormatters: widget.textInputFormatter,
        cursorColor: Colors.amber,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.grey[600],
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          isDense: true,
          counterText: '',
          errorStyle: TextStyle(height: 1.5),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
