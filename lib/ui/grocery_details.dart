import 'package:flutter/material.dart';

import '../ui/tabs/search_bar.dart';
import '../ui/groceries/grocery_list.dart';

class GroceriesDetails extends StatefulWidget {
  const GroceriesDetails({super.key, required this.groceriesId});

  final String groceriesId;

  @override
  State<GroceriesDetails> createState() => _GroceriesDetailsState();
}

enum GroceriesTab { groceries, search }

class _GroceriesDetailsState extends State<GroceriesDetails> {
  GroceriesTab _currentTab = GroceriesTab.groceries;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Groceries ${widget.groceriesId}')),
      body: IndexedStack(
        index: _currentTab.index,
        children: [
          GroceryList(),
          GrocerySearch(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab.index,
        selectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            _currentTab = GroceriesTab.values[index];
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            label: 'Groceries',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}
