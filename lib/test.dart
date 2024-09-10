import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class DepressionTestQuestionnaire extends StatefulWidget {
  @override
  _DepressionTestQuestionnaireState createState() =>
      _DepressionTestQuestionnaireState();
}

class _DepressionTestQuestionnaireState
    extends State<DepressionTestQuestionnaire> {
  final List<String> questions = [
    '1. Little interest or pleasure in doing things',
    '2. Feeling down, depressed, or hopeless',
    '3. Trouble falling or staying asleep, or sleeping too much',
    '4. Feeling tired or having little energy',
    '5. Poor appetite or overeating',
    '6. Feeling bad about yourself or that you are a failure or have let yourself or your family down',
    '7. Trouble concentrating on things, such as reading the newspaper or watching television',
    '8. Moving or speaking so slowly that other people could have noticed. Or the opposite being so fidgety or restless that you have been moving around a lot more than usual',
    '9. Thoughts that you would be better off dead, or of hurting yourself'
  ];

  List<int> answers = List.filled(9, 0);
  PageController _pageController = PageController();
  int _currentPage = 0;

  int calculateScore() {
    return answers.reduce((a, b) => a + b);
  }

  String getResult() {
    int score = calculateScore();
    if (score <= 4) return 'Minimal or no depression';
    if (score <= 9) return 'Mild depression';
    if (score <= 14) return 'Moderate depression';
    if (score <= 19) return 'Moderately severe depression';
    return 'Severe depression';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Depression Test'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            // Gradient Background
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade100, Colors.purple.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(2, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  questions[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Column(
                                  children: [
                                    for (int optionIndex = 0;
                                    optionIndex < 4;
                                    optionIndex++)
                                      ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: Radio<int>(
                                          value: optionIndex,
                                          groupValue: answers[index],
                                          onChanged: (int? value) {
                                            setState(() {
                                              answers[index] = value!;
                                            });
                                          },
                                        ),
                                        title: Text(
                                          _optionText(optionIndex),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ).asGlass(
                          tintColor: Colors.black.withOpacity(0.3),
                          blurX: 12.0,
                          blurY: 12.0,
                          clipBorderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    );
                  },
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_currentPage > 0)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade400,
                          // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                          ),
                        ),
                        onPressed: () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back),
                            SizedBox(width: 5),
                            Text('Back'),
                          ],
                        ),
                      ),
                    if (_currentPage < questions.length - 1)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Row(
                          children: [
                            Text('Next'),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    if (_currentPage == questions.length - 1)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          String result = getResult();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Test Result'),
                                content: Text('Your Depression Level: $result'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).popUntil((route) =>
                                      route.settings.name == '/chat');
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Text('Submit Test'),
                            SizedBox(width: 5),
                            Icon(Icons.check),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _optionText(int index) {
    switch (index) {
      case 0:
        return 'Not at all';
      case 1:
        return 'Several days';
      case 2:
        return 'More than half the days';
      case 3:
        return 'Nearly every day';
      default:
        return '';
    }
  }
}
