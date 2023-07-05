
import 'package:dio/dio.dart';

class  NetworkRequest{


  static Future<List<dynamic>> fetchNewData() async {

    final apiKey ='0869afd9132d40eb99aec76013723a09';

    final url = "https://newsapi.org/v2/everything?q=tesla&from=2023-06-04&sortBy=publishedAt&apiKey=$apiKey";

    final dio =Dio();

    final  response  =  await  dio.get(url);

    if(response.statusCode == 200 ||response.statusCode == 201 ){

      final jsonData = response.data;

      final articles = jsonData["articles"];
      return articles;
    }
    else
      {
        return[];
        //handle error
      }
  }
}