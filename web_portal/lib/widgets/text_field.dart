import "package:flutter/material.dart";


class TField extends StatefulWidget {
  String hText;
  Icon? preIcon;
  TextEditingController controller;
  TField({ this.preIcon,required this.hText, required this.controller, Key? key})
      : super(key: key);
  @override
  State<TField> createState() => _TFieldState();
}
class _TFieldState extends State<TField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: widget.preIcon ?? null,
          hintText: widget.hText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}