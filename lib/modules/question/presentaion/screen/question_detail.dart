import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class QuestionDetail extends StatelessWidget {
 final int? id ;
  const QuestionDetail({super.key,this.id });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Hero(
          tag: 'image',
          child: CachedNetworkImage(
            imageUrl:
                'https://i.pinimg.com/736x/d5/cb/83/d5cb8311c9d8f7f076c0475726c4913f.jpg',
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.height,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        )
      ]),
    );
  }
}
