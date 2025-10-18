import 'package:flutter/material.dart';
import 'AssignmentWeek6.dart'; // เรียกใช้ไฟล์ AssignmentWeek6.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Widget ProfileCard',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Widget ProfileCard')),
        body: Center(
          child: FadeIn(
            duration: Duration(seconds: 2), // เพิ่มแอนิเมชั่นให้ค่อย ๆ ปรากฏ
            child: ProfileCard(
              name: 'Paramet Sittiracha',
              position: 'Programmer Rookie',
              email: 'Sittiracha_p2@silpakorn.edu',
              phoneNumber: '0954814242',
              imageUrl:
                  'https://scontent.fbkk29-7.fna.fbcdn.net/v/t39.30808-6/471721881_3476098476018282_6687528858918824299_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeEMEfSF7xHk71-H1ZEAhbr-XgAXTI4BRFZeABdMjgFEVjinE-dH_aGxhGg93SZYXRs_dfv6qUvqRoFPOeM6XOMq&_nc_ohc=kcQRHwnOpVoQ7kNvwG08tAd&_nc_oc=Adn3GGwucDrhOTdyrDYEnW-DeJgteNU-3i1Bgh9r7PF5h_PqUZIxcSvkq1-GBa4zjGI&_nc_zt=23&_nc_ht=scontent.fbkk29-7.fna&_nc_gid=q_lOcwZkaQwQGBN7gwUHzg&oh=00_Afe4zqlRa7ngwvjGOHeNUR-Opuo1D-TBcIbX37ZgTczSSA&oe=68F9057C',
            ),
          ),
        ),
      ),
    );
  }
}

class FadeIn extends StatelessWidget {
  final Widget child;
  final Duration duration;

  FadeIn({required this.child, required this.duration});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(opacity: 1.0, duration: duration, child: child);
  }
}
