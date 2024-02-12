import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/core/utils/assets.dart';
import 'package:flutter_application_2/core/widgets/custom_button.dart';
import 'package:flutter_application_2/cubit/user_cubit.dart';
import 'package:flutter_application_2/cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'code.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم بنجاح')),
          );
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Code(
                 phoneNumber: state.phoneNumber,
                ),
              ));
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('حدث خطا')),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xff025366),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: SingleChildScrollView(
                child: Form(
                  key: context.read<UserCubit>().signInFormKey,
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
                          'سجل دخول معنا',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      const Text(
                        'برجاء ادخال رقم الجوال لتفعيل الحساب',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                        textAlign: TextAlign.end,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      IntlPhoneField(
                        controller: context.read<UserCubit>().signUpPhoneNumber,
                        keyboardType: TextInputType.phone,
                        initialCountryCode: 'SA',
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                     state is SignInLoading? CircularProgressIndicator() : CustomButon(
                        onTap: () {
                          context.read<UserCubit>().signIn();
                        },
                        colorborder: const Color(0xff043E4B),
                        text: 'التالي ',
                        color: const Color(0xff043E4B),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: Text(
                          'تسجيل كزائر',
                          style: TextStyle(fontSize: 12, color: kPrimaryColor),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
