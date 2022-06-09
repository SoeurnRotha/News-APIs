import 'package:flutter/material.dart';
import 'package:news_apis/Logic/NewsLogic.dart';
import 'package:provider/provider.dart';
class InternetError extends StatefulWidget {
  const InternetError({Key? key}) : super(key: key);

  @override
  State<InternetError> createState() => _InternetErrorState();
}

class _InternetErrorState extends State<InternetError> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text("Error"),
          ElevatedButton(
            child: Text("Try again"),
            onPressed: (){
              context.read<NewsLogic>().setLoadding();
              context.read<NewsLogic>().read();
            },
          )
        ],
      ),
    );
  }
}
