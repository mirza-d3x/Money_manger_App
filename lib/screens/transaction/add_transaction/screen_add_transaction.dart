import 'package:flutter/material.dart';

class ScreenAddTransaction extends StatelessWidget {
  static const routeName = 'add_transaction';
  const ScreenAddTransaction({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Add Transaction'),
    );
  }
}