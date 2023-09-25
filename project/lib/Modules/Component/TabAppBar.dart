import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar TabAppBar() {
  return AppBar(
    toolbarHeight: 60,
    title: const Text(
      'ระบบจัดตารางสอนอาจารย์ มหาวิทยาลัยเกษตรศาสตร์',
      style: TextStyle(
        fontSize: 16,
        color: Color.fromRGBO(0, 102, 94, 1),
        fontWeight: FontWeight.bold,
      ),
    ),
    elevation: 0,
    backgroundColor: const Color.fromRGBO(195, 231, 196, 1),
  );
}
