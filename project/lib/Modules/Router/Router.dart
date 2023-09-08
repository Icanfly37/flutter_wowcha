import 'package:flutter/material.dart';
import 'package:ku_t/Modules/ManagerPage/ManagerPageRoute.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:ku_t/Modules/Componemt/sidebar.dart';

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
                if (!isSmallScreen)
                  SideBarXExample(controller: widget._controller),
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
                          return const ImportPage();
                        case 2:
                          _key.currentState?.closeDrawer();
                          return const Center(
                            child: Text(
                              'Settings',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          );
                        case 3:
                          _key.currentState?.closeDrawer();
                          return const Center(
                            child: Text(
                              'Theme',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          );
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
}
