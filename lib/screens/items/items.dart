import 'package:flutter/material.dart' hide ButtonTheme;
import 'ui/ui.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key, required this.title});

  final String title;

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          ButtonLang(),
          SizedBox(width: 6),
          ButtonTheme(),
          SizedBox(width: 6),
          ButtonGo(path: '/streets', icon: Icons.location_city_outlined),
          SizedBox(width: 6),
          ButtonGo(path: '/settings', icon: Icons.settings),
        ],
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, i) => ListItem(id: '$i'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/item', arguments: 'new');
        },
        tooltip: 'New item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
