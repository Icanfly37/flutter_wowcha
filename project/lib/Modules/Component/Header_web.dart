import 'package:flutter/material.dart';

AppBar NavBar() {
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
    fontSize: 22,
  );
}

TextStyle textStyleHeadDrop() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
}

TextStyle textStylehintbold() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
}

TextStyle textStylehint() {
  return TextStyle(
    overflow: TextOverflow.ellipsis,
    color: Colors.black,
    fontSize: 14,
  );
}

TextStyle textStylegray() {
  return TextStyle(
    color: Color.fromRGBO(110, 110, 110, 1),
    fontSize: 12,
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

TextStyle textStylered() {
  return TextStyle(
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(255, 93, 93, 1),
      fontSize: 14);
}

BoxDecoration decoration() {
  return BoxDecoration(
      color: Color.fromRGBO(230, 230, 230, 1),
      borderRadius: BorderRadius.circular(15));
}

BoxDecoration decorationgc() {
  return BoxDecoration(
      color: Color.fromRGBO(223, 241, 223, 1),
      borderRadius: BorderRadius.circular(20));
}

BoxDecoration decorationadd() {
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(230, 230, 230, 1),
            blurRadius: 15,
            offset: Offset(4, 4))
      ]);
}

BoxDecoration decorationpop() {
  return BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(15));
}

BoxDecoration decorationgreen() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: const Color.fromRGBO(0, 102, 94, 1));
}

BoxDecoration decorationred() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: const Color.fromRGBO(255, 93, 93, 1));
}

BoxDecoration decorationredborder() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: const Color.fromRGBO(255, 93, 93, 1), width: 2),
  );
}

BoxDecoration decorationblack() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Color.fromRGBO(47, 51, 55, 1));
}

BoxDecoration decorationbordergray() {
  return BoxDecoration(
    border:
        Border.all(color: const Color.fromRGBO(157, 157, 157, 1), width: 0.5),
    borderRadius: BorderRadius.circular(15),
  );
}

BoxDecoration decorationborder() {
  return BoxDecoration(
    border: Border.all(color: const Color.fromRGBO(0, 102, 94, 1), width: 2),
    borderRadius: BorderRadius.circular(15),
  );
}

BoxDecoration decorationradius() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
  );
}

InputDecoration inputdecoration() {
  return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: Color.fromRGBO(230, 230, 230, 1),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.transparent),
      ));
}

InputDecoration inputdecorationtext() {
  return InputDecoration(
      filled: true,
      fillColor: Color.fromRGBO(230, 230, 230, 1),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 1))),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 1))),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 1))),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 1))),
  );
}