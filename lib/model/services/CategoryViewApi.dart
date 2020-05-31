import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:workkida/model/constants/UiConstants.dart';
import 'package:workkida/model/core/CategoryModel.dart';
import 'package:workkida/model/core/CategoryModel.dart';
import 'package:workkida/model/core/CategoryModel.dart';
import 'package:workkida/model/core/CategoryModel.dart';
import 'package:workkida/model/core/CategoryModel.dart';
import 'package:workkida/model/core/CategoryModel.dart';


//Controllers = "functions relating to Task"
Future<List<Category>> fetchCategory(http.Client client, int todoId) async {
  final response = await client.get('$UIData.URL_CATEGORY$todoId');
  if (response.statusCode == 200) {
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if (mapResponse["result"] == "ok") {
      final CategoryOBJ = mapResponse["data"].cast<Map<String, dynamic>>();
      return CategoryOBJ.map<Category>((json){
        return Category.fromJson(json);
      }).toList();
    } else {
      return [];
    }
  } else {
    throw Exception('Failed to load Task');
  }
}
//Fetch Task by Id
Future<Category> fetchTaskById(http.Client client, int id) async {
  final String url = '$UIData.URL_CATEGORY/$id';
  final response = await client.get(url);
  if (response.statusCode == 200) {
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if (mapResponse["result"] == "ok") {
      Map<String, dynamic> mapTask = mapResponse["data"];
      return Category.fromJson(mapTask);
    } else {
      return Category();
    }
  } else {
    throw Exception('Failed to get detail task with Id = {id}');
  }
}
//Update a task
Future<Category> updateATask(http.Client client,  Map<String, dynamic> params) async {
  final response = await client.put('$UIData.URL_CATEGORY/${params["id"]}', body: params);
  if (response.statusCode == 200) {
    final responseBody = await json.decode(response.body);
    return Category.fromJson(responseBody);
  } else {
    throw Exception('Failed to update a Task. Error: ${response.toString()}');
  }
}
//Delete a Task
Future<Category> deleteATask(http.Client client, int id) async {
  final String url = '$UIData.URL_CATEGORY/$id';
  final response = await client.delete(url);
  if (response.statusCode == 200) {final responseBody = await json.decode(response.body);
  return Category.fromJson(responseBody);

  } else {
    throw Exception('Failed to delete a Task');
  }
}