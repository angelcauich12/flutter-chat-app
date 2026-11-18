import 'package:chat_app/widgets/button_blue.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:chat_app/widgets/labels.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(title: "Messenger",),
                  _Form(),
                  Labels(navigationRoute: 'register', title: '¿No tienes cuenta?', subTitle: 'Crea una ahora',),
                  Text(
                    'Terminos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),

                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailtCtrl = TextEditingController();
  final passwordtCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInput(
            prefixIcon: Icon(Icons.email_outlined),
            placeHolder: 'Correo electrónico',
            keyboardType: TextInputType.emailAddress,
            textEditingController: emailtCtrl,
          ),

          CustomInput(
            obscureText: true,
            prefixIcon: Icon(Icons.lock_outlined),
            placeHolder: 'Contraseña',
            keyboardType: TextInputType.visiblePassword,
            textEditingController: passwordtCtrl,
          ),

          ButtonBlue(
            onPressed: () {
              print(emailtCtrl.text);
              print(passwordtCtrl.text);
            },
            text: 'Iniciar sesión',
          ),
        ],
      ),
    );
  }
}
