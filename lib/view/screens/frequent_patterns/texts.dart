import 'package:flutter/material.dart';

Widget getSuggestion(double minSupport, double minConfidence) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Text(
          'Suggested Minimum Support(percent) :',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 18,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          minSupport.toStringAsFixed(0),
          style: const TextStyle(
            color: Color.fromARGB(255, 52, 94, 54),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'Suggested Minimum Confidence(percent) :',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          minConfidence.toStringAsFixed(0),
          style: const TextStyle(
            color: Color.fromARGB(255, 52, 94, 54),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    ],
  );
}

Widget getFormula(String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Text(
          'support count calculation :',
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: RichText(
          text: TextSpan(children: [
            const TextSpan(
              text:
                  '( number of rows * minimum support percentage / 100 ) =   ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ]),
        ),
      ),
    ],
  );
}

Widget getNamesMain() {
  return const Column(
    children: [
      Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'Please Enter High Values For Better Results :',
          style: TextStyle(
            color: Color.fromARGB(255, 22, 70, 55),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Max Columns :',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              '133',
              style: TextStyle(
                color: Color.fromARGB(255, 52, 94, 54),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Max Rows :',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              '4920',
              style: TextStyle(
                color: Color.fromARGB(255, 52, 94, 54),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget getText(int number) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: RichText(
      text: TextSpan(children: [
        const TextSpan(
          text: 'Frequent Patterns ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        TextSpan(
          text: number.toString(),
          style: const TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const TextSpan(
          text: ' ItemSets : ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ]),
    ),
  );
}

Widget getListView(List items) {
  return ListView.builder(
    itemBuilder: (context, index) {
      var thisItem = items[index];
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            thisItem.toString(),
            style: const TextStyle(
              color: Color.fromARGB(255, 85, 50, 50),
              fontSize: 18,
            ),
          ),
        ),
      );
    },
    itemCount: items.length,
  );
}

Widget getRules({
  required List rules,
  required String name,
}) {
  List result = [];
  for (var item in rules) {
    result += item;
  }
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemBuilder: (context, index) {
              var thisItem = result[index];
              var antecedent = thisItem["antecedent"];
              var consequent = thisItem["consequent"];
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  '$antecedent => $consequent',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 85, 50, 50),
                    fontSize: 16,
                  ),
                ),
              );
            },
            itemCount: result.length,
          ),
        )
      ],
    ),
  );
}

Widget supportListgene({
  required List supportList,
  required String name,
}) {
  List finalSupport = [];
  for (int i = 0; i < supportList.length; i++) {
    List temp = supportList[i];
    for (int j = 0; j < temp.length; j++) {
      //print(temp);
      var antecedent = temp[0]["antecedent"];
      var consequent = temp[0]["consequent"];
      var isUseful = temp[1];
      var supPercent = temp[2];
      //print('$antecedent , $consequent ,  $isUseful , $supPercent');
      var a = {
        'first': antecedent,
        'second': consequent,
        'third': isUseful,
        'fourth': supPercent
      };
      finalSupport.add(a);
    }
  }
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            name,
            style: const TextStyle(
              color: Color.fromARGB(255, 55, 6, 65),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemBuilder: (context, index) {
              var thisItem = finalSupport[index];
              var antecedent = thisItem["first"];
              var consequent = thisItem["second"];
              var useful = thisItem["third"];
              var percent = thisItem["fourth"];

              return Padding(
                padding: const EdgeInsets.all(2),
                child: Column(
                  children: [
                    Text(
                      '$antecedent => $consequent\n',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            " ${useful.toString()}",
                            style: TextStyle(
                              color: getColor(useful.toString()),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "${percent.toString()} %",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 20, 92, 151),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: finalSupport.length,
          ),
        )
      ],
    ),
  );
}

Color getColor(String name) {
  if (name == "Not Useful" || name == "Not Accurate") {
    return Colors.red;
  } else {
    return Colors.green;
  }
}
