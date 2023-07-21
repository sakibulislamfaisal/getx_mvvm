import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors/app_color.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'.tr),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: loginVM.emailController.value,
                      focusNode: loginVM.emailFocusNode.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar('Email', 'Enter Your Email');
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieldFocuschange(
                            context,
                            loginVM.emailFocusNode.value,
                            loginVM.passFocusNode.value);
                      },
                      decoration: InputDecoration(
                        hintText: 'email_hint'.tr,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: loginVM.passwordController.value,
                      focusNode: loginVM.passFocusNode.value,
                      obscureText: true,
                      obscuringCharacter: '*',
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar('Password', 'Enter Your Password');
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {},
                      decoration: InputDecoration(
                        hintText: 'password_hint'.tr,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Obx(() => RoundButton(
                title: 'login'.tr,
                loading: loginVM.loading.value,
                width: 200,
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    loginVM.loginApi();
                  }
                }))
          ],
        ),
      ),
    );
  }
}
