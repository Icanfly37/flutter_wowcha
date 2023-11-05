import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/Component/showDialogSubject.dart';
import 'package:ku_t/Modules/Dropdown/TeachernameModel.dart';
import 'package:ku_t/Modules/Dropdown/TimeEndModel.dart';
import 'package:ku_t/Modules/Dropdown/TimeStartModel.dart';
import 'package:ku_t/Modules/Dropdown/SemesterModel.dart';
import 'package:ku_t/Modules/Dropdown/YearSModel.dart';
import 'package:ku_t/Services/apiconnector/callapt.dart';
import 'package:timetable_view/timetable_view.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({Key? key}) : super(key: key);

  @override
  _TimetablePageState createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  bool firstValue = false;
  bool secondValue = false;
  bool thirdValue = false;
  bool fourthValue = false;
  List<Event> events = [];
  String? semesterValue;
  String? yearsValue;
  // get_excel _geter = get_excel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
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
            const SizedBox(height: 10),
             const Expanded(
              child: Timetable())
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        child: Text(
          "ภาคการศึกษา",
          style: textStylehintbold(),
        ),
      ),
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
      )
    ]);
  }

  Container _DownloadFileExcel() {
    final orientation = MediaQuery.of(context).orientation;
    //String? FolderPath;
    return Container(
        margin: orientation == Orientation.portrait
            ? null
            : const EdgeInsets.only(top: 20),
        width: double.infinity,
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
  const Timetable({Key? key}) : super(key: key);

  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  List<LaneEvents> weekEvents = _buildWeekEvents();
  String? selectedDay; // Initialize with a default day
  int timeIncrement = 30;
  String? _room;
  String? _timeEnd;
  String? _timeStart;
  Map<String, Color> dayColors = {
    'Monday': const Color.fromRGBO(253, 255, 228, 1),
    'Tuesday': const Color.fromRGBO(255, 232, 241, 1),
    'Wednesday': const Color.fromRGBO(236, 255, 225, 1),
    'Thursday': const Color.fromRGBO(255, 237, 226, 1),
    'Friday': const Color.fromRGBO(229, 249, 254, 1),
    'Saturday': const Color.fromRGBO(242, 241, 255, 1),
    'Sunday': const Color.fromRGBO(255, 227, 227, 1),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TimetableView(
        laneEventsList: weekEvents,
        onEventTap: onEventTapCallBack,
        timetableStyle: const TimetableStyle(
          timeItemHeight: 30,
          laneWidth: 170,
          laneHeight: 50,
          startHour: 8,
          endHour: 21,
          timeItemTextColor: Colors.black,
          visibleTimeBorder: false,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showEventDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showEventDialog(BuildContext context) {
    Event newEvent = Event();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text("เพิ่มเวลาสอน",style: textStyleHeadDrop(),textAlign: TextAlign.center,),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "หมู่เรียน",
                                style: textStylehintbold(),
                              ),
                            ),
                        TextFormField(
                          decoration: InputDecoration(
                                hintText: "800",
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
                                borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)))
                                ),
                          onChanged: (value) {
                            newEvent.studygroup = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "จำนวนที่เปิดรับ",
                                style: textStylehintbold(),
                              ),
                            ),
                        TextFormField(
                                decoration: InputDecoration(
                                hintText: "จำนวนที่เปิดรับ",
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
                                borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)))
                                ),
                                      onChanged: (value) {
                        newEvent.numberopen = value;
                                      },
                                    ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
              Expanded(
                child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "ห้องเรียน",
                                  style: textStylehintbold(),
                                ),
                              ),
                              DropdownButtonFormField(
                                decoration: InputDecoration(
                                hintText: "ห้อง",
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
                                borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)))
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return "เลือก";
                                  }
                                  return null;
                                },
                                focusColor: Colors.white,
                                dropdownColor: Colors.white,
                                isExpanded: false,
                                value: _room,
                                items: rooms
                                    .map((e) => DropdownMenuItem<String>(
                                          value: e.title,
                                          child: Text(
                                            e.title!,
                                            style: textStylehint(),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    newEvent.rooms = value!;
                                  });
                                },
                              ),
                            ],
                          ),
              ),
                ],
              ),
              
              Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "เวลาเริ่มต้น",
                                style: textStylehintbold(),
                              ),
                            ),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                hintText: "00:00",
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
                                borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)))
                                ),

                              validator: (value) {
                                if (value == null) {
                                  return "กรุณากรอก";
                                }
                                return null;
                              },
                              focusColor: Colors.white,
                              dropdownColor: Colors.white,
                              isExpanded: false,
                              value: _timeStart,
                              items: timeStart
                                  .map((e) => DropdownMenuItem<String>(
                                        value: e.title,
                                        child: Text(
                                          e.title!,
                                          style: textStylehint(),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                               var parts = value!.split(':');
                              if (parts.length == 2) {
                                newEvent.startTime = TableEventTime(
                                  hour: int.parse(parts[0]),
                                  minute: int.parse(parts[1]),
                                );
                              }
                              },
                            ),
                          ],
                        ),
            Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                e.title!,
                                style: textStylehint(),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      var parts = value!.split(':');
                      if (parts.length == 2) {
                        newEvent.startTime = TableEventTime(
                          hour: int.parse(parts[0]),
                          minute: int.parse(parts[1]),
                        );
                      }
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "เวลาสิ้นสุด",
                      style: textStylehintbold(),
                    ),
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        hintText: "00:00",
                        filled: true,
                        fillColor: const Color.fromRGBO(230, 230, 230, 1),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(230, 230, 230, 1))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(230, 230, 230, 1))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(230, 230, 230, 1))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(230, 230, 230, 1)))),

                              validator: (value) {
                                if (value == null) {
                                  return "กรุณากรอก";
                                }
                                return null;
                              },
                              focusColor: Colors.white,
                              dropdownColor: Colors.white,
                              isExpanded: false,
                              value: _timeEnd,
                              items: timeEnd
                                  .map((e) => DropdownMenuItem<String>(
                                        value: e.title,
                                        child: Text(
                                          e.title!,
                                          style: textStylehint(),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                var parts = value!.split(':');
                                if (parts.length == 2) {
                                  newEvent.endTime = TableEventTime(
                                    hour: int.parse(parts[0]),
                                    minute: int.parse(parts[1]),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "วัน",
                      style: textStylehintbold(),
                    ),
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        hintText: "เลือก",
                        filled: true,
                        fillColor: const Color.fromRGBO(230, 230, 230, 1),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(230, 230, 230, 1))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(230, 230, 230, 1))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(230, 230, 230, 1))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(230, 230, 230, 1)))),
                    value: selectedDay,
                    items: dayColors.keys.map((day) {
                      return DropdownMenuItem<String>(
                        value: day,
                        child: Text(day),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDay = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
              child: Container(
                height: 55,
                decoration: decorationredborder(),
                child: TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('ยกเลิก',
                  style: textStylered()),
                ),
              ),
            ),
            const SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 55,
                      decoration: decorationgreen(),
                      child: TextButton(
                        onPressed: () {
                          String selectedDayName = selectedDay!;
                          Color backgroundColor = dayColors[selectedDayName]!;
                          setState(() {
                            weekEvents
                                .firstWhere((element) => element.lane.name == selectedDayName)
                                .events
                                .add(TableEvent(
                                  title: "03603392-65\nSoftware Engineering\nกาญจนา เอี่ยมสอาด\nหมู่เรียน ${newEvent.studygroup}\nห้อง ${newEvent.rooms}",
                                  textStyle: textStyleblack(),
                                  startTime: newEvent.startTime,
                                  endTime: newEvent.endTime,
                                  laneIndex: 3,
                                  eventId: weekEvents
                                      .firstWhere((element) => element.lane.name == selectedDayName)
                                      .events
                                      .length +
                                      1,
                                  backgroundColor: backgroundColor,
                                ));
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text('ตกลง',
                  style: textStylewhite(),),
                      ),
                    ),
                  ),
                ],
              ),
    
            ],
          ),
        );
        }
      );
    }
  }

  List<LaneEvents> _buildWeekEvents() {
    List<LaneEvents> weekEvents = [];

    // Define the names of the days
    List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

    for (int day = 0; day < 7; day++) { // 7 days for Monday to Sunday
      weekEvents.add(LaneEvents(
        lane: Lane(name: days[day], laneIndex: 1,textStyle: textStylehintbold()),
        events: [],
      ));
    }

    return weekEvents;
  }

    void onEventTapCallBack(TableEvent event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'รายวิชา',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white,
          content: Container(
            width: 800,
            height: 500,
            child: const ShowDialogSubject(),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop(); // ปิด dialog
              },
            )
          ],
        );
      },
    );

    
  }
}

List<LaneEvents> _buildWeekEvents() {
  List<LaneEvents> weekEvents = [];

    // Define the names of the days
    List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

    for (int day = 0; day < 7; day++) { // 7 days for Monday to Sunday
      weekEvents.add(LaneEvents(
        lane: Lane(name: days[day], laneIndex: 1,textStyle: textStylehintbold()),
        events: [],
      ));
    }

  return weekEvents;
}

void onTimeSlotTappedCallBack(
    int laneIndex, TableEventTime start, TableEventTime end) {
  print(
      "Empty Slot Clicked !! LaneIndex: $laneIndex StartHour: ${start.hour} EndHour: ${end.hour}");
}
class Event {
  String title = "";
  String studygroup = "";
  String numberopen = "";
  String rooms = "";
  TableEventTime startTime = TableEventTime(hour: 0, minute: 0);
  TableEventTime endTime = TableEventTime(hour: 0, minute: 0);
}
