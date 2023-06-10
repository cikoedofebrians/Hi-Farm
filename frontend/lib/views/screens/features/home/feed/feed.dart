import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hifarm/constants/appcolor.dart';
import 'package:hifarm/constants/image_string.dart';
import 'package:hifarm/controllers/feed_controller.dart';
import 'package:hifarm/views/widgets/custom_loading_indicator.dart';
import 'package:hifarm/views/widgets/feed_post.dart';
import 'package:hifarm/views/widgets/scrollable_rounded_page.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    final FeedController feedController = Get.find();
    if (feedController.isLoading) {
      feedController.fetchPostData();
    }
    return Obx(
      () => feedController.isLoading
          ? const CustomLoadingIndicator()
          : ScrollableRoundedPage(
              topContent: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(height: 56, child: Image.asset(homeImage1)),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Halo, Rahel!',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.white, fontSize: 14),
                            ),
                            Text(
                              'Bagaimana keadaan peternakanmu?',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    style: Theme.of(context).textTheme.labelMedium!,
                    decoration: InputDecoration(
                      hintText: 'Ada yang bisa kami bantu?',
                      hintStyle: const TextStyle(
                          color: Colors.grey, overflow: TextOverflow.ellipsis),
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.only(right: 12),
                        icon: const Icon(
                          Icons.search,
                          color: AppColor.secondary,
                        ),
                        onPressed: () {},
                      ),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ],
              ),
              body: Container(
                color: Colors.white,
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 100),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      FeedPost(data: feedController.list[index]),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: feedController.list.length,
                ),
              ),
              height: 0.19,
            ),
    );
  }
}
