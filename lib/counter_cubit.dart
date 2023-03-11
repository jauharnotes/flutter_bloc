import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0}) : super(initialData);

  int initialData;
  int? curren;
  int? next;

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state != 0) {
      emit(state - 1);
    }
    // if (state != 0) {
    // }
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    curren = change.currentState;
    next = change.nextState;
    print(change);
  }
}
