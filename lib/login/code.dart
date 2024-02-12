import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/core/utils/assets.dart';
import 'package:flutter_application_2/core/widgets/custom_button.dart';
import 'package:flutter_application_2/cubit/user_cubit.dart';
import 'package:flutter_application_2/cubit/user_state.dart';
import 'package:flutter_application_2/hhhhh.dart';
import 'package:flutter_application_2/login/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Code extends StatelessWidget {
  final String phoneNumber;

  const Code({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is ActiveSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم بنجاح')),
              );
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const sssaas()));
            } else if (state is ActiveFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('حدث خطا ')),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: const Color(0xff025366),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      AssetData.logo,
                      height: 80,
                      width: 80,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Center(
                      child: Text(
                        '  كود التحقق',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      'برجاء ادخال الكود المرسل اليه ',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    OtpTextField(
                      borderRadius: BorderRadius.circular(10),
                      fieldWidth: 60,
                      // focusedBorderColor: AppColor.defaultColor,
                      numberOfFields: 4,

                      // borderColor: AppColor.defaultColor,

                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      // onCodeChanged: (codeRegister) {
                      //   //handle validation or checks here
                      // },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        
                      context.read<UserCubit>().c1  = verificationCode;

                      }, // end onSubmit

        
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     CustomTextFieldon(
                    //         controller: context.read<UserCubit>().c1,
                    //         first: true,
                    //         last: false),
                    //     CustomTextFieldon(
                    //         controller: context.read<UserCubit>().c2,
                    //         first: false,
                    //         last: false),
                    //     CustomTextFieldon(
                    //         controller: context.read<UserCubit>().c3,
                    //         first: false,
                    //         last: false),
                    //     CustomTextFieldon(
                    //         controller: context.read<UserCubit>().c4,
                    //         first: false,
                    //         last: true),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 60,
                    ),
                    state is SignInLoading
                        ? const CircularProgressIndicator()
                        : CustomButon(
                            colorborder: const Color(0xff043E4B),
                            onTap: () {
                              context.read<UserCubit>().active( context.read<UserCubit>().c1! );
                            },
                            text: 'التالي ',
                            color: const Color(0xff043E4B),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
