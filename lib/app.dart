import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/counter_bloc.dart';
import 'blocs/theme_bloc.dart';
import 'widgets/counter_widget.dart';
import 'widgets/theme_toggle_button.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, isDark) {
          return MaterialApp(
            theme: isDark ? ThemeData.dark() : ThemeData.light(),
            home: Scaffold(
              appBar: AppBar(
                title: const Text('BLoC Demo'),
                actions: const [ThemeToggleButton()],
              ),
              body: const CounterWidget(),
            ),
          );
        },
      ),
    );
  }
}