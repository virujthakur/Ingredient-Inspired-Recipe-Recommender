import 'package:http/http.dart' as http;

Future<String> sendStoresRequest() async {
  var request = http.MultipartRequest('GET', Uri.parse('http://192.168.29.155:5000/supermarket'));

  try {
    var response = await request.send();

    if (response.statusCode == 200) {
      // Successfully received a response
      return (await response.stream.bytesToString());
    } else {
      // Handle errors
      return 'Error: ${response.reasonPhrase}';
    }
  } catch (e) {
    // Handle exceptions
    return 'Exception: $e';
  }
}