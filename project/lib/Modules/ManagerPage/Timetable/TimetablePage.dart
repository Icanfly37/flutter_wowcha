import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:http/http.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/ManagerPage/Timetable/operate.dart';
import 'package:ku_t/Services/apiconnector/callapt.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timetable_view/timetable_view.dart';
import 'package:ku_t/Modules/Dropdown/SemesterModel.dart';
import 'package:ku_t/Modules/Dropdown/YearSModel.dart';



class Event {
  String title;
  TimeOfDay startTime;
  TimeOfDay endTime;
  List<int> daysOfWeek;
  Color color; // Color attribute for the event

  Event({
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.daysOfWeek,
    required this.color,
  });
}


class TimetablePage extends StatefulWidget {
  TimetablePage({Key? key}) : super(key: key);

  @override
  _TimetablePageState createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {

  String? semesterValue;
  String? yearsValue;

  bool firstValue = false;
  bool secondValue = false;
  bool thirdValue = false;
  bool fourthValue = false;
  List<Event> events = [];
  
  //get_excel _geter = get_excel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            _header(),
          const Divider(height: 30),
            Row(
              children: [
                _selectSemester(),
                const SizedBox(width: 10),
                _selectYearS(),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: _checkBox()),
                const SizedBox(width: 200),
                Expanded(
                  child: _DownloadFileExcel())
              ],
            ),
            const SizedBox(height: 20),
            Timetable()
          ]),
      ),
    );
  }

  Container _header() {
    return Container(
      alignment: Alignment.topLeft,
      child: const Text(
        "ตารางสอน",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        // onEmptySlotTap: onTimeSlotTappedCallBack,
      ),
    );
  }

  Container _selectSemester() {
  final orientation = MediaQuery.of(context).orientation;
  return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    Container(
      child: Text(
        "ภาคการศึกษา",
        style: textStylehintbold(),
      ),),
      Container(
      width: orientation == Orientation.portrait ? double.infinity : 100,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: decoration(),
      child: DropdownButton(
          hint: Text("เลือก", style: textStylehint()),
          underline: const SizedBox(),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          focusColor: Colors.white,
          dropdownColor: Colors.white,
          isExpanded: true,
          value: semesterValue,
          items: semester
              .map((e) => DropdownMenuItem<String?>(
                  value: e.title,
                  child: Text(
                    e.title!,
                    style: textStylehint(),
                  )))
              .toList(),
          onChanged: (value) {
            setState(() {
              semesterValue = value.toString();
            });
          }),
    )

  ]));
}

Container _selectYearS() {
  final orientation = MediaQuery.of(context).orientation;
  return Container(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        child: Text(
          "ปีการศึกษา",
          style: textStylehintbold(),
        ),
      ),
      Container(
        width: orientation == Orientation.portrait ? double.infinity : 100,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: decoration(),
        child: DropdownButton(
            hint: Text("เลือก", style: textStylehint()),
            underline: const SizedBox(),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            focusColor: Colors.white,
            dropdownColor: Colors.white,
            isExpanded: true,
            value: yearsValue,
            items: years
                .map((e) => DropdownMenuItem<String?>(
                    value: e.title,
                    child: Text(e.title!, style: textStylehint())))
                .toList(),
            onChanged: (value) {
              setState(() {
                yearsValue = value.toString();
              });
            }),
      ),
    ],
  ));
}

