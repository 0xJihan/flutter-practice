import 'dart:ui';
import 'package:flutter/material.dart';

class BackdropExample extends StatelessWidget {
  const BackdropExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.network(
            'https://picsum.photos/800/600',
            fit: BoxFit.cover,
          ),

          // Blurred overlay
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 200,
                  height: 120,
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.2),
                  child: const Text(
                    'Frosted Glass',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
