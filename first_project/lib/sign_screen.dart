import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'home_screen.dart';

class signscreen extends StatefulWidget {
  const signscreen({super.key});

  @override
  State<signscreen> createState() => _signscreenState();
}

class _signscreenState extends State<signscreen> {
  final formKey = GlobalKey<FormBuilderState>();
  List gender = ['male', 'female', 'others'];
  String? userName;
  String? email;
  String? password;
  String? genderSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN SCREEN"),
        backgroundColor: Colors.tealAccent,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            FormBuilder(
              key: formKey,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: "User Name",
                    decoration: const InputDecoration(
                        hintText: "Enter User Name", labelText: "User name"),
                    readOnly: false,
                    enabled: true,
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                            errorText: "this field is required")
                      ],
                    ),
                    onChanged: (value) {
                      setState(() {
                        userName = value;
                      });
                    },
                  ),
                  FormBuilderTextField(
                    name: "Email id",
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: "Enter Email Id", labelText: "Email id"),
                    readOnly: false,
                    enabled: true,
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                            errorText: "this field is required"),
                        FormBuilderValidators.email()
                      ],
                    ),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  FormBuilderTextField(
                    name: "Password",
                    decoration: const InputDecoration(
                        hintText: "Enter password", labelText: "password"),
                    readOnly: false,
                    enabled: true,
                    obscureText: true,
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                            errorText: "this field is required")
                      ],
                    ),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  FormBuilderDropdown(
                    name: "Gender",
                    items: gender
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: "This field is required")
                    ]),
                    decoration: const InputDecoration(
                        hintText: "Select Gender", labelText: "gender"),
                    onChanged: (newValue) {
                      setState(() {
                        genderSelected = newValue.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  userName =
                      formKey.currentState!.value["User Name"].toString();
                  email = formKey.currentState!.value["Email id"].toString();
                  password = formKey.currentState!.value["Password"].toString();
                  genderSelected =
                      formKey.currentState!.value["Gender"].toString();
                  print(userName);
                  print(password);
                  print(genderSelected);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                userName: userName!,
                                email: email!,
                                password: password!,
                                genderSelected: 'gender',
                                //gender: genderSelected!,
                              )));
                  formKey.currentState!.fields['User Name']!.reset();
                  formKey.currentState!.fields['email']!.reset();
                  formKey.currentState!.fields['Password']!.reset();
                  formKey.currentState!.fields['Gender']!.reset();
                } else {
                  print("Error");
                }
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent,
              ),
            )
          ],
        )),
      ),
    );
  }
}
