

import 'package:get_it/get_it.dart';
import 'package:memory_cache/memory_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

// AndroidOptions _getAndroidOptions() => const AndroidOptions(
//       encryptedSharedPreferences: true,
//     );

Future<void> setUpLocator() async {
  // final secureStorage = FlutterSecureStorage(
  //   aOptions: _getAndroidOptions(),
  // );

  final sharedPrefs = await SharedPreferences.getInstance();

  // * Secure storage
  // GetIt.I.registerSingleton<FlutterSecureStorage>(secureStorage);

  // * Base Api Client
  // GetIt.I.registerSingleton<MainApiClient>(
  //   MainApiClient(baseUrl: AppEnv.baseUrl),
  // );
  
  // * oAuth Api Client
  // GetIt.I.registerSingleton<OAuthApi>(
  //   OAuthApi(baseUrl: AppEnv.oAuthUrl),
  // );

  // * Messaging Service
  // GetIt.I.registerSingleton<MessagingService>(
  //   NotificationService(),
  // );

  // * Memory cache
  GetIt.I.registerSingleton<MemoryCache>(MemoryCache());

  // * Persist storage
  GetIt.I.registerSingleton<SharedPreferences>(sharedPrefs);

  // await GetIt.instance.isReady<SharedPreferences>();
}
