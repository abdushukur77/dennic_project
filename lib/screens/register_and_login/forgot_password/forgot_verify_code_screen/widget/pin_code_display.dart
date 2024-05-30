import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinCodeDisplay extends StatelessWidget {
  final String pinCode;
  final bool isCorrect;
  final bool error;
  final Animation<Alignment> animationAlign;

  const PinCodeDisplay({
    Key? key,
    required this.pinCode,
    required this.isCorrect,
    required this.error,
    required this.animationAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = pinCode.split('');
    return Align(
      alignment: animationAlign.value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...List.generate(
            4,
            (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: (index < pinCode.length)
                      ? Colors.white
                      : Colors.grey.shade200,
                  border: Border.all(
                    color: isCorrect
                        ? Colors.green
                        : (!error && pinCode.length == 4)
                            ? Colors.red
                            : (index < pinCode.length)
                                ? Colors.blue
                                : Colors.grey.shade200,
                  ),
                  shape: BoxShape.circle,
                ),
                child: (index < pinCode.length)
                    ? Center(
                        child: Text(
                          list[index],
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.sp),
                        ),
                      )
                    : const SizedBox(),
              );
            },
          ),
        ],
      ),
    );
  }
}
