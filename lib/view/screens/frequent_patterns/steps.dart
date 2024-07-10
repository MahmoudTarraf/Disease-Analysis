import 'package:flutter/material.dart';

Widget fpFirstStep() {
  return const Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "1- Prepare Transactional DB:",
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            "We create a Transactional DB by replacing the value in record (i) with the Column Name if the value is equal to 1 and null if the value is 0.\nby doing so, you get a DB where every record has a unique Column Names to a specific length.\n\nFor EX:\n [ T (i) ] => [ itching,cold,fever... ].",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget fpSecondStep() {
  return const Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "2- Implement Apriori For F-P Growth:",
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            'The result is frequent itemsets.\nFor an item (A), A is frequent if sup-count (A) >= min-sup-count.\nEach Level(n) has two steps : \nJOIN() AND PRUNE() where join (For Level 3 and above) is to join two itemsets that are equal in all items but the last one, result of join function are itemsets has the length of the level we are on, While the Prune function eleminates the itemsets that aren\'t frequent (under the min-sup-count threshold ).',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget fpRulesStep() {
  return const Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "3- Generate Association Rules:",
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            'Rules are subsets from the resulting frequent K itemsets, For one rule:\nAn item could lead to two or more items, and two or more items can lead to one item.',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget fpSupportStep() {
  return const Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "4- Calculate Support For Rules:",
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            "A rules is considered Useful if the min-sup-percentage is above or equal to a min-sup-threshold.\nFor Ex min-sup-th = 60 %:\nRandom rule sup-per is 70 % then we say this rule is Useful.\n To calculate the Support of a rule:\n Support([A]=>[B,C]) = Support([A,B,C]) / (T), Where t is the number of transactions in our dataset.",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget fpConfidenceStep() {
  return const Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "5- Calculate Confidence For Rules :",
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            "A rules is considered Accurate if the min-confidence-percentage is above or equal to a min-conf-threshold.\nFor Ex min-conf-th = 60 %:\nRandom rule conf-per is 70 % then we say this rule is Accurate.\n To calculate the Confidence of a rule:\n Confidence([A]=>[B,C]) = Support([A,B,C]) / Support([A]), Where Support([A,B,C]) is the number of occurencies of this itemset in the dataset.",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget fpStrongStep() {
  return const Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "6- Strong ItemsSets:",
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            "A Rule is considered Strong if it is both Useful and Accurate, Based on the min-conf-perc and min-sup-perc of a rule.",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget fpFinish() {
  return const Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "# Search is Done when we can't generate more itemsets and The result for a level (n) is :\n Frequent n Itemsets.",
          style: TextStyle(
            color: Color.fromARGB(255, 35, 116, 38),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}
