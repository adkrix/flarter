import 'package:flarter/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

const storeName = 'app_settings';

class SettingsCubit extends Cubit<AppSettings> {
  SettingsCubit() : super(AppSettings.fromJson({})) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final savedSettings = prefs.getString(storeName);
    emit(AppSettings.fromString(savedSettings));
  }

  Future<void> toggleTheme() async {
    update(
      AppSettings(
        theme: state.theme == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light,
        lang: state.lang,
      ),
    );
  }

  Future<void> setLang(String? value) async {
    if (value == null || !appLangs.contains(value.toLowerCase())) {
      return;
    }
    final newValue = value.toLowerCase();
    if (!appLangs.contains(newValue)) {
      return;
    }
    update(AppSettings(theme: state.theme, lang: newValue));
  }

  Future<void> update(AppSettings newState) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(storeName, newState.toString());
    emit(newState);
  }
}