Column _checkBox() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        alignment: Alignment.bottomLeft,
        child: Text(
          "ชั้นปี",
          style: textStylehintbold(),
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              decoration: decorationgc(),
              child: Row(
                children: [
                  Expanded(
                    child: Checkbox(
                        value: firstValue,
                        onChanged: (value) {
                          setState(() {
                            firstValue = value!;
                          });
                        }),
                  ),
                  Expanded(
                    child: Text(
                      "T12-1",
                      style: textStylehint(),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              decoration: decorationgc(),
              child: Row(
                children: [
                  Expanded(
                    child: Checkbox(
                        value: secondValue,
                        onChanged: (value) {
                          setState(() {
                            secondValue = value!;
                          });
                        }),
                  ),
                  Expanded(
                    child: Text(
                      "T12-2",
                      style: textStylehint(),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              decoration: decorationgc(),
              child: Row(
                children: [
                  Expanded(
                    child: Checkbox(
                        value: thirdValue,
                        onChanged: (value) {
                          setState(() {
                            thirdValue = value!;
                          });
                        }),
                  ),
                  Expanded(
                    child: Text(
                      "T12-3",
                      style: textStylehint(),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: 48,
              decoration: decorationgc(),
              child: Row(
                children: [
                  Expanded(
                    child: Checkbox(
                        value: fourthValue,
                        onChanged: (value) {
                          setState(() {
                            fourthValue = value!;
                          });
                        }),
                  ),
                  Expanded(
                    child: Text(
                      "T12-4",
                      style: textStylehint(),
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      )]
      );
}
  Container _DownloadFileExcel() {
    final orientation = MediaQuery.of(context).orientation;
    //String? FolderPath;
    return Container(
        margin: orientation == Orientation.portrait
            ? null
            : const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        height: 50,
        // width: 100,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: decorationgreen(),
        child: TextButton(
          onPressed: () {
            getExcelFile();
            //getExcelFile("C:/Users/Icanfly37/Desktop/testexcelrecieve/test.xlsx");
          },
          child: Text(
            'ดาวน์โหลดไฟล์ excel',
            style: textStylewhite(),
          ),

        ));
  }
}



class Timetable extends StatefulWidget {
  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  List<Event> events = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 480,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(0, 102, 94, 1),
        ),
      ),
      child: Scaffold(
        body: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'วัน/เวลา',
                      style: textStylehintbold(),
                    ),
                  ),
                ), // Empty cell to fill the gap
                for (var hour = 8; hour <= 20; hour++)
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: TableCell(
                      child: Text(
                        '$hour:00',
                        style: const TextStyle(),
                      ),
                    ),
                  ),
              ],
            ),
            for (var day = 0; day < 7; day++)
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: TableCell(
                      child: Text(getDayName(day),
                          style: textStylehintbold()),
                    ),
                  ),
                  for (var hour = 8; hour <= 20; hour++)
                    TableCell(
                      child: EventCell(
                        day: day,
                        hour: hour,
                        events: events,
                      ),
                    ),
                ],
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddEventDialog(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  String getDayName(int day) {
    return ['จันทร์', 'อังคาร', 'พุธ', 'พฤหัสบดี', 'ศุกร์', 'เสาร์', 'อาทิตย์'][day];
  }

  void _showAddEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('เพิ่มเวลา'),
          content: AddEventForm(
            onEventAdded: (event) {
              setState(() {
                events.add(event);
              });
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }
}


class EventCell extends StatelessWidget {
  final int day;
  final int hour;
  final List<Event> events;

  EventCell({
    required this.day,
    required this.hour,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final currentDateTime = DateTime(now.year, now.month, now.day, hour);
    final currentDayOfWeek = currentDateTime.weekday;

    final cellEvents = events.where((event) {
      return event.daysOfWeek.contains(day) &&
          event.startTime.hour <= hour &&
          event.endTime.hour >= hour;
    }).toList();

    return GestureDetector(
      onTap: () {
        _showEventDetails(context, cellEvents);
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: cellEvents.isNotEmpty ? BorderRadius.circular(15) : null,
          color: cellEvents.isNotEmpty ? cellEvents[0].color : Colors.white,
        ),
        child: Column(
          children: cellEvents.map((event) {
            return Text(event.title, style: const TextStyle(color: Colors.black));
          }).toList(),
        ),
      ),
    );
  }

  void _showEventDetails(BuildContext context, List<Event> cellEvents) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Event Details'),
          content: Column(
            children: cellEvents.map((event) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: event.color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  event.title,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}


class AddEventForm extends StatefulWidget {
  final Function(Event) onEventAdded;

  AddEventForm({required this.onEventAdded});

  @override
  _AddEventFormState createState() => _AddEventFormState();
}

class _AddEventFormState extends State<AddEventForm> {
  String title = '';
  TimeOfDay startTime = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 9, minute: 0);
  List<int> daysOfWeek = [0];
  Color eventColor = Colors.white;

  final Map<int, Color> dayOfWeekColors = {
    0: Color.fromRGBO(253, 255, 228, 1), // Monday
    1: Color.fromRGBO(255, 232, 241, 1),  
    2: Color.fromRGBO(236, 255, 225, 1), 
    3: Color.fromRGBO(255, 237, 226, 1), 
    4: Color.fromRGBO(229, 249, 254, 1), 
    5: Color.fromRGBO(242, 241, 255, 1), 
    6: Color.fromRGBO(255, 227, 227, 1), 
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          onChanged: (value) => title = value,
          decoration: const InputDecoration(labelText: 'วิชา'),
        ),
        Row(
          children: [
            Text('เวลาเริ่มต้น : ${startTime.format(context)}'),
            IconButton(
              onPressed: () => _selectStartTime(context),
              icon: const Icon(Icons.access_time),
            ),
          ],
        ),
        Row(
          children: [
            Text('เวลาสิ้นสุด : ${endTime.format(context)}'),
            IconButton(
              onPressed: () => _selectEndTime(context),
              icon: const Icon(Icons.access_time),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('จันทร์'),
          value: daysOfWeek.contains(0),
          onChanged: (value) {
            setState(() {
              if (value!) {
                daysOfWeek.add(0);
              } else {
                daysOfWeek.remove(0);
              }
            });
          },
        ),
        CheckboxListTile(
          title: const Text('อังคาร'),
          value: daysOfWeek.contains(1),
          onChanged: (value) {
            setState(() {
              if (value!) {
                daysOfWeek.add(1);
              } else {
                daysOfWeek.remove(1);
              }
            });
          },
        ),
        CheckboxListTile(
          title: const Text('พุธ'),
          value: daysOfWeek.contains(2),
          onChanged: (value) {
            setState(() {
              if (value!) {
                daysOfWeek.add(2);
              } else {
                daysOfWeek.remove(2);
              }
            });
          },
        ),
        CheckboxListTile(
          title: const Text('พฤหัสบดี'),
          value: daysOfWeek.contains(3),
          onChanged: (value) {
            setState(() {
              if (value!) {
                daysOfWeek.add(3);
              } else {
                daysOfWeek.remove(3);
              }
            });
          },
        ),
        CheckboxListTile(
          title: const Text('ศุกร์'),
          value: daysOfWeek.contains(4),
          onChanged: (value) {
            setState(() {
              if (value!) {
                daysOfWeek.add(4);
              } else {
                daysOfWeek.remove(4);
              }
            });
          },
        ),
        CheckboxListTile(
          title: const Text('เสาร์'),
          value: daysOfWeek.contains(5),
          onChanged: (value) {
            setState(() {
              if (value!) {
                daysOfWeek.add(5);
              } else {
                daysOfWeek.remove(5);
              }
            });
          },
        ),
        CheckboxListTile(
          title: const Text('อาทิตย์'),
          value: daysOfWeek.contains(6),
          onChanged: (value) {
            setState(() {
              if (value!) {
                daysOfWeek.add(6);
              } else {
                daysOfWeek.remove(6);
              }
            });
          },
        ),
        ElevatedButton(
      onPressed: () {
        final dayOfWeek = daysOfWeek.first;
        final eventColor = dayOfWeekColors[dayOfWeek] ??  Colors.white; // Default to blue
        final event = Event(
          title: title,
          startTime: startTime,
          endTime: endTime,
          daysOfWeek: daysOfWeek,
          color: eventColor, // Use the calculated color
        );
        widget.onEventAdded(event);
      },
      child: const Text('Add Event'),
    ),
      ],
    );
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final newTime = await showTimePicker(
      context: context,
      initialTime: startTime,
    );
    if (newTime != null) {
      setState(() {
        startTime = newTime;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final newTime = await showTimePicker(
      context: context,
      initialTime: endTime,
    );
    if (newTime != null) {
      setState(() {
        endTime = newTime;
      });
    }
  }

  void onEventTapCallBack(TableEvent event) {
    print(
        "Event Clicked!! LaneIndex ${event.laneIndex} Title: ${event.title} StartHour: ${event.startTime.hour} EndHour: ${event.endTime.hour}");
  Future<void> _selectEndTime(BuildContext context) async {
    final newTime = await showTimePicker(
      context: context,
      initialTime: endTime,
    );
    if (newTime != null) {
      setState(() {
        endTime = newTime;
      });
    }
  }

  void onTimeSlotTappedCallBack(
      int laneIndex, TableEventTime start, TableEventTime end) {
    print(
        "Empty Slot Clicked !! LaneIndex: $laneIndex StartHour: ${start.hour} EndHour: ${end.hour}");
  Future<void> _selectEventColor(BuildContext context) async {
    Color? selectedColor = eventColor;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Event Color'),
          content: ColorPicker(
            pickerColor: selectedColor!,
            onColorChanged: (color) {
              selectedColor = color;
            },
            colorPickerWidth: 300.0,
            pickerAreaHeightPercent: 0.7,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(selectedColor);
              },
              child: const Text('Select'),
            ),
          ],
        );
      },
    );

    if (selectedColor != null) {
      setState(() {
        eventColor = selectedColor!;
      });
    }
  }
}
}}