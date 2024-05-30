import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0.h),
      child: Row(
        children: [
          Expanded(child: Text(label, style: TextStyle(fontSize: 16.0.sp))),
          Text(': ', style: TextStyle(fontSize: 16.0.sp)),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16.0.sp),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
