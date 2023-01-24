import 'package:flutter/material.dart';

/// widget for building grid view as per the duration
class GridBuilderPage extends StatefulWidget {
  const GridBuilderPage({super.key});

  @override
  State<GridBuilderPage> createState() => _GridBuilderPageState();
}

class _GridBuilderPageState extends State<GridBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.airplane_ticket_outlined),
                Text('Total Tickets'),
                Text('120'),
              ],
            ));
      },
    );
  }
}
