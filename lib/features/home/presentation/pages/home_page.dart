import 'package:ecommerce/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => const Text('Initial'),
              loading: (_) => const Text('Loading'),
              success: (state) =>
                  Text('Success: ${state.response.data?.length} products'),
              failure: (state) => Text('Failure: ${state.error}'),
            );
          },
        ),
      ),
    );
  }
}
