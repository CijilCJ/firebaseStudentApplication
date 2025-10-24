import 'package:flutter/material.dart';

Widget textFieldWidgets(
  String name,
  String labelName,
  TextEditingController controller
){
  return TextField(
    controller: controller,
    decoration:  InputDecoration(
      fillColor: Colors.white,
      filled:  true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      hintText: name,
      label: Text(labelName),
    ),
  );
}
