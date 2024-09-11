import 'dart:io';

import 'package:first_project_1/data/post_json.dart';
import 'package:first_project_1/models/post_models.dart';
import 'package:first_project_1/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  Function function;
  AddPost(this.function);


  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  File? _selectFile;
  // addFromGallery() async{
  //   XFile? xfile =await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if(xfile != null){
  //     File(xfile.path);
  //     setState(() {
  //     });
  //   }
  // }
  // addFromCamera() async{
  //   XFile? xfile =await ImagePicker().pickImage(source: ImageSource.camera);
  //   if(xfile!=null){
  //     File(xfile.path);
  //     setState(() {
  //
  //     });
  //   }
  // }

  Future<void> addPostFromGallery() async {
    try {
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (xfile != null) {
        _selectFile = File(xfile.path);
        setState(() {});
      }
    } catch (e) {
      showMessege("Failed to pick image: $e", Colors.red.shade400);
    }
  }

  Future<void> addPostFromCamera() async {
    try {
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
      if (xfile != null) {
        _selectFile = File(xfile.path);
        setState(() {});
      }
    } catch (e) {
      showMessege("Failed to pick image: $e", Colors.red.shade400);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add post",
          style: TextStyle(
              fontSize: 25, color: primary, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          GestureDetector(
            onTap: () {
              showImagePictureOption();
              // addPost();
            },
            child: Container(
              margin: EdgeInsets.all(15),
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade500,
              ),
              child: Center(
                child: _selectFile == null
                    ? Icon(
                        Icons.add,
                        color: white,
                        size: 30,
                      )
                    : Image.file(
                        width: double.infinity,
                        _selectFile!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: .5,
                  offset: Offset(0, 1),
                  blurRadius: 15,
                ),
              ]),
              // child: TextField(
              //
              //   decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(15),
              //         borderSide: BorderSide.none,
              //       ),
              //       hintText: "Post Content",
              //       hintStyle: TextStyle(color: white),
              //       filled: true,
              //       fillColor: Colors.grey.shade500),
              // ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ElevatedButton(
              onPressed: () {
                if (_selectFile == null) {
                  showMessege("you have select image", Colors.red.shade400);
                } else {
                  PostModels postModels = PostModels(
                      name: "anas",
                      img:
                          "https://images.unsplash.com/photo-1504593811423-6dd665756598?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D",
                      file: _selectFile);
                  listPostModels.add(postModels);
                  showMessege("Post added successfully!", Colors.blue.shade400);
                  _selectFile=null;
                  setState(() {});

                }
              },
              child: Text(
                "Add Post",
                style: TextStyle(color: white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          )
        ],
      )),
    );
  }

  void showMessege(String content, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // padding: EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      duration: Duration(seconds: 3),
      // clipBehavior: Clip.,

      content: Text(
        content,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
      action: SnackBarAction(
          textColor: Colors.white,
          label: "ok",
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
          }),
    )).closed.then((value) =>!(_selectFile==null)? widget.function(0):null);
  }

  void showImagePictureOption() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          addPostFromCamera();
                          Navigator.pop(context);

                        },
                        child: Icon(
                          Icons.photo_camera,
                          size: 40,
                          color: primary,
                        )),
                    Text(
                      "camera",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          addPostFromGallery();

                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.photo,
                          size: 40,
                          color: primary,
                        )),
                    Text(
                      "Gallery",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
