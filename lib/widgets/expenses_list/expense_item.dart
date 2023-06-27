import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  expense.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                Text(
                  'Expense date',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          Theme.of(context).colorScheme.primary.withAlpha(200)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withAlpha(60),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color:
                          Theme.of(context).colorScheme.primary.withAlpha(30),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
                  child: Text(
                    '\$ ${expense.amount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Color.fromRGBO(0, 230, 0, 1),
                    ),
                  ),
                ),
                const Spacer(), // dynamcly space between contents
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                    // don't use (), because get is not a method
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
