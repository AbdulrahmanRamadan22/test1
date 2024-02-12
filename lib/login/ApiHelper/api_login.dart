// import 'package:dio/dio.dart';
// import 'package:flutter_application_2/login/ApiHelper/models/LoginResponse.dart';
// import 'package:flutter_application_2/login/ApiHelper/models/bbbbbb/data.dart';
// import 'package:flutter_application_2/login/ApiHelper/models/bbbbbb/user.dart';
// import 'models/bbbbbb/bbbbbb.dart'; // Replace with your actual file names

// // class ApiLogin {
// //   static Dio dio = Dio();

// //   static Future<LoginResponse> sendVerificationCode({
// //     required String phoneKey,
// //     required String phoneNumber,
// //     required String tokenFirebase,
// //     required String deviceId,
// //   }) async {
// //     try {
// //       Response response = await dio.post(
// //         'https://abomajid.site.jadara.work/api/login',
// //         options: Options(
// //           headers: {
// //             'Accept': 'application/json',
// //             'Accept-Language': 'ar',
// //           },
// //         ),
// //         data: {
// //           'phone_key': phoneKey,
// //           'phone': phoneNumber,
// //           'token_firebase': tokenFirebase,
// //           'device_id': deviceId,
// //         },
// //       );

// //       return LoginResponse.fromJson(response.data);
// //     } catch (error) {
// //       // Handle error
// //       print(error);
// //       return LoginResponse(
// //           status: false, firstLogin: false, isApple: false, message: 'Error');
// //     }
// //   }

//   static Future<Bbbbbb> verifyCode({
//     required String phoneKey,
//     required String phoneNumber,
//     required String code,
//   }) async {
//     try {
//       Response response = await dio.post(
//         'https://abomajid.site.jadara.work/api/active-account',
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Accept-Language': 'en',
//           },
//         ),
//         data: {
//           'phone_key': phoneKey,
//           'phone': phoneNumber,
//           'code': code,
//         },
//       );

//       return Bbbbbb.fromJson(response.data);
//     } on DioError catch (e) {
//       // Handle DioError
//       if (e.response != null) {
//         // The request was made and the server responded with a status code
//         if (e.response!.statusCode == 422) {
//           // Handle the specific case where the server indicates a validation error
//           print('Validation Error: ${e.response?.data}');
//           final validationError =
//               e.response!.data['message'] as String? ?? 'Validation error';
//           return Bbbbbb(
//               status: false,
//               message: validationError,
//               data: Data(
//                 user: User(
//                   id: 0,
//                   name: '',
//                   email: '',
//                   phone: '',
//                   phoneKey: '',
//                   age: 0,
//                   gender: '',
//                   photo: '',
//                   isNotifiy: false,
//                   role: '',
//                   hasAddresses: false,
//                   address: '',
//                 ),
//                 type: '',
//                 token: '',
//               ));
//         } else {
//           // Handle other status codes
//           print('Server Error: ${e.response?.statusCode}');
//           return Bbbbbb(
//               status: false,
//               message: 'Server error',
//               data: Data(
//                 user: User(
//                   id: 0,
//                   name: '',
//                   email: '',
//                   phone: '',
//                   phoneKey: '',
//                   age: 0,
//                   gender: '',
//                   photo: '',
//                   isNotifiy: false,
//                   role: '',
//                   hasAddresses: false,
//                   address: '',
//                 ),
//                 type: '',
//                 token: '',
//               ));
//         }
//       } else {
//         // The request was made but no response was received
//         print('Connection Error: ${e.message}');
//         return Bbbbbb(
//             status: false,
//             message: 'Connection error',
//             data: Data(
//               user: User(
//                 id: 0,
//                 name: '',
//                 email: '',
//                 phone: '',
//                 phoneKey: '',
//                 age: 0,
//                 gender: '',
//                 photo: '',
//                 isNotifiy: false,
//                 role: '',
//                 hasAddresses: false,
//                 address: '',
//               ),
//               type: '',
//               token: '',
//             ));
//       }
//     }
//   }
// }