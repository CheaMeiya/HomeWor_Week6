import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ButtonPage(),
    ),
  );
}

// 1. Button Type Enum
enum ButtonType {
  primary,
  secondary,
  disabled,
}

// 2. Icon Position Enum
enum IconPosition {
  left,
  right,
}

// 3. Main Page
class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Buttons'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            CustomButton(
              label: 'Submit',
              icon: Icons.check,
            ),
            SizedBox(height: 20),

            CustomButton(
              label: 'Time',
              icon: Icons.schedule,
              type: ButtonType.secondary,
              iconPosition: IconPosition.right,
            ),
            SizedBox(height: 20),

            CustomButton(
              label: 'Account',
              icon: Icons.account_tree,
              type: ButtonType.disabled,
              iconPosition: IconPosition.right,
            ),
          ],
        ),
      ),
    );
  }
}

// 4. Reusable CustomButton Widget
class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    // Set button color
    Color buttonColor;

    switch (type) {
      case ButtonType.primary:
        buttonColor = Colors.blue;
        break;

      case ButtonType.secondary:
        buttonColor = Colors.green;
        break;

      case ButtonType.disabled:
        buttonColor = Colors.grey;
        break;
    }

    // Create icon widget
    final iconWidget = Icon(
      icon,
      color: Colors.white,
    );

    // Create text widget
    final textWidget = Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );

    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: iconPosition == IconPosition.left
            ? [
                iconWidget,
                const SizedBox(width: 10),
                textWidget,
              ]
            : [
                textWidget,
                const SizedBox(width: 10),
                iconWidget,
              ],
      ),
    );
  }
}
