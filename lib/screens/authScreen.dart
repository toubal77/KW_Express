import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kw_express/screens/homePage.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _numController = new TextEditingController();
  TextEditingController _codeController = new TextEditingController();
  bool _valid = false;
  _submitForm() {
    _formKey.currentState!.save();
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
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
          Container(
            margin: const EdgeInsets.only(top: 400),
            child: Padding(
              padding: const EdgeInsets.only(left: 90.0, right: 90.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    if (!_valid)
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
                          if ((val!.trim().isEmpty &&
                              val.trim().length == 10)) {
                            return 'please enter a valid phone number';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _numController.text = val!.trim();
                        },
                      ),
                    if (_valid)
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
                        setState(() {
                          !_valid ? _valid = true : _submitForm();
                        });
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
            ),
          ),
        ],
      ),
    );
  }
}
