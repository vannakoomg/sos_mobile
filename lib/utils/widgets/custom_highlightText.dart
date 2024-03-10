// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomHighlightText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextStyle highlightTextStyle;
  final String highlightText;
  final BuildContext context;
  const CustomHighlightText({
    super.key,
    required this.text,
    required this.highlightText,
    required this.textStyle,
    required this.context,
    required this.highlightTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: highlight(text, highlightText),
    );
  }

  TextSpan highlight(String text, String highlight) {
    List<TextSpan> spans = [];

    // Create a regular expression pattern for exact word match
    String pattern = RegExp.escape(highlight);
    RegExp regExp = RegExp(pattern, caseSensitive: false);

    // Find all matches of the word
    Iterable<Match> matches = regExp.allMatches(text);

    // Start index for substring
    int start = 0;

    // Iterate through matches
    for (Match match in matches) {
      if (match.start > start) {
        // Add normal text before the match
        spans.add(TextSpan(
          text: text.substring(start, match.start),
          style: const TextStyle(color: Colors.white),
        ));
      }
      // Add the highlighted text
      spans.add(
        TextSpan(
          text: text.substring(match.start, match.end),
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.blue),
          // children: [
          //   WidgetSpan(
          //     child: Container(
          //       margin: const EdgeInsets.only(left: 4, right: 4),
          //       decoration: BoxDecoration(
          //         color: Colors.pink,
          //         borderRadius: BorderRadius.circular(3),
          //       ),
          //       child: Text(text.substring(match.start, match.end),
          //           style: Theme.of(context).textTheme.bodyLarge),
          //     ),
          //   ),
          // ],
        ),
      );
      // Update start index
      start = match.end;
    }

    // Add remaining text after the last match
    if (start < text.length) {
      spans.add(TextSpan(
        text: text.substring(start),
        style: const TextStyle(color: Colors.white),
      ));
    }

    return TextSpan(children: spans);
  }
}
