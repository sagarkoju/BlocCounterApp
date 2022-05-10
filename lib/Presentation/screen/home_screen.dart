import 'package:bloc_practise/bloc/counter_bloc.dart';
import 'package:bloc_practise/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter app for Bloc'),
        centerTitle: true,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            child: IconButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).increment();
              },
              icon: const Icon(Icons.add),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 50,
            child: IconButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).decrement();
              },
              icon: const Icon(Icons.minimize),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(
                state.number.toString(),
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              );
            },
          )),
          BlocConsumer<CounterBloc, CounterBlocState>(
            listener: (context, state) {
              if (state is IncrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Successfully Increment'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              } else {
                if (state is DecrementState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Successfully Decrement'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              }
            },
            builder: (context, state) {
              return Text(
                state.counter.toString(),
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              );
            },
          ),
          ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterIncrement());
              },
              child: const Text('Increment')),
          ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(Counterdecrement());
              },
              child: const Text('Decrement'))
        ],
      ),
    );
  }
}
