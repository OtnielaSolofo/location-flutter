import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {

  String url;

  Networking({required this.url});

  Future getData() async {

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return print('error');
    }

  }


}
