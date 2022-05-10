import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterBlocState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncrement>((event, emit) {
      emit(IncrementState(state.counter + 1));
    });
    on<Counterdecrement>((event, emit) {
      emit(DecrementState(state.counter - 1));
    });
  }
}
