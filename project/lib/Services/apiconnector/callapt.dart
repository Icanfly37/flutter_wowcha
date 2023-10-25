import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/services.dart';

//How to use it
// void main() async{
//   var op = api_operator();
//   //op.sendExcelFile("D:/excel_test/test.xlsx");

//   //String path_target = "C:/Users/icanfly37/Desktop/testexcelrecieve/";
//   //op.getExcelFile("${path_target}sample_excel.xlsx");

//   /*final Map<dynamic, dynamic> data = {
//     "name": 1,
//     "description": ["Sendit"],
//     "flow": {'sendit':1.5}
//   };
//   op.senddata(data);*/
  
//   var geter = await op.getdata(); 
//   print("THis is getdata");
//   // geter.forEach((key, value) {
//   //   print(key.toString()+":"+value);
//   // });
//   print(geter);
//   //print(geter["0"]);
//   //get all keys
//   /*Iterable keys = geter.keys;
//   List keyList = keys.toList();
//   int a = int.parse(keyList[0]);
//   print(a+5+1);*/

//   //get all values
//   /*
//   for (String i in geter.keys){
//     //print(geter[i]);
//     for (String j in geter[i].keys){
//       print(geter[i][j]);
//     }
//   }*/
// }


//send Excel file from frontend to backend
Future<String> testconnecting() async{
  try{
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/'));
    if (response.statusCode == 200){
      //print("Connected");
      return ("Connected");
    }
    else{
      //print("Refuse");
      return ("Refuse");
    }
  } catch (e){
    //print('Error: $e');
    //print("Not Found");
    return ("Not Found");
  }
}
Future<void> sendExcelFile(Stream<List<int>> stream,int size) async {
  try {
    // Replace with the URL of your API endpoint

    final apiUrl = Uri.parse('http://127.0.0.1:8000/downloadfiles/');
    
    // final response = await http.post(
    //   Uri.parse('http://127.0.0.1:8000/downloadfiles/'),
    //   body: bytes,
    //   headers: {
    //     'Content-Type': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', // Set the appropriate content type for Excel files
    //   },
    // );

    // Replace with the path to your Excel file

    //String excelFilebytes = bytes;

    final request = http.MultipartRequest('POST', apiUrl);
    request.files.add(await http.MultipartFile('file', stream,size,contentType: MediaType.parse(
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"),filename: "import_course.xlsx"
      ));
    //request.files.add(await http.MultipartFile.fromPath('file', excelFilePath));
    //request.files.add(await http.MultipartFile.fromBytes('file', bytes));
    final response = await request.send();
    if (response.statusCode == 200) {
      // File uploaded successfully
      print('File uploaded successfully');
    } else {
      // File upload failed
      print('File upload failed with status code: ${response.statusCode}');
    }
    Timer(Duration(milliseconds: 200), () { // delay time to end function
      //exit(0);
      SystemNavigator.pop();
    });
  } catch (e) {
    // Handle errors
    print('Error: $e');
  }
}
//get Excel file from backend to frontend
Future<void> getExcelFile(String path_for_export) async {
  final response = await http.post(Uri.parse('http://127.0.0.1:8000/uploadfile/'));

  if (response.statusCode == 200) {
    // final appDocDir = await getApplicationDocumentsDirectory();
    // final excelFilePath = '${appDocDir.path}/sample_excel.xlsx';
    String excelFilePath = path_for_export;

    // Save the downloaded file to the app's documents directory
    final file = File(excelFilePath);
    await file.writeAsBytes(response.bodyBytes);

    // Handle the downloaded file as needed, e.g., open it with a plugin or display it.
  } else {
    throw Exception('Failed to download Excel file');
  }
}

//get data from backend to frontend
Future<dynamic> getdata() async{
  //final url = Uri.parse('http://127.0.0.1:8000/test_send',Headers()); // Replace with your FastAPI endpoint
  //final response = await http.post(url);
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8000/test_send'),
    headers: {"Accept-Charset": "utf-8"}, // Set the charset header
  );
  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON data
    //String data = response.body;
    //final jsonData = json.decode(utf8.decode(response.body));
    final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    return jsonResponse['getjson'];
    // Process the data as needed
    // print(jsonData);
    //return jsonData;
  } else {
    // If the server did not return a 200 OK response, throw an exception
    throw Exception('Failed to load data');
  }
}

//send data from frontend to backend
Future<void> updates_data(String what_to_do, final Map<dynamic, dynamic> data) async {
  final url = Uri.parse('http://127.0.0.1:8000/update/'); // Replace with your FastAPI endpoint
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  //this is what do you want to send
  final Map<String,dynamic> onsite = {what_to_do:data};
  final response = await http.post(
    url,
    headers: headers,
    body: json.encode(onsite),
  );

  if (response.statusCode == 200) {
    // Request was successful
    print("Data sent successfully");
  } else {
    // Handle errors here
    print("Failed to send data. Status code: ${response.statusCode}");
  }
}

Future<bool> send_status_db(final Map<dynamic, dynamic> data) async {
  final url = Uri.parse('http://127.0.0.1:8000/detect_collection'); // Replace with your FastAPI endpoint
  final Map<String, String> headers = {
    'Content-Type': 'application/json',"Accept-Charset": "utf-8"
  };
  //this is what do you want to send

  final response = await http.post(
    url,
    headers: headers,
    body: json.encode(data),
  );

  if (response.statusCode == 200) {
    // Request was successful
    print("Data sent successfully");
    final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    bool now =jsonResponse['status'] as bool;
    //print(now);
    return now;
  } else {
    // Handle errors here
    //print("Failed to send data. Status code: ${response.statusCode}");
    throw Exception('Failed to load data');
  }
}

//get import status from backend to frontend
Future<bool> imported() async{
  //final url = Uri.parse('http://127.0.0.1:8000/test_send',Headers()); // Replace with your FastAPI endpoint
  //final response = await http.post(url);
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8000/status_import'),
    headers: {"Accept-Charset": "utf-8"}, // Set the charset header
  );
  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON data
    //String data = response.body;
    //final jsonData = json.decode(utf8.decode(response.body));
    final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    bool atnow = jsonResponse as bool;
    return atnow;
    // Process the data as needed
    // print(jsonData);
    //return jsonData;
  } else {
    // If the server did not return a 200 OK response, throw an exception
    throw Exception('Failed to load data');
  }
}