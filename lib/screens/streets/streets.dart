import 'package:flarter/services/osm/osm_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'ui/ui.dart';

class StreetsScreen extends StatefulWidget {
  const StreetsScreen({super.key, required this.title});

  final String title;
  @override
  State<StreetsScreen> createState() => _StreetsScreenState();
}

class _StreetsScreenState extends State<StreetsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OsmBloc>().add(LoadOsmList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OsmBloc, OsmState>(
      builder: (context, themeMode) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: BlocBuilder<OsmBloc, OsmState>(
            builder: (context, state) {
              if (state is InitialOsmState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is LoadedOsmState) {
                return ListView(
                  children: state.osmList
                      .map((street) => StreetItem(street: street))
                      .toList(),
                );
              }
              return Container();
            },
          ),
        );
      },
    );
  }
}
