import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_Button.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/utils/routes/utils.dart';
import 'package:mvvm/view_model/call_api_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _emailNode = FocusNode();
  FocusNode _passwordNode = FocusNode();

  ValueNotifier<bool> isObscure = ValueNotifier(true);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    final apiProvider = Provider.of<CallingApiProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted:
                Utils.changeFocusNode(context, _emailNode, _passwordNode),
            focusNode: _emailNode,
            controller: _emailController,
            decoration: const InputDecoration(
                label: Text('Email'),
                hintText: 'Enter Email',
                prefixIcon: Icon(Icons.email)),
          ),
          const SizedBox(
            height: 20,
          ),
          ValueListenableBuilder(
            valueListenable: isObscure,
            builder: (context, value, child) {
              return TextFormField(
                obscuringCharacter: '*',
                obscureText: isObscure.value,
                focusNode: _passwordNode,
                controller: _passwordController,
                decoration: InputDecoration(
                    label: Text('Password'),
                    hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                        onTap: () {
                          isObscure.value = !isObscure.value;
                        },
                        child: Icon(isObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility))),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          RoundButton(
            title: 'Login',
            isLoading: apiProvider.isLoading,
            onPress: () {
              if (_emailController.text.isEmpty) {
                Utils.showFlushBar("Please Enter Email", context);
              } else if (_passwordController.text.length < 6) {
                Utils.showFlushBar(
                    "Enter passwords more than 6 characters", context);
              } else if (_passwordController.text.isEmpty) {
                Utils.showFlushBar("Please Enter Password", context);
              } else {
                Map data = {
                  'email': _emailController.text.toString(),
                  'password': _passwordController.text.toString()
                };
                apiProvider.callLoginApi(data, context);
                print("Api Hitted");
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesNames.signUp);
              },
              child: const Text("Don't have an account? SignUp"))
        ],
      ),
    );
  }
}
