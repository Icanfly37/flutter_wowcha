

import 'package:flutter/material.dart';

class AddTimePopup extends StatefulWidget {
  const AddTimePopup({super.key});

  @override
  State<AddTimePopup> createState() => _AddTimePopupState();
}

class _AddTimePopupState extends State<AddTimePopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 10,top: 5),
                  height: 30,
                  width: 200,
                  color: Colors.red,
                  child: Text('hello'),
                ),
                GestureDetector(
                  child: Icon(Icons.remove),
                  onTap: () {},
                )
              ],
            )
        ],)),
    );
  }
}