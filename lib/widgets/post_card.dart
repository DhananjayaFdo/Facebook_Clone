import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../screens/user_profile.dart';
import '../utils/app_dimentions.dart';
import 'custome_grey_devider.dart';
import 'like_icon.dart';

class PostCard extends StatefulWidget {
  final snap;
  const PostCard({super.key, required this.snap});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              //Profile Picture
              //widget.snap['profilePicture'].toString()
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => UserProfile(
                          user: widget.snap,
                        )),
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.snap['profilePicture'].toString(),
                  imageBuilder: ((context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                        radius: AppDimentions.height25,
                      )),
                ),
              ),

              //username and publish date
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Text(
                          widget.snap['username'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text("time"),
                          Icon(
                            Icons.circle,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //details
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu),
              ),

              //post hide
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.cancel_outlined,
                ),
              )
            ],
          ),
        ),

        //decriotion
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Text(widget.snap['descrition'].toString()),
        ),

        SizedBox(
          height: 500,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: widget.snap['post utl'].toString(),
            fit: BoxFit.cover,
          ),
        ),

        //Reaction Section
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Reaction section
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                height: 40,
                width: 100,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    SvgPicture.asset("assets/Icons/like.svg", width: 20),
                    Positioned(
                      left: 13,
                      child:
                          SvgPicture.asset("assets/Icons/laugh.svg", width: 28),
                    ),
                    Positioned(
                      left: 34,
                      child: SvgPicture.asset("assets/Icons/heartLike.svg",
                          width: 20),
                    ),
                  ],
                ),
              ),
            ),
            const Text("12 Commnets"),
            const SizedBox(width: 10),
            const Text("13 shares"),
            const SizedBox(width: 10),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSection(
                function: () {},
                icon: "assets/Icons/like_outline.svg",
                label: "Like",
              ),
              CustomSection(
                function: () {},
                icon: "assets/Icons/comment.svg",
                label: "comment",
              ),
              CustomSection(
                function: () {},
                icon: "assets/Icons/share.svg",
                label: "share",
              ),
            ],
          ),
        ),
        const CustomGreyDivider(),
      ],
    );
  }
}
