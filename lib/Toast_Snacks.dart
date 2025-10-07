import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';



class ToastAndSnackbarDemo extends StatelessWidget {
  const ToastAndSnackbarDemo({super.key});

  // Show a toast using toastification
  void _showToast(BuildContext context, ToastificationType type) {
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.fillColored,
      title: Text(type.name.toUpperCase()),
      description: Text('This is a ${type.name} toast message.'),
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topRight,
      animationDuration: const Duration(milliseconds: 300),
      icon: type == ToastificationType.custom
          ? const Icon(Icons.star, color: Colors.purple)
          : null,
    );
  }

  // Show a basic snackbar using Flutter's built-in SnackBar
  void _showSnackBar(BuildContext context, String type) {
    Color backgroundColor;
    IconData icon;
    String message;

    switch (type) {
      case 'success':
        backgroundColor = Colors.green;
        icon = Icons.check_circle;
        message = 'Success! Operation completed.';
        break;
      case 'error':
        backgroundColor = Colors.red;
        icon = Icons.error;
        message = 'Error! Something went wrong.';
        break;
      case 'warning':
        backgroundColor = Colors.orange;
        icon = Icons.warning;
        message = 'Warning! Check your input.';
        break;
      case 'info':
        backgroundColor = Colors.blue;
        icon = Icons.info;
        message = 'Info! Just so you know.';
        break;
      default:
        backgroundColor = Colors.purple;
        icon = Icons.star;
        message = 'Custom snackbar message.';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toastification & SnackBar Demo'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [


            const Text(
              'Toastification (Toasts)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => _showToast(context, ToastificationType.success),
                  child: const Text('Success Toast'),
                ),
                ElevatedButton(
                  onPressed: () => _showToast(context, ToastificationType.error),
                  child: const Text('Error Toast'),
                ),
                ElevatedButton(
                  onPressed: () => _showToast(context, ToastificationType.warning),
                  child: const Text('Warning Toast'),
                ),
                ElevatedButton(
                  onPressed: () => _showToast(context, ToastificationType.info),
                  child: const Text('Info Toast'),
                ),
                ElevatedButton(
                  onPressed: () => _showToast(context, ToastificationType.custom("Test String", Colors.pink, Icons.clear)),
                  child: const Text('Custom Toast'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Flutter SnackBars',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => _showSnackBar(context, 'success'),
                  child: const Text('Success SnackBar'),
                ),
                ElevatedButton(
                  onPressed: () => _showSnackBar(context, 'error'),
                  child: const Text('Error SnackBar'),
                ),
                ElevatedButton(
                  onPressed: () => _showSnackBar(context, 'warning'),
                  child: const Text('Warning SnackBar'),
                ),
                ElevatedButton(
                  onPressed: () => _showSnackBar(context, 'info'),
                  child: const Text('Info SnackBar'),
                ),
                ElevatedButton(
                  onPressed: () => _showSnackBar(context, 'custom'),
                  child: const Text('Custom SnackBar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
