import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Login.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Register',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text('Register'),
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Username',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Container(
                      height: 80,
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: const Text('Register'),
                        onPressed: () async {
                          final url = Uri.parse(
                              'http://192.168.1.107:3000/user/register');
                          final headers = {'Content-Type': 'application/json'};
                          final body = jsonEncode({
                            'username': usernameController.text,
                            'password': passwordController.text
                          });

                          final response = await http.post(url,
                              headers: headers, body: body);

                          if (response.statusCode == 200) {
                            final responseData = jsonDecode(response.body);
                            if (responseData['status'] == 'success') {
                              print('Register successful.');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            } else {
                              print(
                                  'Register failed: ${responseData['message']}.');
                            }
                          } else {
                            print(
                                'Request failed with status: ${response.statusCode}.');
                          }
                        },
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
            )));
  }
}
