import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:unicons/unicons.dart';

class SideBarXExample extends StatelessWidget {
  const SideBarXExample({Key? key, required SidebarXController controller})
      : _controller = controller,
        super(key: key);
  final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      animationDuration: const Duration(milliseconds: 300),
      theme: const SidebarXTheme(
        itemMargin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        selectedItemMargin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        selectedItemDecoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        textStyle: TextStyle(color: Colors.white),
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 102, 94, 1),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        
        selectedIconTheme: IconThemeData(color: Color.fromRGBO(0, 102, 94, 1)),
        selectedTextStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
      ),
      extendedTheme: const SidebarXTheme(width: 250),

      // footerDivider: Divider(color:  Color.fromARGB(255, 255, 0, 0).withOpacity(0.8), height: 1,),
      headerBuilder: (context, extended) {
        return Container(
          padding: const EdgeInsets.only(top: 30),
          child: const SizedBox(
              height: 100,
              child: Text(
                'KU',
                style: TextStyle(fontSize: 30, color: Colors.white),
              )),
        );
      },

      items: const [
        SidebarXItem(
          icon: UniconsLine.table,
          label: '   การจัดการข้อมูลหลักสูตร',
        ),
        SidebarXItem(icon: UniconsLine.list_ul, label: '   การกำหนดเวลาสอน'),
        SidebarXItem(icon: UniconsLine.calendar_alt, label: '   ตารางสอน'),
      ],
    );
  }
}
