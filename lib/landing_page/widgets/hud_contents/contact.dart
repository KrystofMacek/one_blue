import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_blue/common/colors.dart';
import 'package:one_blue/landing_page/content/hud_contents.dart';
import 'package:one_blue/landing_page/providers/animations.dart';
import 'package:one_blue/landing_page/providers/hud_pager.dart';

class ContactPageContent extends StatelessWidget {
  const ContactPageContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contact',
              style: TextStyle(
                fontFamily: 'Neuropol',
                fontSize: 40,
                color: Colors.white60,
                shadows: [
                  Shadow(
                    color: Colors.white,
                    blurRadius: 2,
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          child: Container(child: EmailForm()),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class EmailForm extends StatefulWidget {
  const EmailForm({
    Key key,
  }) : super(key: key);

  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _messageController;

  final _formKey = GlobalKey<FormState>();

  Future<void> _send() async {
    // context.read(waitingIndicatorProvider).toggle();
    final data = {
      'name': _nameController.text.toString(),
      'email': _emailController.text.toString(),
      'message': '[App] ${_messageController.text.toString()}',
    };

    FirebaseFunctions.instance.httpsCallable('sendMail').call(data);
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _messageController = TextEditingController();
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(
                    color: Colors.white, fontSize: 22, letterSpacing: 1.6),
                validator: (value) {
                  if (value.isEmpty) {
                    return '';
                  }
                  return null;
                },
                controller: _nameController,
                decoration: CustomDecoration.getInputDecoration('Name'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: TextStyle(
                    color: Colors.white, fontSize: 22, letterSpacing: 1.6),
                validator: (value) {
                  final String val = value.trim();
                  if (val.isEmpty) {
                    return '';
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
                      .hasMatch(val)) {
                    return '';
                  }
                  return null;
                },
                controller: _emailController,
                decoration: CustomDecoration.getInputDecoration('Email'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: TextStyle(
                    color: Colors.white, fontSize: 22, letterSpacing: 1.6),
                validator: (value) {
                  if (value.isEmpty) {
                    return '';
                  }
                  return null;
                },
                controller: _messageController,
                minLines: 8,
                maxLines: 10,
                decoration: CustomDecoration.getInputDecoration('Message'),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                elevation: 2,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: CustomColors.fullTorq.withOpacity(.5),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _send();
                  }
                },
                child: Text(
                  'Send',
                  style: TextStyle(
                    fontFamily: 'Neuropol',
                    fontSize: 24,
                    color: Colors.white60,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 2,
                      )
                    ],
                  ),
                ),
              ),
              // Consumer(
              //   builder: (context, watch, child) {
              //     return !watch(waitingIndicatorProvider.state)
              //         ? ConstrainedBox(
              //             constraints:
              //                 BoxConstraints(maxWidth: 150, minHeight: 50),
              //             child: MaterialButton(
              //               minWidth: double.infinity,
              //               elevation: 2,
              //               shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(10)),
              //               color: CustomColors.fullBlue,
              //               onPressed: () async {
              //                 if (_formKey.currentState.validate()) {
              //                   // _send();
              //                 }
              //               },
              //               child: Text(
              //                 'Send',
              //                 style:
              //                     TextStyle(color: Colors.white, fontSize: 32),
              //               ),
              //             ),
              //           )
              //         : Center(
              //             child: CircularProgressIndicator(),
              //           );
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }
}

abstract class CustomDecoration {
  static InputDecoration getInputDecoration(String hint) => InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        hintText: hint,
        hintStyle:
            TextStyle(color: Colors.white, fontSize: 22, letterSpacing: 1.6),
        isDense: true,
        fillColor: Colors.white10,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red[300], width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red[300], width: 1.5),
        ),
      );
}
