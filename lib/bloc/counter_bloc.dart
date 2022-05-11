import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterBlocState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncrement>((event, emit) {
      emit(IncrementState(state.counter + 1));
    });
    on<Counterdecrement>((event, emit) {
      emit(DecrementState(state.counter - 1));
    });
  }

  @override
  CounterBlocState? fromJson(Map<String, dynamic> json) {
    return CounterBlocState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterBlocState state) {
    return state.toMap();
  }
}
