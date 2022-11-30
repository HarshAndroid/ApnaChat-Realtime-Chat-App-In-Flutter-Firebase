import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../api/apis.dart';
import '../main.dart';
import '../models/chat_user.dart';

//profile screen -- to show signed in user info
class ProfileScreen extends StatefulWidget {
  final ChatUser user;

  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //app bar
        appBar: AppBar(title: const Text('Profile Screen')),

        //floating button to add new user
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton.extended(
              backgroundColor: Colors.redAccent,
              onPressed: () async {
                await APIs.auth.signOut();
                await GoogleSignIn().signOut();
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout')),
        ),

        //body
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: mq.width * .05),
          child: Column(
            children: [
              // for adding some space
              SizedBox(width: mq.width, height: mq.height * .03),

              //user profile picture
              ClipRRect(
                borderRadius: BorderRadius.circular(mq.height * .1),
                child: CachedNetworkImage(
                  width: mq.height * .2,
                  height: mq.height * .2,
                  fit: BoxFit.fill,
                  imageUrl: widget.user.image,
                  errorWidget: (context, url, error) =>
                      const CircleAvatar(child: Icon(CupertinoIcons.person)),
                ),
              ),

              // for adding some space
              SizedBox(height: mq.height * .03),

              // user email label
              Text(widget.user.email,
                  style: const TextStyle(color: Colors.black54, fontSize: 16)),

              // for adding some space
              SizedBox(height: mq.height * .05),

              // name input field
              TextFormField(
                initialValue: widget.user.name,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person, color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'eg. Happy Singh',
                    label: const Text('Name')),
              ),

              // for adding some space
              SizedBox(height: mq.height * .02),

              // about input field
              TextFormField(
                initialValue: widget.user.about,
                decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.info_outline, color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'eg. Feeling Happy',
                    label: const Text('About')),
              ),

              // for adding some space
              SizedBox(height: mq.height * .05),

              // update profile button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    minimumSize: Size(mq.width * .5, mq.height * .06)),
                onPressed: () {},
                icon: const Icon(Icons.edit, size: 28),
                label: const Text('UPDATE', style: TextStyle(fontSize: 16)),
              )
            ],
          ),
        ));
  }
}
