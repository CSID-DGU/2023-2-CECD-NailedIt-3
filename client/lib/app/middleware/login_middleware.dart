import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nailed_it/app/config/app_routes.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (FirebaseAuth.instance.currentUser == null) {
      return const RouteSettings(name: AppRoutes.LOGIN);
    }

    return null;
  }
}
