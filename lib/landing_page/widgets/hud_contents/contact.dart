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
import 'dart:html' as html;

class ContactPageContent extends StatelessWidget {
  const ContactPageContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    double _titleFS = 40;
    if (_size.width < 1100) {
      _titleFS = 30;
    }

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
                fontSize: _titleFS,
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
    Size _size = MediaQuery.of(context).size;
    double _contentFS = 22;
    if (_size.width < 1100) {
      _contentFS = 20;
    }
    return Consumer(
      builder: (context, watch, child) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(
                    color: Colors.white,
                    fontSize: _contentFS,
                    letterSpacing: 1.6),
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
                    color: Colors.white,
                    fontSize: _contentFS,
                    letterSpacing: 1.6),
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
                    color: Colors.white,
                    fontSize: _contentFS,
                    letterSpacing: 1.6),
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
                    fontSize: _contentFS,
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
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      html.window.open(
                          'https://www.upwork.com/freelancers/~01cf85c82de830b317?s=996364627857502209',
                          'new tab');
                    },
                    child: Image.asset(
                      'assets/logos/upwork.png',
                      width: _size.width * .1,
                    ),
                  )
                ],
              ),
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
