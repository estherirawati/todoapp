import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/ui/todolistpage.dart';

class LoginPage extends StatefulWidget {
  static const routeName='/login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  bool _isLoading=false;
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  bool _obscureText = true;
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
            TextField(
              controller: _passwordController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _obscureText=!_obscureText;
                        });
                      },
                      icon: Icon((_obscureText==true)? Icons.visibility:Icons.visibility_off)),
                  hintText: 'Password'
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
                  try {
                    final navigator = Navigator.of(context);
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    await _auth.signInWithEmailAndPassword(email: email, password: password);
                    navigator.pushReplacementNamed(ToDoListPage.routeName);
                  } on Exception catch (e) {
                    final snackbar = SnackBar(content: Text(e.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  } finally{
                    setState(() {
                      _isLoading=false;
                    });
                  }

                },
                child: Text('Login')
            ),
            TextButton(onPressed: (){

            }, child: Text('Register Here')),
          ],
        )
      ),
    );
  }
}
