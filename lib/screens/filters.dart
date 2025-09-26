import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/main_drawer.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() {
    return FiltersScreenState();
  }
}

class FiltersScreenState extends ConsumerState<FiltersScreen> {
  var glutenFreeFilterSet = false;
  var lactoseFreeFilterSet = false;
  var vegetarianFilterSet = false;
  var veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider); // we put ref.read because init state is extecuted only once
    setState(() {
      glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
      lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
      vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
      veganFilterSet = activeFilters[Filter.vegan]!;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(
      //         context,
      //       ).push(MaterialPageRoute(builder: (ctx) => TabsScreen()));
      //     }
      //   },
      // ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: glutenFreeFilterSet,
            Filter.lactoseFree: lactoseFreeFilterSet,
            Filter.vegetarian: vegetarianFilterSet,
            Filter.vegan: veganFilterSet,
          });
          // Navigator.of(context).pop({});
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  glutenFreeFilterSet = isChecked;
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
            SwitchListTile(
              value: lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: TextStyle(color: Colors.white),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegetarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  vegetarianFilterSet = isChecked;
                });
              },
              title: Text('Vegetarian', style: TextStyle(color: Colors.white)),
              subtitle: Text(
                'Only include vegetarian meals',
                style: TextStyle(color: Colors.white),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  veganFilterSet = isChecked;
                });
              },
              title: Text('Vegan', style: TextStyle(color: Colors.white)),
              subtitle: Text(
                'Only include vegan meals',
                style: TextStyle(color: Colors.white),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
