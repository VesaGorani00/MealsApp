import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return FiltersScreenState();
  }
}

class FiltersScreenState extends State<FiltersScreen> {
  var glutenFreeFilterSet = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      body: Column(
        children: [
          SwitchListTile(
            value: glutenFreeFilterSet,
            onChanged: (isChecked) {
                setState(() {
                  glutenFreeFilterSet;
                });
            },
            title: Text('Gluten-Free', style: TextStyle(color: Colors.white)),
            subtitle: Text(
              'Only include gluten-free meals',
              style: TextStyle(color: Colors.white),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
