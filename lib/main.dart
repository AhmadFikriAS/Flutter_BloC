import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basic/bloc/sushi_bloc.dart';

import 'models/sushi_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SushiBloc()..add(LoadSushiCounter()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sushi Bloc',
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  get random => Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sushi Bloc'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: BlocBuilder<SushiBloc, SushiState>(
          builder: (context, state) {
            if (state is SushiInitial) {
              return const CircularProgressIndicator(
                color: Colors.red,
              );
            }
            if (state is SushiLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.sushii.length}',
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        for (int index = 0;
                            index < state.sushii.length;
                            index++)
                          Positioned(
                            left: random.nextInt(250).toDouble(),
                            top: random.nextInt(400).toDouble(),
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: state.sushii[index].image,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Text('Something went wrong!');
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.redAccent,
            child: const ImageIcon(
              AssetImage('assets/icon_sushi.png'),
            ),
            onPressed: () {
              context.read<SushiBloc>().add(AddSushi(Sushi.sushii[0]));
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.redAccent,
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<SushiBloc>().add(RemoveSushi(Sushi.sushii[0]));
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.redAccent,
            child: const ImageIcon(
              AssetImage('assets/icon_sushi.png'),
            ),
            onPressed: () {
              context.read<SushiBloc>().add(AddSushi(Sushi.sushii[1]));
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.redAccent,
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<SushiBloc>().add(RemoveSushi(Sushi.sushii[1]));
            },
          ),
        ],
      ),
    );
  }
}
