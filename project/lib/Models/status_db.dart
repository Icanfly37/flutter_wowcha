import 'package:ku_t/Services/apiconnector/callapt.dart';


//fetchData(); // Start the process to fetch data without waiting for it
//Text(globalValue); // Display the value in the widget
//bool globalValue =false;
// Define a function to fetch data as a Future

class get_status_db{

  Future<bool> fetchData(String target_collection) async {
    final Map<dynamic, dynamic> status = {
      "collection" : target_collection
    };
    bool data = await send_status_db(status);
    return data;
    //Future<bool> data = get_status_db(); // Assuming fetchDataAsync returns a Future<String>
  }
}

