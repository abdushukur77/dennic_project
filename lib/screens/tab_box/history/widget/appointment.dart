import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget(
      {super.key,
      required this.doctorName,
      required this.time,
      required this.status,
      required this.imageUrlDoc});

  final String doctorName;
  final String time;
  final String status;
  final String imageUrlDoc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2.w,
            blurRadius: 5.w,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrlDoc,
              width: 60.w,
              height: 60.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      'Voice Call - ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.all(8.w),
            child: Icon(Icons.call, color: Colors.blue, size: 24.sp),
          ),
        ],
      ),
    );
  }
}
