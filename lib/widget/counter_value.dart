import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter_cubit.dart';

class CounterValue extends StatelessWidget {
  const CounterValue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, count) {
        return Center(
          child: Text(
            '$count',
            style: const TextStyle(fontSize: 50, color: Colors.white),
          ),
        );
      },
    );
  }
}
