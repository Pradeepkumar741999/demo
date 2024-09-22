import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:logincrystaldemo/model/get_company.dart';
import 'package:logincrystaldemo/service/api_service.dart';
import 'package:validators/validators.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'URL Validation Demo',
      home: HomePage(),
    ),
  );
}

class HomePage extends HookWidget {
  HomePage({super.key});

  final _formKey = GlobalKey<FormState>();
  late List<GetCompany>? _getCompany = [];
  final passURL = TextEditingController();
  String modify_url = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crystal HR'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _Form(),
          ],
        ),
      ),
    );
  }

  _Form() {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: passURL,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'URL',
              ),
              validator: (value) {
                return _validate(value);
              },
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Connect'),
              onPressed: () {
                _Connect();
              },
            ),
          ],
        ),
      ),
    );
  }

  _validate(String? urlPass) {
    String url = urlPass.toString();

    if (url.contains('https://') || url.contains('http://')) {
      modify_url = url;
    } else {
      modify_url = 'https://' + url;
    }
    if (!isURL(modify_url)) {
      return 'Please enter a valid URL';
    }
    return null;
  }

  _Url_validate() {}

  _Connect() {
    var form = _formKey.currentState;
    if (form!.validate()) {
      ApiService.baseUrl = passURL.text;
      _getData();
    } else {}
  }

  void _getData() async {
    _getCompany = (await ApiService().getUsers());
  }
}
