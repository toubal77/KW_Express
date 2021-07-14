import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kw_express/home_widget.dart';

class OTPverify extends StatefulWidget {
  // final String? verificationId;
  // OTPverify(this.verificationId);
  @override
  _OTPverifyState createState() => _OTPverifyState();
}

class _OTPverifyState extends State<OTPverify> {
  TextEditingController _codeController = new TextEditingController();

  // void showSnackBar(BuildContext context, String text) {
  //   final snackBar = SnackBar(content: Text(text));
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  // Future<void> signInwithPhoneNumber(
  //     String? verificationId, String? smsCode, BuildContext context) async {
  //   try {
  //     AuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: verificationId!, smsCode: smsCode!);

  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);

  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: (builder) => HomeWidget()),
  //         (route) => false);

  //     showSnackBar(context, "logged In");
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
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
                  onPressed: () {
                    // signInwithPhoneNumber(
                    //     widget.verificationId, _codeController.text, context);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (builder) => HomeWidget()),
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
