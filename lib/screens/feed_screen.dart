import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:facebook_clone/screens/user_profile.dart';
import 'package:facebook_clone/utils/app_dimentions.dart';
import 'package:facebook_clone/utils/image_pick.dart';
import 'package:facebook_clone/utils/snakbar.dart';
import 'package:facebook_clone/widgets/post_create_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../widgets/custome_grey_devider.dart';
import '../widgets/pagetop_status_card.dart';
import '../widgets/post_card.dart';

class FeedScreen extends StatefulWidget {
  final snapshot;
  const FeedScreen({super.key, required this.snapshot});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late StreamSubscription subscription;

  var isOnline = false;
  bool showError = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkConectivity();
  }

  checkConectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isOnline = await InternetConnectionChecker().hasConnection;
      if (!isOnline && showError == false) {
        showCustomDialog();
        setState(() => showError = true);
      }
    });
  }

  createNewPost() async {
    var _selectedImage = await ImagePick().selectImage(ImageSource.gallery);

    if (_selectedImage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CustomPostCreateCard(
                  passImage: _selectedImage,
                  map: widget.snapshot,
                )),
      );
    } else {
      snackBarMessenger(context: context, content: "Image Select Canseld");
    }
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppDimentions.height10,
            horizontal: AppDimentions.height15,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Profile Picture
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfile(
                      user: widget.snapshot,
                    ),
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.snapshot['prof image url'],
                  imageBuilder: ((context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                        radius: AppDimentions.height25,
                      )),
                ),
              ),

              //Text Post Add Button
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimentions.height10,
                      vertical: AppDimentions.height05,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: AppDimentions.height30,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimentions.height20),
                        child: const Text("What's on your mind?"),
                      ),
                    ),
                  ),
                ),
              ),

              //Post add Button
              InkWell(
                onTap: createNewPost,
                child: SvgPicture.asset("assets/Icons/gallery.svg"),
              )
            ],
          ),
        ),

        //Status Show Section
        const CustomGreyDivider(),

        // CustomMiniStatusCart(),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return CustomMiniStatusCart(
                index: index,
              );
            },
          ),
        ),

        const CustomGreyDivider(),

        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('post')
                .orderBy("uploadTime", descending: true)
                .snapshots(),
            builder: (contect,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox(
                  height: 400,
                  width: 200,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return PostCard(
                    snap: snapshot.data!.docs[index].data(),
                  );
                },
              );
            })
        //Post Show
      ],
    );
  }

  showCustomDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("Network Error"),
        content: const Text("Connect to internet"),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.pop(context, 'canel');
              setState(() => showError = false);
              isOnline = await InternetConnectionChecker().hasConnection;
              if (!isOnline) {
                showCustomDialog();
                setState(() => showError = true);
              }
            },
            child: const Text("ok"),
          )
        ],
      ),
    );
  }
}
