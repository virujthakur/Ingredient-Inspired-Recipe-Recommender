import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:path/path.dart';

Future<String> sendImagesRequest(Iterable<ImageFile> imageFiles) async {
    var request = http.MultipartRequest('POST', Uri.parse('http://localhost:5000/predict'));

    // Add each image file to the request
    for (final image in imageFiles) {
        if (image.hasPath) {
            request.files.add(await http.MultipartFile.fromPath('file', image.path!));
        } else {
            request.files.add(http.MultipartFile.fromBytes(
                'file',
                image.bytes!,
                filename: 'image.png', // Provide a default filename or use image.fileName if available
                contentType: MediaType('image', 'png'), // Provide a valid content type
            ));
        }
    }

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
