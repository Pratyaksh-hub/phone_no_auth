import 'package:flutter/material.dart';
import 'package:le_auth_proj/screens/login_screen.dart';

class Starting extends StatefulWidget {
  const Starting({Key? key}) : super(key: key);

  @override
  _StartingState createState() => _StartingState();
}

class _StartingState extends State<Starting> {
  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Icon(
              Icons.image_outlined,
              color: Colors.black,
              size: 80,
            ),
          ),
          const Center(
            child: Text(
              "PLease select your Language",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "You can change the language",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Center(
            child: Text(
              "at any time.",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 57),
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black)),
            child: DropdownButton<String>(
              style: const TextStyle(fontSize: 20, color: Colors.black),
              isExpanded: true,
              value: dropdownValue,
              iconSize: 35,
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['English', 'Hindi']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 43,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            minWidth: 300,
            height: 60,
            color: const Color(0xFF2E3B62),
            child: const Text(
              "NEXT",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
          const Spacer(),
          Stack(
            children: [
              Container(
                width: 600,
                height: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Vector (2).png'),
                      fit: BoxFit.fill),
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Vector (3).png'),
                      fit: BoxFit.fill),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
