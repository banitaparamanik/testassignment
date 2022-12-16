import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testassignment/config/router/app_routes.dart';
import 'package:testassignment/config/router/route_paths.dart';
import 'package:testassignment/grid_image/image_bloc/bloc/grid_image_bloc.dart';
import 'package:testassignment/grid_image/repository/image_repository.dart';
import 'package:testassignment/utils/network_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Color(0xff027079)));
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<GridImageBloc>(
            create: (context) {
              final ImageRepository imageRepository =
                  ImageRepository(NetworkManager());
              return GridImageBloc(imageRepository);
            },
          )
        ],
        child: MaterialApp(
          title: ' Grid Images',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: generateRoute,
          initialRoute: RoutePaths.splash,
        ));
  }
}
