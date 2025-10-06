import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AllDialogsScreen extends StatelessWidget {
  const AllDialogsScreen({super.key});

  void _showMaterialAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Material AlertDialog'),
        content: const Text('This is a Material AlertDialog.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
        ],
      ),
    );
  }

  void _showCupertinoDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Cupertino Dialog'),
        content: const Text('This is a Cupertino-style dialog.'),
        actions: [
          CupertinoDialogAction(child: const Text('Cancel'), onPressed: () => Navigator.pop(context)),
          CupertinoDialogAction(child: const Text('OK'), onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }

  void _showAdaptiveDialog(BuildContext context) {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: const Text('Adaptive Dialog'),
        content: const Text('This uses showAdaptiveDialog and adapts to platform.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
        ],
      ),
    );
  }

  void _showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Simple Dialog'),
        children: [
          SimpleDialogOption(child: const Text('Option 1'), onPressed: () => Navigator.pop(context)),
          SimpleDialogOption(child: const Text('Option 2'), onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }

  void _showTimePicker(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Selected time: ${time.format(context)}')));
    }
  }

  void _showDatePicker(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Selected date: $date')));
    }
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Dialog Demo App',
      applicationVersion: '1.0.0',
      applicationLegalese: '© 2025 Example Corp.',
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Custom Dialog', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              const Text('This is a fully custom dialog.'),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
            ],
          ),
        ),
      ),
    );
  }

  void _showMenu(BuildContext context, Offset position) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(position, position),
        Offset.zero & overlay.size,
      ),
      items: [
        const PopupMenuItem(child: Text('Menu Item 1')),
        const PopupMenuItem(child: Text('Menu Item 2')),
      ],
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 200,
        child: Center(
          child: Text('This is a Modal Bottom Sheet', style: Theme.of(context).textTheme.titleMedium),
        ),
      ),
    );
  }

  void _showCupertinoModalPopup(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Cupertino Action Sheet'),
        message: const Text('Select an option below'),
        actions: [
          CupertinoActionSheetAction(child: const Text('Option 1'), onPressed: () => Navigator.pop(context)),
          CupertinoActionSheetAction(child: const Text('Option 2'), onPressed: () => Navigator.pop(context)),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dialogOptions = [
      {'title': 'Material AlertDialog', 'onTap': () => _showMaterialAlertDialog(context)},
      {'title': 'CupertinoAlertDialog', 'onTap': () => _showCupertinoDialog(context)},
      {'title': 'Adaptive Dialog (showAdaptiveDialog)', 'onTap': () => _showAdaptiveDialog(context)},
      {'title': 'SimpleDialog', 'onTap': () => _showSimpleDialog(context)},
      {'title': 'Time Picker', 'onTap': () => _showTimePicker(context)},
      {'title': 'Date Picker', 'onTap': () => _showDatePicker(context)},
      {'title': 'About Dialog', 'onTap': () => _showAboutDialog(context)},
      {'title': 'Custom Dialog', 'onTap': () => _showCustomDialog(context)},
      {
        'title': 'Menu',
        'onTap': () async {

          final RenderBox box = context.findRenderObject() as RenderBox;
          final position = box.localToGlobal(Offset.zero) + const Offset(50, 100);
          _showMenu(context, position);
        }
      },
      {'title': 'Modal Bottom Sheet', 'onTap': () => _showModalBottomSheet(context)},
      {'title': 'Cupertino Modal Popup', 'onTap': () => _showCupertinoModalPopup(context)},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('All Dialogs Demo')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: dialogOptions.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final option = dialogOptions[index];
          return ListTile(
            title: Text(option['title'] as String),
            onTap: option['onTap'] as void Function(),
          );
        },
      ),
    );
  }
}
