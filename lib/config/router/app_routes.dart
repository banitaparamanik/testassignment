import 'package:flutter/material.dart';
import 'package:testassignment/config/router/route_paths.dart';
import 'package:testassignment/grid_image/model/grid_image_data_model.dart';
import 'package:testassignment/grid_image/views/error_screen.dart';
import 'package:testassignment/grid_image/views/image_screen.dart';
import 'package:testassignment/grid_image/views/splash.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePaths.splash:
      return MaterialPageRoute(
          builder: (_) => const Splash(), settings: settings);
    case RoutePaths.gridImageScreen:
      return MaterialPageRoute(
          builder: (_) => ImageScreen(
              imageList: settings.arguments as List<GridImageDataModel>),
          settings: settings);
    default:
      return MaterialPageRoute(builder: (_) => const GenericError());
  }
}
