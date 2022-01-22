// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:money_manager/screens/category/category_add_popup.dart';
import 'package:money_manager/screens/category/screen_category.dart';
import 'package:money_manager/screens/home/widgets/bottom_navigation.dart';
import 'package:money_manager/screens/transaction/add_transaction/screen_add_transaction.dart';
import 'package:money_manager/screens/transaction/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = const [
    ScreenTransaction(),
    ScreenCategory(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('MONEY MANAGER'),
        centerTitle: true,
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigatoion(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
      // floatButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            Navigator.of(context).pushNamed(ScreenAddTransaction.routeName);
            print('Add Transaction');
          } else {
            print('Add Category');
            showCategoryAddPopup(context);
            // final _sample = CategoryModel(
            //   id: DateTime.now().microsecondsSinceEpoch.toString(),
            //   name: 'Travel',
            //   type: CategoryType.expense,
            // );
            // CategoryDb().insertCategory(_sample);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
