import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:flutter/material.dart';

class RegexConverter {
  TextSpan parsing(String input) {
    List<String> words = input.split(' ');
    TextSpan result = TextSpan(children: []);

    for (var word in words) {
        if (word.isEmpty) continue;

        if (word[0] != '/') {
          result.children!.add(choiceText(word));
          continue;
        }

        if (word.startsWith('/i') && word.endsWith('/i')) {
          String cleanedWord = word.substring(2, word.length - 2);
          result.children!.add(choiceImage(cleanedWord));
          continue;
        }

        if (word.startsWith('/b') && word.endsWith('/b')) {
          String cleanedWord = word.substring(2, word.length - 2);
          result.children!.add(choiceBoldText(cleanedWord, false));
          continue;
        }

        if (word.startsWith('/br') && word.endsWith('/br')) {
          String cleanedWord = word.substring(3, word.length - 3);
          result.children!.add(choiceBoldText(cleanedWord, true));
          continue;
        }
      }
    return result;
  }
}

WidgetSpan choiceText(String input) {
  return WidgetSpan(
    child: Text(
      ' $input',
      style: const TextStyle(
        color: Colors.black,
      ),
    ),
  );
}

WidgetSpan choiceBoldText(String input, bool isRed) {
  Color color = isRed ? Colors.redAccent : Colors.black;
  return WidgetSpan(
    child: Text(
      ' $input',
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

WidgetSpan choiceImage(String input) {
  return WidgetSpan(
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 16,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: '${BaseUrl.Get()}/ImageProvider/$input',
          width: 25,
          height: 25,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    ),
  );
}
