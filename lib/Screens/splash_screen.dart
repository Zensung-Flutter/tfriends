import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tfriends/Helpers/helper_functions.dart';
import 'package:tfriends/Providers/user_info_manager.dart';
import 'package:tfriends/Screens/change_password.dart';
import 'package:tfriends/Screens/login_screen.dart';
import 'package:tfriends/Screens/root_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<UserInfoManager>(context, listen: false).getLocalUserInfo();
    Timer(const Duration(seconds: 5), () {
      Provider.of<UserInfoManager>(context, listen: false).userInfoAuthToken ==
              ''
          ? HelperClass.nanvigateToScreen(context, LoginScreen())
          : Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => RootScreen()),
              (route) => false);
    });
    return Scaffold(
      body: Center(
          child: Image.asset(
        'images/tfriends_logo.png',
        width: 300,
      )),
    );
  }
}
