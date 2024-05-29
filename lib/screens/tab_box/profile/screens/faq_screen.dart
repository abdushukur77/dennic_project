import 'package:dennic_project/screens/top_doctor/widgets/category_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  int activeIndex = -1;
  int actIndex = -1;

  final List<String> categories = [
    "General",
    "Login",
    "Account",
    "Doctor",
    "Tips",
  ];

  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is DoctorQ?',
      'answer':
          'DoctorQ is greatest medical online consultation app platform in this century.',
    },
    {
      'question': 'How to use DoctorQ?',
      'answer':
          'DoctorQ is greatest medical online consultation app platform in this century.',
    },
    {
      'question': 'Is DoctorQ is safe for me?',
      'answer':
          'DoctorQ is greatest medical online consultation app platform in this century.',
    },
    {
      'question': 'How to schedule consultation on DoctorQ?',
      'answer':
          'DoctorQ is greatest medical online consultation app platform in this century.',
    },
    {
      'question': 'How to logout from DoctorQ?',
      'answer':
          'DoctorQ is greatest medical online consultation app platform in this century.',
    },
    {
      'question': 'Is there a free tips to get health in this app',
      'answer':
          'DoctorQ is greatest medical online consultation app platform in this century.',
    },
    {
      'question': 'Is DoctorQ free to use?',
      'answer':
          'DoctorQ is greatest medical online consultation app platform in this century.',
    },
  ];

  int? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: <Color>[AppColors.c_2972FE, AppColors.c_6499FF],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "FAQ",
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.c_09101D,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, top: 24.h),
                child: Row(
                  children: [
                    ...List.generate(categories.length, (index) {
                      return Row(
                        children: [
                          CategoryItems(
                            day: "",
                            title: categories[index],
                            isSelected: actIndex == index,
                            onTap: () {
                              actIndex = index;
                              setState(() {});
                            },
                            subtitle: '',
                          ),
                          SizedBox(
                            width: 5.w,
                          )
                        ],
                      );
                    })
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  for (var question in questions)
                    Column(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.c_5A6CEA.withOpacity(0.08),
                                blurRadius: 50.r,
                                offset: const Offset(0, 0),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: ExpansionTile(
                            backgroundColor: Colors.white,
                            collapsedBackgroundColor: Colors.white,
                            shape: InputBorder.none,
                            trailing: const Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 30,
                              color: AppColors.c_2972FE,
                            ),
                            title: Text(
                              question['question'],
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                                color: AppColors.c_2C3A4B,
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    const Divider(
                                      color: Color(0xFFEBEEF2),
                                    ),
                                    Text(
                                      question['answer'],
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        height: 1.7,
                                        color: const Color(0xFF394452),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        )
                      ],
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
