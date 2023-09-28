import 'package:flutter/material.dart';
// import 'package:ku_t/Modules/Componemt/SideAppBar.dart';
import 'package:ku_t/Modules/ManagerPage/ManagerPageRoute.dart';
import 'package:ku_t/Modules/ManagerPage/Teachingtime/tabletime.dart';
import 'package:ku_t/Modules/Component/SideAppBar.dart';
// import 'package:ku_t/Modules/ManagerPage/ManagerImportPage.dart';
import 'package:ku_t/Modules/ManagerPage/Timetable/TimetablePage.dart';
import 'package:sidebarx/sidebarx.dart';

class router extends StatefulWidget {
  const router({Key? key, required SidebarXController controller})
      : _controller = controller,
        super(key: key);
  final SidebarXController _controller;
  @override
  _router createState() => _router();
}

class _router extends State<router> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 500;
          return Scaffold(
            body: Row(
              children: [
                if (!isSmallScreen) SideBar(controller: widget._controller),
                Expanded(
                    child: Center(
                  child: AnimatedBuilder(
                    animation: widget._controller,
                    builder: (context, child) {
                      switch (widget._controller.selectedIndex) {
                        case 0:
                          _key.currentState?.closeDrawer();
                          return const ManagerPageRoute();

                        //------------------------on test---------------------------------

                        //return ImportPage();

                        //----------------------------------------------------------------
                        case 1:
                          _key.currentState?.closeDrawer();
                          return Tabletime();
                        case 2:
                          _key.currentState?.closeDrawer();
                          return const TimetablePage();
                        case 3:
                          _key.currentState?.closeDrawer();
                          return Texte();
                        default:
                          return const Center(
                            child: Text(
                              'Home',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          );
                      }
                    },
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }

  // Center TextOne() {
  //   return Center(child: Text("ตารางสอน"));
  // }

  Center TextOe() {
    return Center(child: Text("กำหนดเวลาสอน"));
  }

  Center Texte() {
    return Center(child: Text("ว"));
  }
}
