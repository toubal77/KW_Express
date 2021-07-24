import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kw_express/auth/optVerify.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  List<String> listKW = [
    'Commander vos repas maintenants',
    'Meilleur Livraison en Algerie',
    'Satisfactions garantie',
  ];
  TextEditingController _numController = new TextEditingController();

  // String? _verificationId;

  // Future<void> verifyPhoneNumber(
  //     String phoneNumber, BuildContext context) async {
  //   PhoneVerificationCompleted verificationCompleted =
  //       (PhoneAuthCredential phoneAuthCredential) async {
  //     showSnackBar(context, "Verification Completed");
  //   };
  //   PhoneVerificationFailed verificationFailed =
  //       (FirebaseAuthException exception) {
  //     showSnackBar(context, exception.toString());
  //   };
  //   void Function(String verificationID, [int? forceResnedingtoken]) codeSent =
  //       (String verificationID, [int? forceResnedingtoken]) {
  //     _verificationId = verificationID;
  //     showSnackBar(context, "Verification Code sent on the phone number");
  //   };

  //   PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
  //       (String verificationID) {
  //     showSnackBar(context, "Time out");
  //   };
  //   try {
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //       timeout: Duration(seconds: 60),
  //       phoneNumber: phoneNumber,
  //       verificationCompleted: verificationCompleted,
  //       verificationFailed: verificationFailed,
  //       codeSent: codeSent,
  //       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
  //     );

  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: (builder) => OTPverify(_verificationId)),
  //         (route) => false);
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }

  // void showSnackBar(BuildContext ctx, String text) {
  //   final snackBar = SnackBar(content: Text(text));
  //   ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/drawable_png/splash_screen.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90.0, right: 90.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  key: ValueKey('NumberPhone'),
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  enableSuggestions: false,
                  controller: _numController,
                  decoration: new InputDecoration(
                    hintText: "Enter your number",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (val) {
                    if ((val!.trim().isEmpty && val.trim().length == 10)) {
                      return 'please enter a valid phone number';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _numController.text = val!.trim();
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () {
                    // verifyPhoneNumber(_numController.text, context);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (builder) =>
                                OTPverify(_numController.text.trim())),
                        (route) => false);
                  },
                  child: Container(
                    width: 120,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 3.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Text(
                      'suivant',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
