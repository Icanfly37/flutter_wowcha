import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Component/DropZoneWidget.dart';
// import 'package:unicons/unicons.dart';

class ImportCourse extends StatefulWidget {
  const ImportCourse({super.key});

  @override
  State<ImportCourse> createState() => _ImportCourseState();
}

class _ImportCourseState extends State<ImportCourse> {
  // late TextEditingController controller;

  // @override
  // void dispose() {
  //   controller.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          _headerImportCourse(),
          const Divider(height: 26),
          Container(
              alignment: Alignment.topLeft,
              child: orientation == Orientation.portrait //short if/else
                  ? Column(
                      //is if
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ButtonDownloadFile(),
                        const SizedBox(height: 10),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _ButtonDownloadFile(),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    )),
          // _AddCourseFile(),
          const DropZoneWidget()
        ],
      ),
    );
  }

  Container _headerImportCourse() {
    return Container(
      alignment: Alignment.topLeft,
      child: const Text(
        "การนำเข้าข้อมูลหลักสูตร",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container _ButtonDownloadFile() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: 150,
      height: 50,
      // alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(0, 102, 94, 1)),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'ดาวน์โหลดแบบฟอร์ม',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  // Container _AddCourseFile() {
  //   return Container(
  //     width: double.infinity,
  //     margin: const EdgeInsets.only(top: 10),
  //     height: 485,
  //     decoration: BoxDecoration(
  //       border: Border.all(
  //         color: const Color.fromRGBO(157, 157, 157, 1),
  //         width: 2,
  //         style: BorderStyle.solid,
  //       ),
  //       borderRadius: BorderRadius.circular(15),
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         TextButton(
  //           onPressed: () {
  //             // print('เจ๋งแจ๋ว');
  //             print("นำเข้าหลักสูตร");
  //             Navigator.pushNamed(context, '/importcourse');
  //           },
  //           child: const Text(
  //             'คลิกที่นี่เพื่อเพิ่มไฟล์',
  //             style: TextStyle(
  //               color: Color.fromRGBO(110, 110, 110, 1),
  //               fontSize: 14,
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //         IconButton(
  //           alignment: Alignment.center,
  //           icon: const Center(
  //             child: Icon(
  //               UniconsLine.cloud_upload,
  //               size: 60.0,
  //               color: Color.fromRGBO(171, 171, 171, 1),
  //             ),
  //           ),
  //           onPressed: () {
  //             // print('เจ๋งแจ๋ว');
  //             print("นำเข้าหลักสูตร");
  //             Navigator.pushNamed(context, '/importcourse');
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

