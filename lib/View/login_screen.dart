import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_form_validation/Bloc/login_bloc.dart';
import 'package:flutter_bloc_form_validation/Bloc/login_event.dart';
import 'package:flutter_bloc_form_validation/Bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To with Login Bloc"),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state is LoginErrorState
                    ? Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "xyz@gmail.com",
                    labelText: "Email",
                  ),
                  onChanged: (value) {
                    BlocProvider.of<LoginBloc>(context).add(
                      LoginTextChangeEvent(
                        emailValue: emailController.text,
                        passwordValue: passwordController.text,
                      ),
                    );
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "********",
                    labelText: "Password",
                  ),
                  onChanged: (value) {
                    BlocProvider.of<LoginBloc>(context).add(
                      LoginTextChangeEvent(
                        emailValue: emailController.text,
                        passwordValue: passwordController.text,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 50),
                state is LoginLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () async {
                          if (state is LoginInvalidState) {
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginSubmittedEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                          }
                        },
                        child: const Text("Login"),
                      ),
              ],
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
