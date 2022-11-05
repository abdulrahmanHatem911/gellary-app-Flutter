import 'package:flutter/material.dart';

import '../../presentation/screens/gallery_screen.dart';
import '../../presentation/screens/login_screen.dart';

class Routers {
  static const String loginScreen = '/login';
  static const String galleryScreen = '/gallery_screen';
}

class RoutersGenerated {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routers.galleryScreen:
        return MaterialPageRoute(builder: (_) => const GalleryScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
