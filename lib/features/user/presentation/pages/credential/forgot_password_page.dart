import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspaper_app/features/user/presentation/cubit/credential/credential_cubit.dart';

import '../../../../../core/global/common/common.dart';
import '../../../../../core/global/const/app_const.dart';
import '../../../../../core/global/const/page_const.dart';
import '../../../../../core/global/custom_text_field/textfield_container.dart';
import '../../../../../core/global/theme/style.dart';
import '../../../../../core/global/widgets/container_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {


  final TextEditingController _emailController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: greenColor),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Don't worry! Just fill in your email and ${AppConst.appName} will send you a link to rest your password.",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(.6),
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 30,),
              TextFieldContainer(
                prefixIcon: Icons.email,
                controller: _emailController,
                hintText: "Email",
              ),
              const SizedBox(height: 30,),
              ContainerButton(
                title: "Send Password Rest Email",
                onTap: (){
                  _submitForgotPasswordEmail();
                },
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  const Text(
                    'Remember the account information? ',
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamedAndRemoveUntil(context, PageConst.loginPage, (route) => false);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: greenColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForgotPasswordEmail() {
    
    if (_emailController.text.isEmpty){
      toast("Enter your email");
      return;
    }
    
    
    BlocProvider.of<CredentialCubit>(context).forgotPassword(email: _emailController.text).then((value) {
      toast("Email has been sent please check your mail.");
    });
    
  }
}
