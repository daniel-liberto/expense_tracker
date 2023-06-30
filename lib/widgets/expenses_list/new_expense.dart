import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.values[0];

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    // firstDate is giving us 365 days to pick up
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now, // default value when date windows open
      firstDate: firstDate, // first valid date to choose
      lastDate: now, // last valid date to choose
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final enteredAmount =
        double.tryParse(_amountController.text); // if string => null
    final amountIsInvalid = // true if is null or less than 0
        enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: isDarkMode
              ? Theme.of(context).colorScheme.tertiary
              : Theme.of(context).colorScheme.tertiary,
          title: Text(
            'Invalid input',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          content: Text(
            'Please make sure if you choose a valid information and not used special characters like(#%@*).',
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary.withAlpha(180)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Close'),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  // remove controllers from memory when modal is closed
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, keyboardSpace + 16),
        child: Container(
          color: Theme.of(context).colorScheme.surface.withOpacity(1),
          child: Column(
            children: [
              AppBar(
                title: const Text(
                  'Create a new expense',
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  children: [
                    TextField(
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withAlpha(180)),
                      controller: _titleController,
                      maxLength: 20,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Type name of expense',
                        contentPadding: const EdgeInsets.fromLTRB(4, 20, 0, 6),
                        counterStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withAlpha(180)),
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              prefixIcon: Text(
                                '\$ ',
                                style: TextStyle(color: Colors.orange),
                              ),
                              prefixIconConstraints: BoxConstraints(
                                maxHeight: double.maxFinite,
                                maxWidth: double.maxFinite,
                              ),
                              isDense: true,
                              hintText: 'Type amount',
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selectedDate == null
                                    ? 'No date selected'
                                    : formatter.format(_selectedDate!),
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              IconButton(
                                onPressed: _presentDatePicker,
                                icon: const Icon(Icons.calendar_month),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    Theme.of(context).colorScheme.secondary,
                                  ),
                                  foregroundColor: MaterialStatePropertyAll(
                                    Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withAlpha(180),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withAlpha(120),
                                spreadRadius: 0,
                                blurRadius: 1,
                                blurStyle: BlurStyle.solid,
                                offset: const Offset(0, 1),
                              )
                            ],
                          ),
                          child: DropdownButton(
                              dropdownColor:
                                  Theme.of(context).colorScheme.inversePrimary,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              enableFeedback: true,
                              underline: Container(
                                height: 1,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withAlpha(80),
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withAlpha(180),
                              ),
                              value: _selectedCategory,
                              items: Category.values
                                  .map(
                                    (category) => DropdownMenuItem(
                                      value: category,
                                      child: Row(
                                        children: [
                                          Icon(
                                            categoryIcons[category],
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                          Text(
                                            '  ${category.name.toUpperCase()}',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimaryContainer),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                if (value == null) {
                                  return;
                                } else {
                                  setState(() {
                                    _selectedCategory = value;
                                  });
                                }
                              }),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(
                                context); // context = modal, closes modal
                          },
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 4),
                        ElevatedButton(
                          onPressed: _submitExpenseData,
                          child: const Text('Save Expense'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
