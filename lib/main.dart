import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromRGBO(0, 0, 0, 1)).copyWith(
  primary: Colors.black,
  primaryContainer: Colors.black,
  onPrimary: Colors.black,
  onPrimaryContainer: Colors.white,
  secondary: const Color.fromRGBO(222, 127, 2, .8),
  onSecondary: Colors.black,
  secondaryContainer: const Color.fromRGBO(222, 127, 2, .8),
  onSecondaryContainer: Colors.black,
  tertiary: const Color.fromRGBO(252, 252, 252, 1),
  background: const Color.fromRGBO(252, 252, 252, 1),
  onBackground: const Color.fromRGBO(60, 60, 60, 1),
  error: const Color.fromRGBO(220, 0, 0, 1),
  inversePrimary: Colors.brown,
);

var kDarkColorScheme = kColorScheme.copyWith(
  secondaryContainer: const Color.fromRGBO(60, 60, 60, 1),
  onSecondaryContainer: const Color.fromRGBO(222, 127, 2, .8),
  tertiary: const Color.fromRGBO(200, 200, 200, 1),
  surface: const Color.fromRGBO(220, 220, 220, 1),
  onSurface: const Color.fromRGBO(60, 60, 60, 1),
  background: const Color.fromRGBO(30, 30, 30, 1),
  onBackground: const Color.fromRGBO(222, 127, 2, .8),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized(); // just to make sure that will work
  // system orientation
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
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
            backgroundColor:
                kDarkColorScheme.onSecondaryContainer.withAlpha(180),
            foregroundColor: kDarkColorScheme.primary,
          ),
        ),
        scaffoldBackgroundColor: kDarkColorScheme.background,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: kDarkColorScheme.onSurface),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kDarkColorScheme.primary),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kDarkColorScheme.secondary),
          ),
        ),
        datePickerTheme: DatePickerThemeData(
          backgroundColor: kDarkColorScheme.tertiary,
          headerBackgroundColor: kDarkColorScheme.primary,
          headerForegroundColor: Colors.white,
          dayOverlayColor:
              MaterialStatePropertyAll(kDarkColorScheme.inversePrimary),
          todayBackgroundColor:
              MaterialStatePropertyAll(kDarkColorScheme.secondary),
          todayForegroundColor:
              MaterialStatePropertyAll(kDarkColorScheme.primary),
          todayBorder: const BorderSide(color: Colors.black),
          dayForegroundColor:
              MaterialStatePropertyAll(kDarkColorScheme.primary),
          dayBackgroundColor:
              MaterialStatePropertyAll(kDarkColorScheme.tertiary),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.onPrimaryContainer,
          iconTheme: IconThemeData(
            color: kColorScheme.onPrimaryContainer,
          ),
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
        scaffoldBackgroundColor: kColorScheme.background,
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
  // });
// }
