import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterChip(
                label: const Text('Coke'),
                labelStyle: TextStyle(
                  color: isSelected ? Colors.red : Colors.black,
                ),
                selected: isSelected,
                onSelected: (bool selected) {
                  isSelected = selected;
                  setState(() {});
                },
                selectedColor: Colors.amberAccent,
                checkmarkColor: Colors.red,
              ),
              FilterChip(
                label: const Text('Coke'),
                labelStyle: TextStyle(
                  color: isSelected ? Colors.red : Colors.black,
                ),
                selected: isSelected,
                onSelected: (bool selected) {
                  isSelected = selected;
                  setState(() {});
                },
                selectedColor: Colors.amberAccent,
                checkmarkColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
