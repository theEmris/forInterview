import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_app/model/catModel.dart';
import 'package:interview_app/model/hiveModel.dart';
import 'package:interview_app/service/catService.dart';

import '../core/hiveConst.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool? isSeen;
  @override
  Widget build(BuildContext context) {
  int son = Random().nextInt(5);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: FutureBuilder(
            future: CatService.getCats(),
            builder: (context, AsyncSnapshot<List<CatsModel>> snap) {
              if (!snap.hasData) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (snap.hasError) {
                return Center(
                  child: Text("Error: ${snap.error}"),
                );
              } else {
                var data = snap.data!;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Fact: ${data[son].text}"),
                      subtitle: Column(
                        children: [
                          SizedBox(
                            height: 250,
                            child:Image(image: NetworkImage("https://cataas.com/cat/$son"))
                          ),
                          Text(DateFormat.jm().format(data[son].createdAt as DateTime) ,
                      ),
                      ],
                      ),
                      onTap: () async {
                        await SaveToHive(fact: data[son].text).then((value) {
                          debugPrint("ma'lumot saqlandi");
                        });
                      },
                    );
                  },
                  itemCount: 1,
                );
              }
            },
          ),
        ),
        ElevatedButton(
            child: Text("another fact"),
            onPressed: () {
              setState(() {});
            }),
      ],
    ));
  }

  Future SaveToHive({String? fact}) async {
    
      final cat = MyModel()
        ..text = fact
        ..createdAt = DateTime.now().toString();

      final box = Boxes.getCats();
      box.add(cat);
    
  }
}
