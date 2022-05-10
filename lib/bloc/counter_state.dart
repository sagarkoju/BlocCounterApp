// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

@immutable
class CounterBlocState extends Equatable {
  final int counter;
  const CounterBlocState({
    required this.counter,
  });

  @override
  List<Object?> get props => [counter];
}

class CounterInitial extends CounterBlocState {
  const CounterInitial() : super(counter: 0);
}

class IncrementState extends CounterBlocState {
  // using for bloc listener
  const IncrementState(int increment) : super(counter: increment);
}

class DecrementState extends CounterBlocState {
  // using for bloc listener
  const DecrementState(int increment) : super(counter: increment);
}
