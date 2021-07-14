import 'package:flutter/material.dart';

class HomePostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text("Instagram"),
          actions: [
            IconButton(
              icon: Icon(Icons.add_box_outlined),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.send_outlined),
              onPressed: () => {},
            )
          ],
        ),
      ],
    );
  }
}
