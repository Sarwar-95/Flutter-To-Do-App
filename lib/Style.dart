import 'package:flutter/material.dart';

//=============================================
InputDecoration appInputDecoration() {
  return const InputDecoration(
    // border: OutlineInputBorder(),
    contentPadding: EdgeInsets.all(10),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black,width: 3)
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey,width: 3)
    ),
    hintText: "Input Item",
    filled: true,
    fillColor: Colors.white,
  );
}

//=============================================
ButtonStyle appButtonStyle() {
  return ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(11),
      backgroundColor: Colors.brown[500]);
}

//=============================================
SizedBox sizedBox50(child) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: child,
    ),
  );
}
