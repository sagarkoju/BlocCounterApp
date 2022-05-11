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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counter': counter,
    };
  }

  factory CounterBlocState.fromMap(Map<String, dynamic> map) {
    return CounterBlocState(
      counter: map['counter'] as int,
    );
  }
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
