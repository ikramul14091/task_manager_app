import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager_app/ui/screens/sign_in_screen.dart';
import 'package:task_manager_app/ui/utils/asset_paths.dart';
import 'package:task_manager_app/ui/widgets/screen_background.dart';

class SplashSceen extends StatefulWidget {
  const SplashSceen({super.key});

  static const String name = '/';

  @override
  State<SplashSceen> createState() => _SplashSceenState();
}

class _SplashSceenState extends State<SplashSceen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, SignInScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(child: SvgPicture.asset(AssetPaths.logoSvg)),
      ),
    );
  }
}
