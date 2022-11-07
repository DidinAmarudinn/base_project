import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/src/utils/enum_state.dart';
import 'package:movie_app/src/shared/colors.dart';
import 'package:movie_app/src/transaltions/locale_keys.g.dart';
import 'package:movie_app/src/ui/screen/splash_screen_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SplashScreenProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(LocaleKeys.splash_screen.tr()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await context.setLocale(const Locale("id"));
                },
                child: const Text("Indonesia"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await context.setLocale(const Locale("en"));
                },
                child: const Text("English"),
              ),
            ],
          ),
          provider.state == RequestState.loading
              ? const SpinKitFadingCircle(
                  size: 40,
                  color: BaseColors.primary,
                )
              : ElevatedButton(
                  onPressed: () async {
                    await provider.getPostData();
                  },
                  child: const Text("Get Post Data"),
                ),
          Text(
            provider.state == RequestState.error
                ? provider.message
                : provider.postModel?.body ?? "",
          ),
          
        ],
      ),
    );
  }
}
