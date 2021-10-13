import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:le_auth_proj/screens/home_screen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

enum MobileVerificationState {
  showLoginFormState,
  showOtpFormState,
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentstate =
      MobileVerificationState.showLoginFormState;

  final phoneController = TextEditingController();
  var otpController = TextEditingController();
  var pinCode;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationID;
  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    } on FirebaseException catch (e) {
      setState(() {
        showLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  getLoginFormWidget(context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 330),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              color: Color(0xFF2F3037),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: const Text(
            'Please enter your mobile number',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text("You'll recieve a 4 digit code"),
        const Text("to verify next."),
        const SizedBox(
          height: 32,
        ),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          width: 380,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.zero,
            border: Border.all(
                color: Colors.black, width: 1.5, style: BorderStyle.solid),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 7),
                child: Image.asset('assets/india 2.png'),
              ),
              const SizedBox(
                width: 17,
              ),
              const Text(
                '+91',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                '-',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required';
                      } else {
                        return null;
                      }
                    },
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      counterStyle: TextStyle(
                        height: double.minPositive,
                      ),
                      counterText: "",
                      border: InputBorder.none,
                      hintText: 'Mobile Number',
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: MaterialButton(
            minWidth: 300,
            height: 50,
            onPressed: () {
              setState(() {
                showLoading = true;
              });
              _auth.verifyPhoneNumber(
                phoneNumber: "+91${phoneController.text}",
                verificationCompleted: (phoneAuthCredential) async {
                  setState(() {
                    showLoading = false;
                  });
                },
                verificationFailed: (verificationFailed) async {
                  setState(() {
                    showLoading = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        verificationFailed.message.toString(),
                      ),
                    ),
                  );
                },
                codeSent: (verificationId, resendingToken) async {
                  setState(() {
                    showLoading = false;
                    currentstate = MobileVerificationState.showOtpFormState;
                    verificationID = verificationId;
                  });
                },
                codeAutoRetrievalTimeout: (verificationId) async {},
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
        const Spacer(),
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Vector1.png'), fit: BoxFit.fill),
              ),
            ),
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Vector.png'), fit: BoxFit.fill),
              ),
            ),
          ],
        )
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 330),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF2F3037),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: const Text(
            'Verify Phone',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text("Code is sent to ${phoneController.text}",
            style: const TextStyle(fontSize: 20)),
        const SizedBox(
          height: 26,
        ),
        OTPTextField(
          outlineBorderRadius: 0,
          length: 6,
          width: MediaQuery.of(context).size.width - 27,
          fieldWidth: 58,
          otpFieldStyle: OtpFieldStyle(
            focusBorderColor: Colors.white,
            disabledBorderColor: Colors.white,
            enabledBorderColor: Colors.white,
            backgroundColor: const Color(0xFF93D2F3),
            borderColor: Colors.white,
          ),
          style: const TextStyle(
              fontSize: 17, color: Colors.black87, fontWeight: FontWeight.bold),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.box,
          onCompleted: (pin) {
            pinCode = pin;
          },
          onChanged: (pin) {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Didn't recieve the code?",
              style: TextStyle(fontSize: 18),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Request Again",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: MaterialButton(
            minWidth: 300,
            height: 50,
            onPressed: () {
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationID, smsCode: pinCode);
              signInWithPhoneAuthCredential(phoneAuthCredential);
            },
            color: const Color(0xFF2E3B62),
            child: const Center(
              child: Text(
                'VERIFY AND CONTINUE',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: showLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : currentstate == MobileVerificationState.showLoginFormState
                    ? getLoginFormWidget(context)
                    : getOtpFormWidget(context),
          ),
        ),
      ),
    );
  }
}
