# Custom Dropdown

**Custom Dropdown** package lets you add customizable animated dropdown widget.

## Features

Lots of properties to use and customize dropdown widget as per your need. Also usable under Form widget for required validation.

- Custom dropdown using constructor **CustomDropdown()**.
- Custom dropdown with search field using named constructor **CustomDropdown.search()**.
- Custom dropdown with search request field using named constructor **CustomDropdown.searchRequest()**.

<hr>

## Getting started

1. Add the latest version of package to your `pubspec.yaml` (and run `flutter pub get`):

```dart
dependencies:
  animated_custom_dropdown: 1.5.0
```

2. Import the package and use it in your Flutter App.

```dart
import 'package:animated_custom_dropdown/custom_dropdown.dart';
```

<hr>

## Example usage

### 1. Custom dropdown

```dart
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CustomDropdownExample extends StatefulWidget {
  const CustomDropdownExample({Key? key}) : super(key: key);

  @override
  State<CustomDropdownExample> createState() => _CustomDropdownExampleState();
}

class _CustomDropdownExampleState extends State<CustomDropdownExample> {
  final jobRoleCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      hintText: 'Select job role',
      items: const ['Developer', 'Designer', 'Consultant', 'Student'],
      controller: jobRoleCtrl,
    );
  }
}
```

### 2. Custom dropdown with search

```dart
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CustomDropdownExample extends StatefulWidget {
  const CustomDropdownExample({Key? key}) : super(key: key);

  @override
  State<CustomDropdownExample> createState() => _CustomDropdownExampleState();
}

class _CustomDropdownExampleState extends State<CustomDropdownExample> {
  final jobRoleCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomDropdown.search(
      hintText: 'Select job role',
      items: const ['Developer', 'Designer', 'Consultant', 'Student'],
      controller: jobRoleCtrl,
    );
  }
}
```

### 3. Custom dropdown with search request

```dart
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CustomDropdownExample extends StatefulWidget {
  const CustomDropdownExample({Key? key}) : super(key: key);

  @override
  State<CustomDropdownExample> createState() => _CustomDropdownExampleState();
}

class _CustomDropdownExampleState extends State<CustomDropdownExample> {
  final jobRoleCtrl = TextEditingController();

  Future<List<String>> getFakeRequestData(String query) async {
    List<String> data = ['Developer', 'Designer', 'Consultant', 'Student'];

    return await Future.delayed(const Duration(seconds: 1), () {
      return data.where((e) {
        return e.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdown.searchRequest(
      futureRequest: getFakeRequestData,
      hintText: 'Search job role',
      controller: jobRoleCtrl,
      futureRequestDelay: const Duration(seconds: 3),//it waits 3 seconds before start searching (before execute the 'futureRequest' function)
    );
  }
}
```

## Preview

![Example App](https://github.com/sithvothykiv/flutter_custom_dropdown/blob/master/readme_assets/preview.gif)

<hr>

## Todos

- [ ] Dropdown field/header builder.
- [ ] Only when Tapped on any GestureDetector displaying the dropdown