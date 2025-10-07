import 'package:flutter/material.dart';

class DismissibleExample extends StatefulWidget {
  const DismissibleExample({super.key});

  @override
  State<DismissibleExample> createState() => _DismissibleExampleState();
}

class _DismissibleExampleState extends State<DismissibleExample> {
  final items = ['Mail 1', 'Mail 2', 'Mail 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Swipe Example")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            key: Key(item),
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.archive, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                // Swiped right → archive
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$item archived')),
                );
              } else if (direction == DismissDirection.endToStart) {
                // Swiped left → delete
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$item deleted')),
                );
                setState(() => items.removeAt(index));
              }
            },
            child: ListTile(title: Text(item)),
          );
        },
      ),
    );
  }
}
