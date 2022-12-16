import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testassignment/config/router/route_paths.dart';
import 'package:testassignment/grid_image/image_bloc/bloc/grid_image_bloc.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GridImageBloc>(context).add(FetchImageInitial());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      body: BlocConsumer<GridImageBloc, GridImageState>(
        listenWhen: (oldState, newState) =>
            newState is FetchImageInPregress ||
            newState is ImageListSuccessState,
        listener: (context, state) {
          if (state is ImageListSuccessState) {
            Navigator.pushReplacementNamed(context, RoutePaths.gridImageScreen,
                arguments: state.imageList);
          }
        },
        buildWhen: (oldState, newState) =>
            newState is FetchImageInPregress ||
            newState is ImageListSuccessState ||
            newState is ImageListFailureState,
        builder: (context, state) {
          if (state is FetchImageInPregress) {
            return Center(
              child: Text("Loading...",
                  style: Theme.of(context).textTheme.labelLarge),
            );
          } else if (state is ImageListFailureState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.appException.message,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: (() => BlocProvider.of<GridImageBloc>(context)
                          .add(FetchImageInitial())),
                      child: const Text("Try Again"))
                ],
              ),
            );
          }
          return Center(
              child: Text(
            "Demo App,",
            style: Theme.of(context).textTheme.labelLarge,
          ));
        },
      ),
    );
  }
}
