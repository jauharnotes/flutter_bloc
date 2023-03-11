import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/counter_cubit.dart';

import '../widget/data_counter.dart';

class BlocProviderScreen extends StatelessWidget {
  const BlocProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CounterCubit myCounter = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc provider'),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, _) {
          return Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        myCounter.decrement();
                      },
                      child: const SizedBox(
                        width: 40,
                        height: 70,
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const DataCounter(),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        myCounter.increment();
                      },
                      child: const SizedBox(
                        width: 40,
                        height: 70,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ]),
          );
        },
      ),
    );
  }
}
