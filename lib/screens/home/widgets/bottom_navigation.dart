import 'package:flutter/material.dart';
import 'package:money_manager/screens/home/screen_home.dart';

class MoneyManagerBottomNavigatoion extends StatelessWidget {
  const MoneyManagerBottomNavigatoion({Key? key}) : super(key: key);

// Bottom Navigation Button 
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ScreenHome.selectedIndexNotifier,
      builder: (BuildContext ctx, int updatedIndex, Widget? _) {
        return BottomNavigationBar(
        onTap: (newIndex){
          ScreenHome.selectedIndexNotifier.value = newIndex;
        },
        currentIndex: updatedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), 
              label: 'Transacion'),
          BottomNavigationBarItem(
               icon: Icon(Icons.category), 
               label: 'Category'),
      ]);
      },
    );
  }
}
