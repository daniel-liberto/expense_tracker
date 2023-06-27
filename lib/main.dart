import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = const ColorScheme.dark().copyWith(
    primary: Colors.black,
    secondary: Colors.orange,
    tertiary: Colors.white,
    error: Colors.red);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.tertiary,
          iconTheme: IconThemeData(color: kColorScheme.tertiary),
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondary.withAlpha(180),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.secondary.withAlpha(180),
            foregroundColor: kColorScheme.onPrimaryContainer,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: kColorScheme.onPrimary),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onPrimaryContainer,
                fontSize: 16,
              ),
            ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: kColorScheme.onPrimaryContainer),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kColorScheme.onPrimaryContainer),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kColorScheme.secondary),
          ),
        ),
      ),
      home: const Expenses(),
    ),
  );
}
