import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

// import 'dart:ui_web';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:ku_t/Services/apiconnector/callapt.dart';
import 'package:unicons/unicons.dart';
import 'package:http_parser/http_parser.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mime/mime.dart';



class DropZoneWidget extends StatefulWidget {
  const DropZoneWidget({super.key});

  @override
  State<DropZoneWidget> createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropZoneWidget> {
  //late DropzoneViewController controller;
  late DropzoneViewController controller;
  bool isHightlighted = false;

  @override
  Widget build(BuildContext context) {
    final colorBackground =
        isHightlighted ? Color.fromRGBO(240, 249, 241, 1) : Colors.white;
    final colorButton = isHightlighted
        ? Color.fromRGBO(195, 231, 196, 1)
        : Color.fromRGBO(200, 200, 200, 1);

    // final colorTextIcon = isHightlighted
    //     ? Color.fromRGBO(200, 200, 200, 1)
    //     : Color.fromRGBO(195, 231, 196, 1);

    return buildDecoration(
      // color: colorBackground,
      // width: double.infinity,
      // // margin: const EdgeInsets.only(top: 20),
      // height: 500,
      child: Stack(
        children: [
          DropzoneView(
            onCreated: (controller) => this.controller = controller,
            onHover: () => setState(() => isHightlighted = true),
            onLeave: () => setState(() => isHightlighted = false),
            onDrop: acceptFile,
          ),
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                UniconsLine.cloud_upload,
                size: 80,
                color: Color.fromRGBO(200, 200, 200, 1),
                // color: colorTextIcon,
              ),
              const Text(
                'วางไฟล์ที่นี่เพื่ออัปโหลด',
                style: TextStyle(
                  color: Color.fromRGBO(110, 110, 110, 1),
                  // color: colorTextIcon,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 14),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  // primary: colorButton,
                  backgroundColor: colorButton,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                icon: const Icon(
                  Icons.search,
                  size: 20,
                ),
                label: const Text(
                  'เลือกไฟล์',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                onPressed: () async {
                  final events = await controller.pickFiles();
                  //print(events);
                  if (events.isEmpty) return;
                  acceptFile(events.first);
                },
              ),

              // ปุ่มเทส จะลบออกตอนเขียนเงื่อนไขโชว์ข้อมูลในตารางแล้ว
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/importcourse');
                },
                child: Text('table'),
              ),
            ]),
          )
        ],
      ),
    );
  }

  // สร้างกรอบให้ box ที่ใช้สำหรับ upload file
  Widget buildDecoration({required Widget child}) {
    final colorBackground =
        isHightlighted ? Color.fromRGBO(240, 249, 241, 1) : Colors.white;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
          width: double.infinity,
          height: 500,
          color: colorBackground,
          padding: EdgeInsets.all(10),
          child: DottedBorder(
              borderType: BorderType.RRect,
              color: Color.fromRGBO(200, 200, 200, 1),
              strokeWidth: 3,
              padding: EdgeInsets.zero,
              dashPattern: [8, 4],
              radius: Radius.circular(10),
              child: child)),
    );
  }

  Future acceptFile(dynamic event) async {
    // final name = event.name;
    // final mime = await controller.getFileMIME(event);
    final bytes = await controller.getFileSize(event);
    // final url = await controller.createFileUrl(event);
    // final file = await controller.getFileData(event);
    final ffile = await controller.getFileStream(event);
    //final file = event.bytes;

    // print('Name: $name');
    // print('Mime: $mime');
    // print('Bytes: $bytes');
    // print('Url: $url');
    // print('FileBytes: $file');
    //print(event.bytes);
    await sendExcelFile(ffile,bytes);

    setState(() => isHightlighted = false);
  }
}