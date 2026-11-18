import 'package:chat_app/widgets/button_blue.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:chat_app/widgets/labels.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                  Logo(title: "Registro"),
                  _Form(),
                  Labels(navigationRoute: 'login', title: '¿Ya tienes una cuenta?', subTitle: 'Ingresa ahora',),
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
  final nameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInput(
            prefixIcon: Icon(Icons.person_outline_rounded),
            placeHolder: 'Nombre',
            keyboardType: TextInputType.text,
            textEditingController: nameCtrl,
          ),

          CustomInput(
            prefixIcon: Icon(Icons.email_outlined),
            placeHolder: 'Correo electrónico',
            keyboardType: TextInputType.emailAddress,
            textEditingController: emailCtrl,
          ),

          CustomInput(
            obscureText: true,
            prefixIcon: Icon(Icons.lock_outlined),
            placeHolder: 'Contraseña',
            keyboardType: TextInputType.visiblePassword,
            textEditingController: passwordCtrl,
          ),

          ButtonBlue(
            onPressed: () {
              print(emailCtrl.text);
              print(passwordCtrl.text);
            },
            text: 'Iniciar sesión',
          ),
        ],
      ),
    );
  }
}
