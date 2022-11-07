import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_app/src/data/local/post_local.dart';
import 'package:movie_app/src/data/repository/post_repostiory.dart';
import 'package:movie_app/src/helpers/http_client.dart';
import 'package:movie_app/src/helpers/network_info.dart';
import 'package:movie_app/src/helpers/preference_helper.dart';
import 'package:movie_app/src/data/network/post_service.dart';
import 'package:movie_app/src/ui/screen/splash_screen_provider.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // Provider
  locator.registerFactory(
    () => SplashScreenProvider(
      repository: locator(),
    ),
  );

  // Repostiory
  locator.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
      localSource: locator(),
      remoteSourece: locator(),
      networkInfo: locator(),
    ),
  );

  // Service
  locator.registerLazySingleton<PostService>(
    () => PostServiceImplement(
      locator(),
    ),
  );

  // local storage
  locator.registerLazySingleton<PostLocal>(
    () => PostLocalImplement(
      locator(),
    ),
  );

  // External
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(
    () => ApiClient(httpClient: locator()),
  );

  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
  locator.registerLazySingleton(() => InternetConnectionChecker());
  // helper

  _initSharedPref();
}

Future<void> _initSharedPref() async {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  locator.registerSingleton<FlutterSecureStorage>(secureStorage);
  locator.registerLazySingleton<PreferenceHelper>(
    () => PreferenceHelperImpl(locator()),
  );
}
