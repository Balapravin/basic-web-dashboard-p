import 'package:flutter/material.dart';
import 'package:webapplication/helpers/responsive.dart';
import 'package:webapplication/helpers/style.dart';
import 'package:webapplication/pages/desktop_view.dart';
import 'package:webapplication/pages/mobile_view.dart';
import 'package:webapplication/widgets/drawer.dart';
import 'package:webapplication/widgets/navbar_desktop.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKey,
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: active,
                  ),
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                ),
                title: Image.asset("assets/images/logo.png"),
                centerTitle: true,
                elevation: 0,
                backgroundColor: bgColor,
              )
            : PreferredSize(
                preferredSize: Size(screenSize.width, 1000),
                child: NavBar(),
              ),
        drawer: MobileMenu(),
        backgroundColor: bgColor,
        body: ResponsiveWidget(
          largeScreen: DesktopScreen(),
          smallScreen: MobileScreen(),
        ));
  }
}
