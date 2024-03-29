import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kw_express/home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPverify extends StatefulWidget {
  final numPhone;
  OTPverify(this.numPhone);
  @override
  _OTPverifyState createState() => _OTPverifyState();
}

class _OTPverifyState extends State<OTPverify> {
  TextEditingController _codeController = new TextEditingController();

  late String _verificationCode;

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  void showSnackBar(BuildContext ctx, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+213${widget.numPhone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          showSnackBar(context, "Verification Completed");
          if (value.user != null) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('numTel', '0${widget.numPhone}');
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeWidget()),
                (route) => false);
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationID, [int? forceResnedingtoken]) {
        setState(() {
          _verificationCode = verificationID;
        });
        showSnackBar(context, "Verification Code sent on the phone number");
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        setState(() {
          _verificationCode = verificationID;
        });
      },
    );
  }

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
                  key: ValueKey('CodeConfirme'),
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  enableSuggestions: false,
                  controller: _codeController,
                  decoration: new InputDecoration(
                    hintText: "Enter code",
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
                    if (val!.trim().isEmpty && val.trim().length == 6) {
                      return 'please enter a valid code';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _codeController.text = val!.trim();
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _verificationCode,
                              smsCode: _codeController.text.trim()))
                          .then((value) async {
                        if (value.user != null) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeWidget()),
                              (route) => false);
                        }
                      });
                    } catch (e) {
                      showSnackBar(context, e.toString());
                    }
                    // signInwithPhoneNumber(
                    //     widget.verificationId, _codeController.text, context);
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(builder: (builder) => HomeWidget()),
                    //     (route) => false);
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
