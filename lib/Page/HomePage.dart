import 'package:flutter/material.dart';
import 'package:news_apis/Error/InternetError.dart';
import 'package:news_apis/Loadding/Loadding.dart';
import 'package:news_apis/Logic/NewsLogic.dart';
import 'package:news_apis/Model/NewsModel.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsLogic>().setLoadding();
    context.read<NewsLogic>().read();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text("The News time (APIs)"),
      ),
      body: _buildBody,
    );
  }
  get _buildBody{
    Loadding loadding = context.watch<NewsLogic>().loadding;
    switch(loadding){
      case Loadding.none:
      case Loadding.loadding:
        return _loadding;
      case Loadding.error:
        return InternetError();
      case Loadding.done:
        return _buildList;

    }
  }
  get _loadding{
    return Center(child: CircularProgressIndicator());
  }
  get _buildList{
    NewsModel newsModel = context.watch<NewsLogic>().newsModel;
    return ListView.builder(
      itemCount: newsModel.articles.length,
      itemBuilder: (context,index){
        return _buildItems(newsModel.articles[index]);
      },
    );
  }
  _buildItems(Article items){
    return Card(
        elevation: 10,
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(items.urlToImage),
                  fit: BoxFit.cover
                )
              ),
            ),
            Column(
              children: [
                Text(items.author,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(items.title),
                SizedBox(height: 20,),
                Text(items.description),
                SizedBox(height: 10,),
                Text(items.content),
                Text(items.source.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ],
            ),

          ],
        )
    );
  }
}
