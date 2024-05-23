import 'package:dennic_project/screens/top_doctor/widgets/category_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/styles/app_text_style.dart';
import '../../detail/widgets/global_button.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String selectedTime = '09.00 AM';
  String selectedAppointmentType = 'Messaging';

  int activeIndex = -1;
  int actIndex = -1;

  final List<String> times = [
    '09.00 AM',
    '10.00 AM',
    '11.00 AM',
    '13.00 PM',
    '14.00 PM',
    '15.00 PM',
    '17.00 PM',
    '18.00 PM',
    '19.00 PM'
  ];

  final List<Map<String, String>> appointmentTypes = [
    {'type': 'Messaging', 'price': '\$5'},
    {'type': 'Voice Call', 'price': '\$10'},
    {'type': 'Video Call', 'price': '\$20'},
  ];

  @override
  Widget build(BuildContext context) {
    bool isMorning = true;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Appointment',
          style: AppTextStyle.urbanistMedium.copyWith(fontSize: 26.sp),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Monday, March 25 2022',

              style: AppTextStyle.urbanistMedium.copyWith(fontSize: 16.sp),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  CategoryItems(
                      title: "Morning",
                      isSelected: activeIndex == -1,
                      onTap: () {
                        setState(() {
                          activeIndex = -1;
                        });
                      }),
                  CategoryItems(
                      title: "Evening",
                      isSelected: activeIndex == 1,
                      onTap: () {
                        setState(() {
                          activeIndex = 1;
                        });
                      }),
                ],
              ),
              const SizedBox(height: 20),
               Text(
                'Choose the Hour',

                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Wrap(
                runSpacing: 10.w,
                spacing: 3.h,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ...List.generate(times.length, (index) {
                    return CategoryItems(
                      title: times[index],
                      isSelected: actIndex == index,
                      onTap: () {
                        actIndex = index;
                        setState(() {});
                      },
                    );
                  })
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'Fee Information',
                style: AppTextStyle.urbanistMedium
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Column(
                children: appointmentTypes.map((appointment) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAppointmentType = appointment['type']!;
                      });
                    },
                    child: Container(

                        margin: EdgeInsets.symmetric(
                            vertical: 12.h, ),
                        padding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 24.w),
                        decoration: BoxDecoration(
                            color:
                                selectedAppointmentType == appointment['type']
                                    ? Colors.blue[100]
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(16.w),
                              child: Icon(Icons.message),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle),
                            ),
                            SizedBox(width: 10.w),
                            Text(appointment['type']!),
                            Spacer(),
                            Text(appointment['price']!),
                          ],
                        )),
                  );
                }).toList(),
              ),
              GlobalButton(title: "Next ", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
