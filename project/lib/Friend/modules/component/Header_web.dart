import 'package:flutter/material.dart';

AppBar NavBar(){
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

TextStyle textStyleHeader() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );
}

TextStyle textStyleHeadDrop() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
}

TextStyle textStylehint() {
  return TextStyle(
    fontSize: 14,
  );
}

TextStyle textStylegreen() {
  return TextStyle(
    color: Color.fromRGBO(0, 102, 94, 1),
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
    fontSize: 14);
}

TextStyle textStylewhite() {
  return TextStyle(
    color: Colors.white, 
    fontWeight: FontWeight.bold, 
    overflow: TextOverflow.ellipsis,
    fontSize: 14);
}

BoxDecoration decoration() {
  return BoxDecoration(
    color: Color.fromRGBO(230, 230, 230, 1),
    borderRadius: BorderRadius.circular(15)
    );
}

BoxDecoration decorationpop() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15)
    );
}

BoxDecoration decorationgreen() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(0, 102, 94, 1)
    );
}

BoxDecoration decorationblack() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Color.fromRGBO(47, 51, 55, 1));
}

BoxDecoration decorationborder() {
  return BoxDecoration(
   border:
        Border.all(color: const Color.fromRGBO(0, 102, 94, 1), width: 2),
        borderRadius: BorderRadius.circular(15),
    );
}