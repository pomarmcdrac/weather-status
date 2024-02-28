import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingSearchAppBar(
      title: const Text('Escribe tu ciudad...'),
      transitionDuration: const Duration(milliseconds: 800),
      color: Colors.greenAccent.shade100,
      colorOnScroll: Colors.greenAccent.shade200,
      body: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 20,
        separatorBuilder: (context, index) => const Divider(), 
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(' $index'),
          );
        }, 
      ),
    );
  }
}