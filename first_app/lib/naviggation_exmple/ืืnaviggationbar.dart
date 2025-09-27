import 'package:flutter/material.dart';

class MyBottomNavApp extends StatefulWidget {
  const MyBottomNavApp({super.key});

  @override
  State<MyBottomNavApp> createState() => _MyBottomNavAppState();
}

class _MyBottomNavAppState extends State<MyBottomNavApp> {
  int _currentIndex = 0; // index ที่เลือกอยู่

  // หน้าหรือ widget แต่ละ tab
  final List<Widget> _pages = [
    const Center(child: Text("🏠 Home Page", style: TextStyle(fontSize: 24))),
    const Center(child: Text("🔍 Search Page", style: TextStyle(fontSize: 24))),
    const Center(
      child: Text("👤 Profile Page", style: TextStyle(fontSize: 24)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom NavigationBar Demo"),
        backgroundColor: Colors.red,
      ),
      body: _pages[_currentIndex], // เปลี่ยนหน้าตาม index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        selectedItemColor: Colors.red, // สีของ item ที่เลือก
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: MyBottomNavApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
