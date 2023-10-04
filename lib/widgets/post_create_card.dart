// ignore_for_file: must_be_immutable

import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/utils/app_colors.dart';
import 'package:facebook_clone/utils/snakbar.dart';
import 'package:flutter/material.dart';
import '../utils/app_dimentions.dart';
import 'custom_postcreat_cart.btn.dart';
import 'pos_upload_to_firebase.dart';
import 'post_create_page_bottom_tab_bar.dart';
import 'small_text.dart';

class CustomPostCreateCard extends StatefulWidget {
  Uint8List? passImage;
  Map? map;
  CustomPostCreateCard({
    super.key,
    required this.passImage,
    required this.map,
  });

  @override
  State<CustomPostCreateCard> createState() => _CustomPostCreateCardState();
}

class _CustomPostCreateCardState extends State<CustomPostCreateCard> {
  final _descriptionController = TextEditingController();

  bool isLoading = false;

  postUploadToFirebase() async {
    setState(() {
      isLoading = true;
    });

    await Upload()
        .postUpload(widget.map, _descriptionController.text, widget.passImage);

    setState(() {
      isLoading = false;
    });

    snackBarMessenger(context: context, content: "post upload completed");

    Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //App Bar
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: CustomSmallText(
            text: "Create Post",
            fontBold: true,
            textColor: Colors.black,
            fontSize: 20,
          ),
          actions: [
            TextButton(
              onPressed: postUploadToFirebase,
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: mainColor,
                    )
                  : const Text("NEXT"),
            )
          ],
        ),

        //body
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    //Profile Picture
                    CachedNetworkImage(
                      imageUrl: widget.map!['prof image url'],
                      imageBuilder: ((context, imageProvider) => CircleAvatar(
                            backgroundImage: imageProvider,
                            radius: AppDimentions.height25,
                          )),
                    ),

                    //username section
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                              child: Text(
                                widget.map!['username'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomPostCartButton(
                                  function: () {},
                                  icon: "assets/Icons/global.svg",
                                  text: "Public",
                                ),
                                const SizedBox(width: 5),
                                CustomPostCartButton(
                                  function: () {},
                                  icon: "assets/Icons/album.svg",
                                  text: "Album",
                                ),
                                const SizedBox(width: 5),
                                CustomPostCartButton(
                                  function: () {},
                                  icon: "assets/Icons/instagram.svg",
                                  text: "Off",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //sescription section
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: _descriptionController,
                  maxLines: null,
                  decoration: const InputDecoration(
                      hintText: "Say somthing about this post..........",
                      border: InputBorder.none),
                ),
              ),

              //image section
              SizedBox(
                width: double.infinity,
                child: Image(
                  fit: BoxFit.cover,
                  image: MemoryImage(widget.passImage!),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              PostCreatePageBottom(
                function: () {},
                image: "assets/Icons/galler_2.svg",
              ),
              PostCreatePageBottom(
                function: () {},
                image: "assets/Icons/addperson.svg",
              ),
              PostCreatePageBottom(
                function: () {},
                image: "assets/Icons/feeling_faces.svg",
              ),
              PostCreatePageBottom(
                function: () {},
                image: "assets/Icons/location.svg",
              ),
              PostCreatePageBottom(
                function: () {},
                image: "assets/Icons/dottedmenu.svg",
              ),
            ],
          ),
        ));
  }
}
