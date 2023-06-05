import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../core/utils.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Scaffold(
        backgroundColor: Colors.white,
        // This is handled by the search bar itself.
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            FloatingSearchBar(
              hint: 'Search...',
              borderRadius: BorderRadius.circular(20),
              scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
              transitionDuration: const Duration(milliseconds: 800),
              transitionCurve: Curves.easeInOut,
              physics: const BouncingScrollPhysics(),
              axisAlignment: 0.0,
              openAxisAlignment: 0.0,
              width: 600,
              debounceDelay: const Duration(milliseconds: 500),
              onQueryChanged: (query) {
                // Call your model, bloc, controller here.
              },
              // Specify a custom transition to be used for
              // animating between opened and closed stated.
              transition: CircularFloatingSearchBarTransition(),
              actions: [
                FloatingSearchBarAction(
                  showIfOpened: false,
                  child: CircularButton(
                    icon: const Icon(Icons.place),
                    onPressed: () {},
                  ),
                ),
                FloatingSearchBarAction.searchToClear(
                  showIfClosed: false,
                ),
              ],
              builder: (context, transition) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Material(
                    color: Colors.white,
                    elevation: 4.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: Colors.accents.map((color) {
                        return Container(height: 112, color: color);
                      }).toList(),
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}
