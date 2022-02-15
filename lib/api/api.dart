import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:applitech/global/variables.dart' as global;

Future<void> getData(context) async {
  try {
    final Dio dio = Dio();
    String format = "?format=json";

    // Get home data

    final getHomeData = await dio.get(
      global.autologinLink + '/' + format,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    );

    // Get user data

    final getUserData = await dio.get(
      global.autologinLink + '/user/' + format,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    );

    // Print all datas

    print(getUserData.data);
    print(getHomeData.data);

    // Attribute datas to global variables

    global.userData = getUserData.data;
    global.homeData = getHomeData.data;

    // Navigate to home page

    Navigator.pushNamed(context, '/home');

    // End of the function
  } on PlatformException catch (error) {
    debugPrint("${error.code}: ${error.message}");
  }
}
