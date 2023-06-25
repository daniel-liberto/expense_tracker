import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  });

// using expense.dart structure model
// parameters: {id, title, amount, date, category}
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses
          .length, // this is the amount of times that itemBuilder widget will be called.
      itemBuilder: (cntxt, index) => ExpenseItem(expenses[
          index]), // get argument list, pick index position of that list, get title of that position on the list
    );
  }
}
