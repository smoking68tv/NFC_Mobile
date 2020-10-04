import 'package:flutter/material.dart';
import 'package:new_nfc/configs/ui.dart';
import 'package:new_nfc/widgets/navidation_drawer/nav_drawer.dart';
// import 'package:nfc_tags/Constant/constant.dart';
// import 'package:nfc_tags/Providers/tasks.dart';
// import 'package:nfc_tags/Widgets/badge.dart';
// import 'package:nfc_tags/Widgets/drawer.dart';
// import 'package:provider/provider.dart';

class AppBarWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AppBar setAppBar(BuildContext context,
      {String title,
      IconData icon = Icons.arrow_back,
      Function callbackFunc,
      bool isDrawer = false,
      bool showTasks = true}) {
    return AppBar(
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: false,
        backgroundColor: BACKGROUND_COLOR_START,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Builder(
              builder: (context) => (IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: ICON_DEFAULT_COLOR,
                      size: 35.0,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  )))
        ]
        // leading: isDrawer
        //     ? Builder(
        //         builder: (context) => (IconButton(
        //               icon: Icon(
        //                 icon,
        //               ),
        //               onPressed: () {
        //                 Navigator.of(context).pop();
        //               },
        //             )))
        //     : InkWell(
        //         child: Icon(
        //           icon,
        //           textDirection: TextDirection.ltr,
        //         ),
        //         onTap: () => callbackFunc(),
        //       ),
        // actions: isDrawer
        //     ? <Widget>[
        //         Container(),
        //       ]
        //     : <Widget>[
        //         !showTasks
        //             ? Container()
        //             : Builder(
        //                 builder: (context) => (Consumer<TaskConfig>(
        //                   builder: (_, tasks, ch) => Badge(
        //                     child: ch,
        //                     value: tasks.count.toString(),
        //                   ),
        //                   child: IconButton(
        //                     icon: Icon(
        //                       Icons.menu,
        //                     ),
        //                     onPressed: () {
        //                       Scaffold.of(context).openEndDrawer();
        //                       // AppDrawer();
        //                       // Navigator.of(context).pushNamed(CartScreen.routeName);
        //                     },
        //                   ),
        //                 )),
        //               ),
        //         SizedBox(width: 10)
        //       ],
        );
  }
}
