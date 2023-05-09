import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const routeName='/login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading=false;
  var _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _isLoading?const Center(child: CircularProgressIndicator()):Container(),
            const SizedBox(height: 24),
            Text('Create your account'),
            const SizedBox(height: 24),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email'
              ),
            ),
            const SizedBox(height: 8),
            MaterialButton(
                height: 40,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                onPressed: () async {
                  setState(() {
                    _isLoading=true;
                  });
                  final email = _emailController.text;
                  final snackbar = SnackBar(content: Text(email));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
            )
          ],
        )
      ),
    );
  }
}
