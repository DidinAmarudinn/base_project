import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/transaltions/codegen_loader.g.dart';
import 'injection.dart' as di;
import 'src/my_app.dart';

Future main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await di.init();
    return runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('id'),
        ],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: const MyApp(),
      ),
    );
  } catch (error) {
    // print('$error & $stacktrace');
  }
}
