import 'package:dennic_project/blocs/auth/auth_bloc.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/screens/tab_box/appointment/appointment_screen.dart';
import 'package:dennic_project/screens/tab_box/history/history_screen.dart';
import 'package:dennic_project/screens/tab_box/home/home_screen.dart';
import 'package:dennic_project/screens/tab_box/profile/profile_screen.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../splash/splash_screen.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const HomeScreen(),
      const AppointmentScreen(),
      const HistoryScreen(),
      const ProfileScreen()
    ];
    _userListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          IndexedStack(
            index: currentIndex,
            children: screens,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(width * .05),
              height: width * .155,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
              ),
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: width * .02),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                      HapticFeedback.lightImpact();
                    });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width:
                            index == currentIndex ? width * .32 : width * .18,
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: index == currentIndex ? width * .12 : 0,
                          width: index == currentIndex ? width * .32 : 0,
                          decoration: BoxDecoration(
                            color: index == currentIndex
                                ? Colors.blueAccent.withOpacity(.2)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width:
                            index == currentIndex ? width * .31 : width * .18,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width:
                                      index == currentIndex ? width * .13 : 0,
                                ),
                                AnimatedOpacity(
                                  opacity: index == currentIndex ? 1 : 0,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: Text(
                                    index == currentIndex
                                        ? '${listOfStrings[index]}'
                                        : '',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width:
                                      index == currentIndex ? width * .03 : 20,
                                ),
                                Icon(
                                  listOfIcons[index],
                                  size: width * .076,
                                  color: index == currentIndex
                                      ? Colors.blueAccent
                                      : Colors.black26,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _userListener() {
    BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state.formStatus == FormStatus.error) {
          if (state.statusMessage == "the_end_token") {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return const SplashScreen();
              },
            ), (route) => false);
          }
        }
      },
      child: const SizedBox(),
    );
  }

  var currentIndex = 0;

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.calendar_month,
    Icons.menu_sharp,
    Icons.person_rounded,
  ];

  List<String> listOfStrings = [
    'Home',
    'Table',
    'List',
    'Profile',
  ];
}
