import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/blocs/sent_support/sent_support_bloc.dart';
import 'package:dennic_project/data/model/support/support_model.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  Future<void> _send(SupportModel supportModel) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<SentSupportBloc>().add(
            SendSupportEvent(
              supportModel,
            ),
          );
    }
  }

  bool isFull = false;

  void valueCheck(String value) {
    if (fullNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        messageController.text.isNotEmpty) {
      setState(() {
        isFull = true;
      });
    } else {
      setState(() {
        isFull = false;
      });
    }
  }
@override
  void dispose() {
  messageController.dispose();
  phoneController.dispose();
  emailController.dispose();
  fullNameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
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
          "Contact us",
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.c_09101D,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocListener<SentSupportBloc, SentSupportState>(
                  listener: (s, p) {
                    if (p.formStatus == FormStatus.success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'SUPPORT SEND SUCCESSFULLY',
                          ),
                        ),
                      );
                      context.read<SentSupportBloc>().add(
                            ChangeSentSupportInitialEvent(),
                          );
                    }
                  },
                  child: const SizedBox.shrink(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.w, bottom: 8.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Full Name",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: AppColors.c_2C3A4B,
                          ),
                        ),
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFFDA1414),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.c_5A6CEA.withOpacity(0.08),
                        blurRadius: 50.r,
                        offset: const Offset(12.0, 26.0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: TextFormField(
                    controller: fullNameController,
                    onChanged: valueCheck,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter your full name";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100.r),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(
                          color: AppColors.cEBEEF2,
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(
                          color: AppColors.c_2972FE,
                          width: 1.w,
                        ),
                      ),
                      hintText: "Full Name",
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.5.h,
                        color: const Color(0xFFDADEE3),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.w, bottom: 8.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Email",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: AppColors.c_2C3A4B,
                          ),
                        ),
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFFDA1414),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.c_5A6CEA.withOpacity(0.08),
                        blurRadius: 50.r,
                        offset: const Offset(12.0, 26.0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: TextFormField(
                    controller: emailController,
                    onChanged: valueCheck,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter your email";
                      } else if (!value.contains('@')) {
                        return "Enter is invalid!";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100.r),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(
                          color: AppColors.cEBEEF2,
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(
                          color: AppColors.c_2972FE,
                          width: 1.w,
                        ),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.5.h,
                        color: const Color(0xFFDADEE3),
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: Icon(
                          Icons.mail,
                          color: AppColors.c_858C94,
                        ),
                      ),
                    ),
                  ),
                ), SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.w, bottom: 8.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Phone number",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: AppColors.c_2C3A4B,
                          ),
                        ),
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFFDA1414),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.c_5A6CEA.withOpacity(0.08),
                        blurRadius: 50.r,
                        offset: const Offset(12.0, 26.0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: TextFormField(
                    controller: phoneController,
                    onChanged: valueCheck,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter your phone number";
                      } else if (!value.startsWith('+')) {
                        return "Enter is invalid!";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100.r),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(
                          color: AppColors.cEBEEF2,
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(
                          color: AppColors.c_2972FE,
                          width: 1.w,
                        ),
                      ),
                      hintText: "Phone number",
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.5.h,
                        color: const Color(0xFFDADEE3),
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: Icon(
                          Icons.phone,
                          color: AppColors.c_858C94,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.w, bottom: 8.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Message",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: AppColors.c_2C3A4B,
                          ),
                        ),
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFFDA1414),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.c_5A6CEA.withOpacity(0.08),
                        blurRadius: 50.r,
                        offset: const Offset(12.0, 26.0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: SizedBox(
                    child: TextFormField(
                      controller: messageController,
                      onChanged: valueCheck,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Fill this space!";
                        }
                        return null;
                      },
                      maxLines: 10,
                      minLines: 5,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.r),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 12.h,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                            color: AppColors.cEBEEF2,
                            width: 1.w,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                            color: AppColors.c_2972FE,
                            width: 1.w,
                          ),
                        ),
                        hintText: "Message",
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.5.h,
                          color: const Color(0xFFDADEE3),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 55.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      SupportModel supportModel = SupportModel(
                        email: emailController.text,
                        fullName: fullNameController.text,
                        message: messageController.text,
                        phoneNumber: phoneController.text,
                      );

                      await _send(
                        supportModel,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isFull
                          ? const Color(0xFF6499FF)
                          : const Color(0xFF93B8FE),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Send message",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        const Icon(
                          Icons.send,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
