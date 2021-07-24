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
  final _formKey = GlobalKey<FormState>();
  TextEditingController _numController = new TextEditingController();
  _submitForm() {
    FocusScope.of(context).unfocus();
    _formKey.currentState!.save();
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (builder) => OTPverify(_numController.text.trim())),
        (route) => false);
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
                Form(
                  key: _formKey,
                  child: TextFormField(
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
                      if ((val!.trim().isEmpty && val.trim().startsWith('0'))) {
                        return 'please enter a valid phone number';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _numController.text = val!.trim();
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () {
                    _submitForm();
                    // verifyPhoneNumber(_numController.text, context);
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (builder) =>
                    //             OTPverify(_numController.text.trim())),
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
