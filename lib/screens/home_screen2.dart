
import 'package:facebook_ui_clone/data/colors.dart';
import 'package:facebook_ui_clone/data/constant.dart';
import 'package:facebook_ui_clone/data/posts.dart';
import 'package:facebook_ui_clone/data/stories_json.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: AppIcons.facebook,
        backgroundColor: AppColors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.backgroundColor),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
                ),
                Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.backgroundColor),
                    child:
                        IconButton(onPressed: () {}, icon: AppIcons.message)),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textField(),
            _tapBar(),
            const SizedBox(height: 10),
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    children: [
                      _storyAdder(),
                      const SizedBox(width: 5),
                      _storyList(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            _postsList(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _textField() {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.2)),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(stories[0]["img"]),
                  radius: 18,
                ),
                const SizedBox(width: 5),
                const Text(
                  "What's on your mind?",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _tapBar() {
    return Container(
      height: 30,
      width: double.infinity,
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Row(
              children: const [
                AppIcons.stories,
                SizedBox(width: 5),
                Text("Live", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Center(
            child: Row(
              children: const [
                AppIcons.images,
                SizedBox(width: 5),
                Text("Photo", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Center(
            child: Row(
              children: const [
                AppIcons.room,
                SizedBox(width: 5),
                Text("Room", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _storyAdder() {
    return Container(
      height: 150,
      width: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.5)),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(stories[0]["img"]),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: const [
                  Text("Create", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Story", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            right: 30,
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.buttonFollowColor),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _storyList() {
    return Row(
      children: List.generate(stories.length, (index) {
        return Container(
          margin: const EdgeInsets.only(right: 5),
          height: 150,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(stories[index]["story"]),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 5,
                left: 2,
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.buttonFollowColor,
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(stories[index]["img"]),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 2,
                child: Text(
                    stories[index]["first_name"] +
                        " " +
                        stories[index]["last_name"],
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ],
          ),
        );
      }),
    );
  }

  // ignore: unused_element
  Widget _postsList() {
    return Column(
      children: List.generate(posts.length, (index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 450,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(posts[index]["profileImg"]),
                        radius: 18,
                      ),
                      title: Text(posts[index]["name"]),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: AppIcons.dots)
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  posts[index]["caption"],
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 280,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(posts[index]["postImg"]),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      posts[index]["likes"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      posts[index]["commentCount"] +
                          " Comments  " +
                          posts[index]["shares"] +
                          " Shares",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Row(
                        children: const [
                          AppIcons.like,
                          SizedBox(width: 5),
                          Text(
                            "Like",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Row(
                        children: const [
                          AppIcons.comment,
                          SizedBox(width: 5),
                          Text(
                            "Comment",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Row(
                        children: const [
                          AppIcons.share,
                          SizedBox(width: 5),
                          Text(
                            "Share",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
