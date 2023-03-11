import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/counter_cubit.dart';

class BlocCubitConsumer extends StatefulWidget {
  const BlocCubitConsumer({super.key});

  @override
  State<BlocCubitConsumer> createState() => _BlocCubitConsumerState();
}

class _BlocCubitConsumerState extends State<BlocCubitConsumer> {
  final int _stokBarang = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Bloc Consumer')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<CounterCubit, int>(
                builder: (context, count) {
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
                },
                listener: (context, state) {
                  if (state == _stokBarang) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Srok Abis bro')));
                  }
                },
                buildWhen: (previous, current) {
                  if (current > _stokBarang) {
                    return false;
                  } else {
                    return true;
                  }
                },
              )
            ],
          ),
        ));
  }
}
