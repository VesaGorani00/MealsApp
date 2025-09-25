import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget{
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen ;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primaryContainer,
                      Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
                    ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              ),
              child: Row(
                children: [
                  Icon(Icons.fastfood, size: 48, color: Colors.white,),
                  SizedBox(width: 18,),
                  Text('Cooking UP', style: TextStyle(color: Colors.white),),
                ],
              ),
          ),
          ListTile(
            leading: Icon( //leading na lejon me vendos icon para nje teksti
              Icons.restaurant, size: 26, color: Colors.white,
            ),
            title: Text('Meals', style: TextStyle(color: Colors.white,fontSize: 24),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon( //leading na lejon me vendos icon para nje teksti
              Icons.settings, size: 26, color: Colors.white,
            ),
            title: Text('Filters', style: TextStyle(color: Colors.white,fontSize: 24),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          )
        ],
      ),
    );
  }
}