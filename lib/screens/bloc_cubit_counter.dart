import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/counter_cubit.dart';

class BlocCubitScreen extends StatefulWidget {
  const BlocCubitScreen({super.key});

  @override
  State<BlocCubitScreen> createState() => _BlocCubitScreenState();
}

class _BlocCubitScreenState extends State<BlocCubitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Bloc Cubit')),
        body: BlocBuilder<CounterCubit, int>(buildWhen: (previous, current) {
          if (current < 0) {
            return false;
          } else {
            return true;
          }
        }, builder: (context, count) {
          return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('$count'),
              Column(
                children: [
                  Text(
                      "Current value: ${context.watch<CounterCubit>().curren.toString()}"),
                  Text(
                      "Nex value: ${context.watch<CounterCubit>().next.toString()}")
                ],
              ),
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
        }));
  }
}
