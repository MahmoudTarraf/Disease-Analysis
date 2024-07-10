import 'package:disease_analysis/controller/knn_controller/knn_controller.dart';
import 'package:flutter/material.dart';

Widget getFirstStep() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          '1- Get Dataset And Normalize:',
          style: TextStyle(
            color: Colors.pink,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'This Dataset is Sure to have values of either 1 or 0, While The last Column being The Expected Disease Class Column.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'The value 1 indicates That a Person or an Object has a Specific illness/symptom While 0 indicates That a certain Person or Object has not.\nFor example itching : 1 This Means That This Person has itching.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'This Dataset needs no Normalization Process(Min Max Normalization) Since it is already Satisfied, The values are either 1 or 0 so The Proces (x1= x1-m / n-m) should outcome to either 1 or 0 always.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'This Dataset has NO Null Values, And A Null-Check Function Already checks whether or not null values are detected and automatically replace Those Null Values with either 1 or 0.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

Widget getSecondStep() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          '2- Calculate K:',
          style: TextStyle(
            color: Colors.pink,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'K is Either given from user, or it is calculated as it is the square root of the number of training itemsets in the Dataset, in our dataset we have 4920 so k=70.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

Widget getThirdStep() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          '3- Calculate Euclidean Distance:',
          style: TextStyle(
            color: Colors.pink,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'For a new Data like: {"itching":1,"coughing":0,...} we should calculate the Euclidean Distance between the new data and the affected rows and columns from the Dataset, Euclidean Distance is the square root of sum (Xi-Yi)**2.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

Widget getForthStep() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          '4- Calculate Rank based on Euclidean Distance:',
          style: TextStyle(
            color: Colors.pink,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Based on the Euclidean Distance from step 3, we order the distances in ascending order to a length of K.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

Widget getFifthStep() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          '5 Class Voting:',
          style: TextStyle(
            color: Colors.pink,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Based on Rank in step 4, we count how many classes get repeated in a length of K, The result is the most repeated class by Vote.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

Widget getDisease() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Predicted Disease :',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                getknnResultMap["predicted_disease"].toString(),
                style: const TextStyle(
                  color: Color.fromARGB(255, 40, 122, 43),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: 50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Predicted Class Count :',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              getknnResultMap["predicted_count"].toString(),
              style: const TextStyle(
                color: Color.fromARGB(255, 40, 122, 43),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget getDatasetMsg() {
  return const Column(
    children: [
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'This Dataset is Sure to have values of either 1 or 0, While The last Column being The Expected Disease Class Column.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'The value 1 indicates That a Person or an Object has a Specific illness/symptom While 0 indicates That a certain Person or Object has not.\nFor example itching : 1 This Means That This Person has itching.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'This Dataset needs no Normalization Process(Min Max Normalization) Since it is already Satisfied, The values are either 1 or 0 so The Proces (x1= x1-m / n-m) should outcome to either 1 or 0 always.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'This Dataset has NO Null Values, And A Null-Check Function Already checks whether or not null values are detected and automatically replace Those Null Values with either 1 or 0.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
