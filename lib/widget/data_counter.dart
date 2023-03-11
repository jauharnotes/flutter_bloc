import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter_cubit.dart';
import 'counter_value.dart';

class DataCounter extends StatelessWidget {
  const DataCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, count) {
        return Container(
          width: 200,
          height: 70,
          color: Colors.orangeAccent,
          child: const CounterValue(),
        );
      },
    );
  }
}
