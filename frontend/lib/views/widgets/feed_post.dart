import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hifarm/constants/routes.dart';
import 'package:hifarm/models/data/post_model.dart';

class FeedPost extends StatelessWidget {
  const FeedPost({
    super.key,
    required this.data,
  });

  final MPost data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Get.toNamed(postDetails, arguments: data.id),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                            child: Image.asset(
                                "assets/home_images/Rectangle 160.png"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(data.user.name),
                        ],
                      ),
                      const Icon(Icons.more_vert_rounded)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(data.description),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.width,
              child: PageView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Image.network(
                  data.pics[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}