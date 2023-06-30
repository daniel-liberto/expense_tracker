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
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(categoryIcons[expense.category],
                      color: Theme.of(context).colorScheme.onBackground),
                  const SizedBox(width: 4),
                  Expanded(
                    flex: 2,
                    child: Text(
                      expense.title.toUpperCase(),
                      maxLines: 2,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.calendar_month,
                    color: Theme.of(context).colorScheme.onBackground,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Expense date',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.primary.withAlpha(60),
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
                      Text(
                        expense.formattedDate,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      // don't use (), because get is not a method
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
