import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app/provider/getdata.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  File _image;
  List<File> photolist= [];

  Future<File> CameraImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image as File;
      photolist.add(_image);
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(title: Text('Testing'),centerTitle: true,),
        floatingActionButton: FloatingActionButton(
          onPressed: CameraImage,
          child: Icon(Icons.add_a_photo),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          height: (height*4)/5,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
          child: _image == null ? Center(child: Text("No image picked")) : GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ), itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProviderData(
                  file: photolist[index],
                )));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Image.file(photolist[index],fit: BoxFit.cover,),
              ),
            );
          },
            itemCount: photolist.length,),
        )
    );
  }
}




