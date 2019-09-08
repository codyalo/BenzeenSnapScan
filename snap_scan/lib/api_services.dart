import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:snap_scan/json_post.dart';
//import 'dart:io';

//String url = "http://api.benzeenautoparts.com/WebApi/ViewPartDetails";

var apiParams = {
  "AccessToken": "78516d0d287647af8ba8efd9f7ac35e1",
  "PartId": "420512"
};

var uri = Uri.http("api.benzeenautoparts.com", "/WebApi/ViewPartDetails", apiParams);

//Future<List<Post>> getAllPosts() async {
 // final response = await http.get(url);
//  print(response.body);
 // return allPostsFromJson(response.body);
//}

Future<Post> getPost() async{
  final response = await http.get(uri);
  return postFromJson(response.body);
}

/*Future<http.Response> createPost(Post post) async{
  //using full url with params just for testing.
  final response = await http.post('http://api.benzeenautoparts.com/WebApi/ViewPartDetails?AccessToken=78516d0d287647af8ba8efd9f7ac35e1&PartId=420512',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      //  HttpHeaders.authorizationHeader : '',
      //  'AccessToken': '78516d0d287647af8ba8efd9f7ac35e1',
      //  'PartId': '420512'
      },
      body: postToJson(post)
  );
  return response;
}*/