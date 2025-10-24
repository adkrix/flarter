import 'package:flarter/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonTheme extends StatelessWidget {
  const ButtonTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, AppSettings>(
      builder: (context, themeMode) {
        return IconButton(
          onPressed: () => context.read<SettingsCubit>().toggleTheme(),
          icon: Icon(
            context.read<SettingsCubit>().state.theme == ThemeMode.dark
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
        );
      },
    );
  }
}
