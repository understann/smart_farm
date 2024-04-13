import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_farm/bloc/auth_bloc.dart';
import 'package:smart_farm/screen/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final inputEmailController = TextEditingController();
  final inputPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error,
              ),
            ),
          );
        }

        if (state is AuthSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
            (route) => false,
          );
        }
      }, builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/smart_farm_logo.svg'),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Automatic Planting System',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: TextField(
                  controller: inputEmailController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffcdcdcd),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF47D404),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: const Icon(Icons.account_box),
                      floatingLabelStyle: const TextStyle(
                        color: Color(0xFF47D404),
                      ),
                      labelText: "Email or username"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: TextField(
                  obscureText: true,
                  obscuringCharacter: 'x',
                  controller: inputPasswordController,
                  decoration: InputDecoration(

                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffcdcdcd)),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF47D404)),
                        borderRadius: BorderRadius.circular(15)),
                    prefixIcon: const Icon(Icons.lock),
                    floatingLabelStyle:
                        const TextStyle(color: Color(0xFF47D404)),
                    labelText: "Password",
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  print('Username : ${inputEmailController.text}');
                  print('Password : ${inputPasswordController.text}');
                  context.read<AuthBloc>().add(
                        AuthLoginRequested(email: 'asd', password: 'asdadasd'),
                      );
                },
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Color(0xFF656565),
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
