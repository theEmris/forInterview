import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:interview_app/core/hiveConst.dart';
import 'package:interview_app/model/hiveModel.dart';

class SavedModel extends StatefulWidget {
  const SavedModel({Key? key}) : super(key: key);

  @override
  State<SavedModel> createState() => _SavedModelState();
}

class _SavedModelState extends State<SavedModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box<MyModel>>(
        
        valueListenable:Boxes.getCats().listenable(),
        builder:(context, box, _) {
          final cat = box.values.toList().cast<MyModel>();
          return cat == null ? Center(child: Text("data yo'q")): buildContent(cat); 
        }
      ),
    );
  }
  Widget buildContent(List<MyModel> cats) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *1,
      child: ListView.builder(
        itemCount: cats.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text("${cats[index].text}"),
              subtitle: Text("${cats[index].createdAt}"),
            ),
          );
          
        },
        
      ),
    );
  }
}
