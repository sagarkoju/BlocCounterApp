// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'counter_cubit.dart';

class CounterState {
  final int number;
  CounterState({
    required this.number,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      number: map['number'] as int,
    );
  }
}
