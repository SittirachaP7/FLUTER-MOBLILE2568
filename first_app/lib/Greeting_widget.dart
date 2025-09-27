import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 5, 211, 226),
              Color.fromARGB(255, 2, 107, 139),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Container(
                width: 350,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.network(
                        'https://scontent.fbkk29-7.fna.fbcdn.net/v/t39.30808-6/471721881_3476098476018282_6687528858918824299_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeEMEfSF7xHk71-H1ZEAhbr-XgAXTI4BRFZeABdMjgFEVjinE-dH_aGxhGg93SZYXRs_dfv6qUvqRoFPOeM6XOMq&_nc_ohc=7jltfuU0POkQ7kNvwGWFli3&_nc_oc=AdmH4tSaRQOZlTm7wbpi_EOPXmp_UetViOgp6TawyEibhpGEmiAUYrPAQ9K3NUwl-6Q&_nc_zt=23&_nc_ht=scontent.fbkk29-7.fna&_nc_gid=fa2A_ATpzF2eCb-CcHFwAw&oh=00_AfWTJHzSiZ3rcop7nmvFiRQ9E2laL7iZLj9_8ZZecrN1OA&oe=68AEF93C',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 15),

                    const Text(
                      '660710248 Paramet Sittiracha',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 77, 74, 74),
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const Text(
                      'สาขาเทคโนโลยีสารสนเทศ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(1255, 77, 74, 74),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      height: 2,
                      color: Colors.black26,
                    ),

                    const SizedBox(height: 10),
                    const Text(
                      'ผมชอบกินโกโก้ครับ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 77, 74, 74),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
