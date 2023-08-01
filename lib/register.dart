// ignore_for_file: library_private_types_in_public_api, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field_with_validator/intl_phone_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController countrycode = TextEditingController();

  var phone = '';
  @override
  void initState() {
   // countrycode.text = "+855";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xfff7f6fb),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 32,
            color: Colors.black54,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/phone.png')),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Registration',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Add your phone number. we'll send you a verification code so we know you're real",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            /// newpick  country
                            IntlPhoneField(
                              decoration: InputDecoration(
                                //labelText: 'Phone Number',
                                hintText: 'Number Phone',
                                labelStyle:
                                    TextStyle(color: Colors.purple.shade900),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.purple.shade500),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.purple.shade500),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 22,
                                ),
                              ),
                              initialCountryCode: 'KH',
                              showCountryFlag: true,
                              invalidNumberMessage:
                                  AutofillHints.telephoneNumber,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              autofocus: true,
                              dropdownIcon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.purple.shade500,
                              ),
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                print(
                                    "Hi----------------------------------------------------------");
                                print(value.completeNumber);

                                phone = value.completeNumber;
                              },
                            ),

                            const SizedBox(
                              height: 22,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  print(countrycode.text + phone);
                                  await FirebaseAuth.instance.verifyPhoneNumber(
                                    phoneNumber: '${countrycode.text + phone}',
                                    verificationCompleted:
                                        (PhoneAuthCredential credential) {},
                                    verificationFailed:
                                        (FirebaseAuthException e) {
                                      print(e.code);
                                    },
                                    codeSent: (String verificationId,
                                        int? resendToken) {},
                                    codeAutoRetrievalTimeout:
                                        (String verificationId) {},
                                  );
                                  // Navigator.of(context).push(   //https://firebase.google.com/docs/auth/flutter/manage-users
                                  //   MaterialPageRoute(
                                  //       builder: (context) => const Otp()),
                                  // );
                                },
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.purple),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(14.0),
                                  child: Text(
                                    'Send the code',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
