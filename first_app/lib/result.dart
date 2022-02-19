import "package:flutter/material.dart";

class Result extends StatelessWidget {
  // const Result({Key? key, this.resultsList}) : super(key: key);

  final int resultScore;
  final VoidCallback getBack;

  Result(this.resultScore, this.getBack);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 9) {
      resultText = "Bof";
    } else if (resultScore <= 13) {
      resultText = "Nah Bad";
    } else if (resultScore <= 17) {
      resultText = "Interesting";
    } else {
      resultText = "Maybe next time";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text("Score: " + resultScore.toString(),
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        Text(
          resultPhrase,
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
           onPressed: getBack,
           child: const Text("Get Back!"),
        )
      ]),
    );
  }
}
