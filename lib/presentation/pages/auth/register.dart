import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmcars_clone/data/providers/register_provider.dart';
import 'package:tmcars_clone/presentation/pages/auth/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController phoneNumberntroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  bool _isHidden = true;
  bool _isHidden2 = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
    } else {}
  }

  String errorText = '';
  String errorText2 = '';
  String errorText3 = '';
  String errorText4 = '';
  String errorText5 = '';
  String errorText6 = '';

  @override
  void initState() {
    super.initState();
    // fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ulgama ýazylmak'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.car_crash),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Text(
                    '+993',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: TextFormField(
                      controller: phoneNumberntroller,
                      maxLines: 1,
                      decoration:
                          InputDecoration(hintText: "Enter your number"),
                      keyboardType: TextInputType.number,
                    )),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                child: Text(errorText4,
                    style: TextStyle(fontSize: 12.0, color: Colors.red[700]))),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextFormField(
                    controller: passwordController,
                    maxLines: 1,
                    obscureText: _isHidden,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isHidden = !_isHidden;
                            });
                          },
                          child: _isHidden
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined),
                        )),
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                child: Text(errorText5,
                    style: TextStyle(fontSize: 12.0, color: Colors.red[700]))),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextFormField(
                    controller: passwordConfirmController,
                    decoration: InputDecoration(
                        hintText: "Password Config",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isHidden2 = !_isHidden2;
                            });
                          },
                          child: _isHidden2
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined),
                        )),
                    maxLines: 1,
                    obscureText: _isHidden2,
                    keyboardType: TextInputType.visiblePassword,
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                child: Text(errorText6,
                    style: TextStyle(fontSize: 12.0, color: Colors.red[700]))),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: Selector<RegistrationProvider, bool>(
                    selector: (context, register) => register.isLoading,
                    builder: (_, isLoading, __) {
                      return ElevatedButton(
                          onPressed: () {
                            if (phoneNumberntroller.text.isEmpty) {
                              setState(() {
                                errorText4 = 'phone_error';
                              });
                            }
                            if (phoneNumberntroller.text.isEmpty) {
                              setState(() {
                                errorText5 = 'password_error';
                              });
                            }
                            if (passwordConfirmController.text.isEmpty) {
                              setState(() {
                                errorText6 = 'password_error';
                              });
                            }

                            if (passwordController.text.isNotEmpty &&
                                phoneNumberntroller.text.isNotEmpty) {
                              context
                                  .read<RegistrationProvider>()
                                  .postDataProvider(
                                    context,
                                    '993${phoneNumberntroller.text}',
                                    passwordController.text,
                                    passwordConfirmController.text,
                                  );
                            } else {}
                          },
                          child: isLoading == false
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Tassyklamak'),
                                )
                              : CircularProgressIndicator());
                    }),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: Text('Ulgama girmek'))
          ],
        ),
      )),
    );
  }
}
