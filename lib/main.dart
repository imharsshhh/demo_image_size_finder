// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

void main() {
  runApp(const MaterialApp(
    home: BioMetricLoginPage(),
  ));
}

class BioMetricLoginPage extends StatefulWidget {
  const BioMetricLoginPage({Key? key}) : super(key: key);

  @override
  _BioMetricLoginPageState createState() => _BioMetricLoginPageState();
}

class _BioMetricLoginPageState extends State<BioMetricLoginPage> {
  final LocalAuthentication auth = LocalAuthentication();
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  Future<bool> checkingForBioMetrics() async {
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    return canCheckBiometrics;
  }

  Future<void> _authenticateMe() async {
    bool authenticated = false;
    try {
      // ignore: deprecated_member_use
      authenticated = await auth.authenticateWithBiometrics(
        androidAuthStrings:
            AndroidAuthMessages(signInTitle: 'Face ID required'),

        localizedReason:
            "Authenticate finger data for Testing", // message for dialog
        useErrorDialogs: true, // show error in dialog
        stickyAuth: true, // native process
      );
      setState(() {
        _authorized = authenticated ? "Authorized" : "Not Authorized";
      });
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  @override
  void initState() {
    checkingForBioMetrics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current State: $_authorized\n'),
            (_isAuthenticating)
                ? ElevatedButton(
                    onPressed: _cancelAuthentication,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text("Cancel Authentication"),
                        Icon(Icons.cancel),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      ElevatedButton(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('Authenticate'),
                            Icon(Icons.fingerprint),
                          ],
                        ),
                        onPressed: _authenticateMe,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
