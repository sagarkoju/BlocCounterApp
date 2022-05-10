import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_practise/cubit/counter_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterBlocState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncrement>((event, emit) {
      emit(CounterBlocState(counter: state.counter + 1));
    });
    on<Counterdecrement>((event, emit) {
      emit(CounterBlocState(counter: state.counter - 1));
    });
  }
}
