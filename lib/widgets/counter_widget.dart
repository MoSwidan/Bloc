import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/counter_bloc.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, int>(
      listener: (context, state) {
        if (state == 5) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Counter reached 5!')),
          );
        }
      },
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Counter: $state',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () => context.read<CounterBloc>().add(IncrementCounter()),
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 20),
                  FloatingActionButton(
                    onPressed: () => context.read<CounterBloc>().add(DecrementCounter()),
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}