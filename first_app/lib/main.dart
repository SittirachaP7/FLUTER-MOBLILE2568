import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(home: TrafficLight(), debugShowCheckedModeBanner: false),
  );
}

class TrafficLight extends StatelessWidget {
  const TrafficLight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Stack(
          children: [
            // กรอบไฟจราจร
            Container(
              width: 120,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            // ไฟแดง
            const Positioned(
              top: 20,
              left: 20,
              child: CircleAvatar(radius: 40, backgroundColor: Colors.red),
            ),
            const Positioned(
              top: 110,
              left: 20,
              child: CircleAvatar(radius: 40, backgroundColor: Colors.yellow),
            ),
            const Positioned(
              top: 200,
              left: 20,
              child: CircleAvatar(radius: 40, backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
