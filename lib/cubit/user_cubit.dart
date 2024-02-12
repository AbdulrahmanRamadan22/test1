import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/api/api_consumer.dart';
import 'package:flutter_application_2/core/api/end_ponits.dart';
import 'package:flutter_application_2/core/errors/exceptions.dart';
import 'package:flutter_application_2/cubit/user_state.dart';
import 'package:flutter_application_2/login/ApiHelper/models/LoginResponse.dart';
import 'package:flutter_application_2/login/ApiHelper/models/bbbbbb/bbbbbb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {


  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signUpPhoneNumber = TextEditingController();
  GlobalKey<FormState> activeFormKey = GlobalKey();

  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  Bbbbbb? user;

  signIn() async {
    emit(SignInLoading());
    try {
      final response = await api.post(EndPoint.signIn, isFromData: true, data: {
        ApiKey.phone: signUpPhoneNumber.text,
        ApiKey.deviceId: 'TP1A.220624.014',
        ApiKey.phonekey: 966,
        ApiKey.tokenfirebase: 'token',
      });
      final login = LoginResponse.fromJson(response);
      emit(SignInSuccess(
          phoneNumber:
              signUpPhoneNumber.text)); // Emit phoneNumber upon success
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.errorMessage));
    }
  }

    String? c1 ;

  active(  String c1 ) async {
    emit(ActiveLoading());
    try {
      final response = await api.post(
        EndPoint.active,
        isFromData: true,
        data: {
          ApiKey.phone: "555555555",
          ApiKey.phonekey: "966",
          ApiKey.code:c1,
              // Ensure code is concatenated properly
        },

      );

      print(response);
    final  user = Bbbbbb.fromJson(response);

      print(user);

      emit(ActiveSuccess());
    } on ServerException catch (e) {
      emit(ActiveFailure(errMessage: e.errModel.errorMessage));
    }
  }
}
