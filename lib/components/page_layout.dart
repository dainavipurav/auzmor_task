import 'package:flutter/material.dart';
import 'package:my_trainings/components/page_background.dart';

class PageLayout extends StatelessWidget {
  final Widget child;
  const PageLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trainings'),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Clicked Navigation Drawer'),
                ),
              );
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageBackground(),
          child,
        ],
      ),
    );
  }
}
