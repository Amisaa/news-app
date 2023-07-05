
import 'package:flutter/material.dart';
import 'package:news_app/network/network_request.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News App"),),

      body: FutureBuilder<List<dynamic>>(

        future: NetworkRequest.fetchNewData(),

        builder: (context,snapshot){

          if(snapshot.hasData){

            final newsArticle = snapshot.data??[];

            return ListView.separated(
                itemBuilder: (context,index){
                  final news = newsArticle[index];
                  return Column(
                    children:[
                      Text(news['title'] ?? '',style: const TextStyle(fontSize:16)),
                    ]
                  );

                },

                separatorBuilder: (context, index){
                  return Divider();
                },

                itemCount: newsArticle.length
            );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
