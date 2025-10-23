import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flarter/theme/theme.dart';
import 'package:flarter/routes.dart';
import 'package:flarter/services/services.dart';
import 'package:flarter/repos/repos.dart';
import 'package:get_it/get_it.dart';

class FlarterApp extends StatelessWidget {
  const FlarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<OsmBloc>(
          create: (context) => OsmBloc(GetIt.I<AbstractDataRepo>()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            routes: routes,
            initialRoute: initialRoute,
          );
        },
      ),
    );
  }
}
