// ignore: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/Dropdown/SemesterModel.dart';
// import 'package:ku_t/Modules/Component/Header_web.dart';
// import 'package:ku_t/Modules/Component/Timetable.dart';
// import 'package:ku_t/Modules/Dropdown/SemesterModel.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  Widget cancellIcon() => Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 8),
        child: Icon(Icons.cancel, color: Colors.red),
      );

  Widget coloredBox(Widget child, {bool top = false, bool bottom = false}) =>
      Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: top ? Colors.blue.shade900 : Colors.transparent,
                    width: 2),
                bottom: BorderSide(
                    color: top ? Colors.blue.shade900 : Colors.transparent,
                    width: 2),
                left: BorderSide(
                    color: top ? Colors.blue.shade900 : Colors.transparent,
                    width: 2),
                right: BorderSide(
                    color: top ? Colors.blue.shade900 : Colors.transparent,
                    width: 2))),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Container(
        width: 300,
        height: 500,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder(
              verticalInside: BorderSide(color: Colors.grey.shade200),
              horizontalInside: BorderSide(color: Colors.grey.shade200),
            ),
            columnWidths: {
              0: FractionColumnWidth(.4),
              1: FractionColumnWidth(.2),
              2: FractionColumnWidth(.2),
              3: FractionColumnWidth(.2),
              4: FractionColumnWidth(.2),
            },
            children: [
              const TableRow(children: [
                SizedBox(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 16,
                    ),
                    Text('8:00'),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 16,
                    ),
                    Text('9:00'),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 16,
                    ),
                    Text('10:00'),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 16,
                    ),
                    Text('10:00'),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Text(
                  'จันทร์',
                  textAlign: TextAlign.center,
                ),
                cancellIcon(),
                cancellIcon(),
                cancellIcon(),
                cancellIcon(),
              ]),
              TableRow(children: [
                Text(
                  'อังคาร',
                  textAlign: TextAlign.center,
                ),
                cancellIcon(),
                cancellIcon(),
                cancellIcon(),
                cancellIcon(),
              ]),
              TableRow(children: [
                Text(
                  'พุธ',
                  textAlign: TextAlign.center,
                ),
                cancellIcon(),
                cancellIcon(),
                cancellIcon(),
                cancellIcon(),
              ]),
              TableRow(children: [
                Text(
                  'พฤหัสบดี',
                  textAlign: TextAlign.center,
                ),
                cancellIcon(),
                cancellIcon(),
                cancellIcon(),
                cancellIcon(),
              ]),
              TableRow(children: [
                Text(
                  'ศุกร์',
                  textAlign: TextAlign.center,
                ),
                cancellIcon(),
                cancellIcon(),
                cancellIcon(),
                cancellIcon(),
              ]),
              TableRow(children: [
                Text(
                  'เสาร์',
                  textAlign: TextAlign.center,
                ),
                cancellIcon(),
                cancellIcon(),
                cancellIcon(),
                cancellIcon(),
              ]),
              TableRow(children: [
                Text(
                  'อาทิตย์',
                  textAlign: TextAlign.center,
                ),
                cancellIcon(),
                cancellIcon(),
                cancellIcon(),
                cancellIcon(),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Container _DownloadFileExcel() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
        margin: orientation == Orientation.portrait
            ? null
            : EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        height: 50,
        // width: 100,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: decorationgreen(),
        child: TextButton(
          onPressed: () {},
          child: Text(
            'ดาวน์โหลดไฟล์ excel',
            style: textStylewhite(),
          ),
        ));
  }
}
