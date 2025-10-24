import 'package:flarter/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonLang extends StatelessWidget {
  const ButtonLang({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, AppSettings>(
      builder: (context, settings) {
        return SizedBox(
          width: 80, // Desired width
          child: DropdownButton<String>(
            selectedItemBuilder: (BuildContext context) {
              return appLangs.map<Widget>((String item) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    item,
                    style: const TextStyle(
                      backgroundColor: Colors.transparent,
                      fontWeight: FontWeight.bold,
                      // color: Colors.blueAccent,
                    ),
                  ),
                );
              }).toList();
            },

            icon: Icon(Icons.language),
            borderRadius: BorderRadius.circular(20.0),
            isExpanded: true,
            menuWidth: 80,
            value: settings.lang, // The currently selected value
            hint: const Text('--'),
            onChanged: (String? newValue) {
              context.read<SettingsCubit>().setLang(newValue);
            },
            items: appLangs.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
        );
      },
    );
  }
}
