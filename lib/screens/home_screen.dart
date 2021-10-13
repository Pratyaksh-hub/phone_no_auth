import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:le_auth_proj/screens/final.dart';
import 'package:le_auth_proj/screens/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedValue = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                await _auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              )),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
          ),
          const Center(
            child: Text(
              "PLease select your profile",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 380,
            height: 120,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black)),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Theme(
                    data: ThemeData(primaryColor: Colors.black),
                    child: Radio(
                      activeColor: Colors.black,
                      value: 1,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = 1;
                        });
                      },
                    ),
                  ),
                ),
                const Icon(
                  Icons.home_work_outlined,
                  size: 55,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Shipper",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Lorem ipsum dolor sit amet,"),
                    Text("consectetur adipiscing"),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 380,
            height: 120,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black)),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Radio(
                    activeColor: Colors.black,
                    value: 2,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = 2;
                      });
                    },
                  ),
                ),
                Image.asset(
                  'assets/Vector (1).png',
                  width: 70,
                  height: 60,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Transporter",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Lorem ipsum dolor sit amet,"),
                    Text("consectetur adipiscing"),
                    SizedBox(
                      height: 32,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: MaterialButton(
              minWidth: 300,
              height: 50,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Final(),
                  ),
                );
              },
              color: const Color(0xFF2E3B62),
              child: const Center(
                child: Text(
                  'CONTINUE',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
