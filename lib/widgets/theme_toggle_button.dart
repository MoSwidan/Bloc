import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/theme_bloc.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      builder: (context, isDark) {
        return Switch(
          value: isDark,
          onChanged: (value) => context.read<ThemeBloc>().add(ToggleTheme()),
        );
      },
    );
  }
}