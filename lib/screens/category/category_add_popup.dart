import 'package:flutter/material.dart';
import 'package:money_manager/models/category/category_model.dart';

ValueNotifier<CategoryType> selectedCategoryNotifier =
    ValueNotifier(CategoryType.income);

Future<void> showCategoryAddPopup(BuildContext context) async {
  showDialog(
    context: context,
    builder: (ctx) {
      return SimpleDialog(
        title: Text('Add Category'),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Category Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 5,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: const [
              RadioButton(title: 'Income', type: CategoryType.income),
              RadioButton(title: 'Expense', type: CategoryType.expense),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add'),
            ),
          ),
        ],
      );
    },
  );
}

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;

  const RadioButton({
    Key? key,
    required this.title,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: selectedCategoryNotifier,
          builder: (BuildContext ctx, CategoryType newCatgory, Widget? _) {
            return Radio<CategoryType>(
              value: type,
              groupValue: newCatgory,
              onChanged: (value) {
                print(value);
                if (value == null) {
                  return;
                }
                selectedCategoryNotifier.value = value as CategoryType;
                selectedCategoryNotifier.notifyListeners();
              },
            );
          },
        ),
        Text(title),
      ],
    );
  }
}
