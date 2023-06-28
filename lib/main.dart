import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromRGBO(0, 0, 0, 1)).copyWith(
  primary: Colors.black,
  primaryContainer: Colors.black,
  onPrimary: Colors.black,
  onPrimaryContainer: Colors.white,
  secondary: Colors.orange,
  onSecondary: Colors.black,
  secondaryContainer: Colors.orange,
  onSecondaryContainer: Colors.black,
  tertiary: Colors.white,
  error: const Color.fromRGBO(255, 0, 0, .9),
);

var kDarkColorScheme = kColorScheme.copyWith(
  secondaryContainer: const Color.fromRGBO(60, 60, 60, 1),
  tertiary: const Color.fromRGBO(200, 200, 200, 1),
  background: const Color.fromRGBO(30, 30, 30, 1),
  onBackground: const Color.fromRGBO(222, 127, 2, .8),
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
          iconTheme: IconThemeData(color: kDarkColorScheme.tertiary),
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.secondaryContainer.withAlpha(180),
            foregroundColor: kDarkColorScheme.onSecondaryContainer,
          ),
        ),
        scaffoldBackgroundColor: kDarkColorScheme.background,
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.onPrimaryContainer,
          iconTheme: IconThemeData(color: kColorScheme.tertiary),
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer.withAlpha(180),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.secondaryContainer.withAlpha(180),
            foregroundColor: kColorScheme.onSecondaryContainer,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: kColorScheme.primary),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kColorScheme.primary),
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
