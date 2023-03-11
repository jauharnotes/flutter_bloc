import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/counter_cubit.dart';

class BlocCubitListener extends StatefulWidget {
  const BlocCubitListener({super.key});

  @override
  State<BlocCubitListener> createState() => _BlocCubitListenerState();
}

class _BlocCubitListenerState extends State<BlocCubitListener> {
  final int _stokBarang = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Bloc Listener')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocListener<CounterCubit, int>(
                listener: (context, state) {
                  if (state == _stokBarang) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Srok Abis bro')));
                  }
                },
                child: BlocBuilder<CounterCubit, int>(
                    buildWhen: (previous, current) {
                  if (current < 0 || current > _stokBarang) {
                    return false;
                  } else {
                    return true;
                  }
                }, builder: (context, count) {
                  return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('$count'),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    context.read<CounterCubit>().decrement();
                                  },
                                  icon: const Icon(Icons.remove)),
                              IconButton(
                                  onPressed: () {
                                    context.read<CounterCubit>().increment();
                                  },
                                  icon: const Icon(Icons.add))
                            ],
                          )
                        ]),
                  );
                }),
              ),
            ],
          ),
        ));
  }
}
