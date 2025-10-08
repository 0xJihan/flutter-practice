import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TextFormValidationExample extends StatefulWidget {
  const TextFormValidationExample({super.key});

  @override
  State<TextFormValidationExample> createState() => _TextFormValidationExampleState();
}

class _TextFormValidationExampleState extends State<TextFormValidationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text("Text Form Validation Example",
            style: TextStyle(
              fontSize: 26.sp,
            ),
            )

          ],
        ),
      ),
    );
  }
}
