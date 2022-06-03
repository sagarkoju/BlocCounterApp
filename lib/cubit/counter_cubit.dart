import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState> {
  CounterCubit() : super(CounterState(number: 0));

  void increment() {
    return emit(CounterState(number: state.number + 1));
  }

  void decrement() {
    return emit(CounterState(number: state.number - 1));
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
