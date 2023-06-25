import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<String> loginApiRequest(String email, String password) async {
    var url = Uri.parse('http://localhost/inventory_api/api.php');
    var data = {'username': email, 'password': password};
    var response = await http.post(url, body: json.encode(data));
    var message = jsonDecode(response.body);
    return message;
  }
}
