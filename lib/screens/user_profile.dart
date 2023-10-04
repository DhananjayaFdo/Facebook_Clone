// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clone/utils/app_colors.dart';
import 'package:facebook_clone/utils/app_dimentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/custome_grey_devider.dart';
import '../widgets/post_card.dart';
import '../widgets/small_text.dart';

class UserProfile extends StatefulWidget {
  Map? user;
  UserProfile({super.key, required this.user});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //custom app bar
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: Row(
                          children: [
                            CustomSmallText(
                              text: widget.user!['username'],
                              textColor: Colors.black,
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              const Divider(height: 0),

              //cover Photo with Profile Picture
              Stack(
                children: [
                  SizedBox(
                    height: AppDimentions.height110 * 2.2,
                  ),
                  Container(
                    width: double.infinity,
                    height: AppDimentions.height110 * 1.9,
                    color: Colors.grey.withOpacity(0.6),
                    // child: const Image(
                    //   image: NetworkImage(
                    //       "https://i.pinimg.com/564x/3a/52/53/3a5253383662950316094b145a45d103.jpg"),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: widget.user!['prof image url'],
                            imageBuilder: ((context, imageProvider) =>
                                CircleAvatar(
                                  backgroundImage: imageProvider,
                                  radius: AppDimentions.height30 * 3,
                                )),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 18,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.6),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.camera_alt_rounded,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    right: 18,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt_rounded,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //name and about section
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimentions.height20,
                  vertical: AppDimentions.height10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomSmallText(
                          text: widget.user!['username'],
                          textColor: Colors.black,
                          fontBold: true,
                          fontSize: 20,
                        ),
                        const SizedBox(width: 5),
                        CustomSmallText(
                          text: "( galmal )",
                          textColor: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(height: AppDimentions.height05),
                    CustomSmallText(
                      text: "H A K U N A  M A T A T A",
                      textColor: Colors.black,
                    ),
                    CustomSmallText(
                      text: "21+ | LK | 02.08",
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),

              //buttons
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    editProfileButton(
                      function: () {},
                      backColor: mainColor,
                      text: "Add to story",
                      icon: Icons.add,
                      fontColor: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    editProfileButton(
                      function: () {},
                      backColor: grey,
                      text: "Edit profile",
                      icon: Icons.edit,
                      fontColor: Colors.black,
                    ),
                    const SizedBox(width: 10),

                    //
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.menu),
                      ),
                    ),
                  ],
                ),
              ),

              //divider
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(),
              ),

              //
              maxbutton(
                text: "Edit Public Details",
                backColor: mainColor,
                fontColor: mainColor,
                opacity: 0.2,
              ),
              const Divider(),

              //Friends Section
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSmallText(
                          text: "Friends",
                          fontBold: true,
                          textColor: Colors.black,
                          fontSize: 18,
                        ),
                        CustomSmallText(
                          text: "5K friends",
                          textColor: Colors.black,
                        )
                      ],
                    ),
                    const Spacer(),
                    CustomSmallText(
                      text: "Find Friends",
                      textColor: mainColor,
                      fontBold: true,
                    ),
                  ],
                ),
              ),

              //gride view builder
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 2,
                    mainAxisExtent: 145,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              widget.user!['prof image url'],
                              height: 120,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: CustomSmallText(
                                text: widget.user!['username'],
                                textColor: Colors.black,
                                fontBold: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              maxbutton(
                text: "See All Friends",
                backColor: grey,
                fontColor: Colors.black,
                opacity: 1,
              ),

              const CustomGreyDivider(),

              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("post")
                      .where("uid", isEqualTo: widget.user!['uid'])
                      .snapshots(),
                  builder: (contect,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
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
            ],
          ),
        ),
      ),
    );
  }

  Padding maxbutton({
    required Color fontColor,
    required Color backColor,
    required String text,
    required double opacity,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backColor.withOpacity(opacity),
            borderRadius: BorderRadius.circular(5),
          ),
          child: CustomSmallText(
            text: text,
            textColor: fontColor,
            fontBold: true,
          ),
        ),
      ),
    );
  }

  Expanded editProfileButton({
    required Color backColor,
    required String text,
    required Color fontColor,
    required IconData icon,
    required Function()? function,
    bool hasIcon = true,
  }) {
    return Expanded(
      child: InkWell(
        onTap: function,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hasIcon ? Icon(icon, color: fontColor) : const SizedBox(),
              const SizedBox(width: 5),
              CustomSmallText(
                text: text,
                fontBold: true,
                textColor: fontColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
