import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_apis/Logic/NewsLogic.dart';
import 'package:news_apis/Page/HomePage.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(newsApis());
}
class newsApis extends StatefulWidget {
  const newsApis({Key? key}) : super(key: key);

  @override
  State<newsApis> createState() => _newsApisState();
}

class _newsApisState extends State<newsApis> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> NewsLogic()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
