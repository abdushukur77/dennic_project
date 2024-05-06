import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({Key? key}) : super(key: key);

  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  String pinCode = "";
  List<String> list = [];
  int _start = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget buttonItems({required String title}) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 8,
        ),
        backgroundColor: Colors.white10,
      ),
      onPressed: () {
        list = [];
        pinCode += title;
        list = pinCode.split('');
        setState(() {});
      },
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/arrow_left.svg'),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              "Verify Phone",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Please enter the code we just sent to phone number (+1) 234 567 XXX",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            SizedBox(height: 37),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(4, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: (index < pinCode.length)
                          ? Colors.white
                          : Colors.grey.shade200,
                      border: Border.all(
                          color: index < pinCode.length
                              ? Colors.blue
                              : Colors.grey.shade200),
                      shape: BoxShape.circle,
                    ),
                    child: (index < pinCode.length)
                        ? Center(
                      child: Text(
                        list[index],
                        style: TextStyle(
                            color: Colors.black, fontSize: 20),
                      ),
                    )
                        : SizedBox(),
                  );
                }),
              ],
            ),
            SizedBox(height: 37),
            Center(
              child: Text(
                "Resend code in $_start seconds",
                style: TextStyle(
                    color: Colors.black, fontSize: 16),
              ),
            ),
            SizedBox(height: 58),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.blue),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  )),
            ),
            SizedBox(height: 33),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonItems(title: "1"),
                buttonItems(title: "2"),
                buttonItems(title: "3"),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonItems(title: "4"),
                buttonItems(title: "5"),
                buttonItems(title: "6"),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonItems(title: "7"),
                buttonItems(title: "8"),
                buttonItems(title: "9"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 16,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    ".",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                buttonItems(title: "0"),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 16,
                    ),
                  ),
                  onPressed: () {
                    if (pinCode.isNotEmpty) {
                      setState(() {
                        pinCode = pinCode.substring(0, pinCode.length - 1);
                        list = pinCode.split('');
                      });
                    }
                  },
                  child: SvgPicture.asset('assets/icons/back_space.svg'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: VerifyCodeScreen(),
  ));
}
