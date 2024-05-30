import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoColumn extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const InfoColumn({
    Key? key,
    required this.icon,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32.0.sp, color: Colors.blue),
        SizedBox(height: 8.0.h),
        Text(value, style: TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 4.0.h),
        Text(label, style: TextStyle(fontSize: 14.0.sp, color: Colors.grey)),
      ],
    );
  }
}
