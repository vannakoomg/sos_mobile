import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Text("ហេតុអ្វីបានជាទាវស្រលាញ់នេនទុំ"),
              const Spacer(),
              const Text("២០"),
              Container(
                margin:
                    const EdgeInsets.only(bottom: 8, top: 8, left: 8, right: 8),
                height: 15,
                width: 0.6,
                color: Colors.black,
              ),
              const Text("៤០"),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          CachedNetworkImage(
            imageUrl:
                "https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2022/08/Math_anxiety_GettyImages621738804_Thumb-732x549.jpg",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            height: 264,
            width: MediaQuery.of(context).size.height,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
