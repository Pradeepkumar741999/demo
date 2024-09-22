import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logincrystaldemo/constants.dart';
import 'package:logincrystaldemo/model/get_company.dart';

class ApiService {
  static String baseUrl = '';

  Future getUsers() async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://moblienew.wallethr.com/api/Login/GenerateTokenId?CompanyId=1&Username=1&Password=1'),
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods':
                'POST, GET, OPTIONS, PUT, DELETE, HEAD',
            'Access-Control-Allow-Headers':
                'custId, appId, Origin, Content-Type, Cookie, X-CSRF-TOKEN, Accept, Authorization, X-XSRF-TOKEN, Access-Control-Allow-Origin',
            'Access-Control-Max-Age': '3600'
          });
      if (response.statusCode == 200) {
        // List<GetCompany> _model = userModelFromJson(response.body);
        // return _model;
        print(response);
      } else {
        print(response);
      }
    } catch (e) {
      log(e.toString());
      print(e.toString());
    }
  }
}
