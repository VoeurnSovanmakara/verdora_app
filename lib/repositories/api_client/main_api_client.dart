import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class MainApiClient {
  MainApiClient({required String baseUrl}) {
    instance = Dio();
    (instance.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
    instance.options.baseUrl = baseUrl;

    instance.options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Requested-Source': 'MobileAPP',
      // 'X-Requested-OS': "",
      // 'X-Requested-App-Version': ""
      // 'Package-Info':
      // 'Device-Token': 'DeviceToken'
    });

    instance.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  late Dio instance;
}
