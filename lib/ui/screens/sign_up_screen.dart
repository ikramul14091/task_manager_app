import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneNumberTEController =
      TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text(
                    'Join With Us',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Enter your email..'),
                    validator: (String? value) {
                      String email = value ?? '';
                      if (EmailValidator.validate(email) == false) {
                        return 'Please enter a valid email!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _firstNameTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Enter your first name..',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Please enter your first name!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNameTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Enter your last name..',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Please enter your last name!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _phoneNumberTEController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Enter your mobile number..',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Please enter your mobile number!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your password..',
                    ),
                    validator: (String? value) {
                      if ((value?.length ?? 0) <= 6) {
                        return 'Please enter a valid password!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _onTapSignUpButton,
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),

                  const SizedBox(height: 32),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Have an account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: 0.4,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSignInButton,
                          ),
                        ],
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

  void _onTapSignUpButton() {
    if (_formkey.currentState!.validate()) {
      //TODO: Sign Up with API
    }
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _phoneNumberTEController.dispose();
    _passwordTEController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
