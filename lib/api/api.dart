import 'package:applitech/global/variables.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void getAccessToken(BuildContext context, String url) async {
  final Dio dio = Dio();

  dio.options.headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  dio.options.baseUrl = url;

  final dynamic userData = await dio.get(
    redirectUrl,
    options: Options(
      followRedirects: true,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  );

  print(userData.data);
}
