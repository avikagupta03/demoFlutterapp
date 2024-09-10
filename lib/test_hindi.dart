import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class DepressionTestQuestionnaireHindi extends StatefulWidget {
  @override
  _DepressionTestQuestionnaireHindiState createState() =>
      _DepressionTestQuestionnaireHindiState();
}

class _DepressionTestQuestionnaireHindiState
    extends State<DepressionTestQuestionnaireHindi> {
  final List<String> questions = [
    '1. चीजों में थोड़ी रुचि या खुशी महसूस होना',
    '2. उदास, निराश, या हताश महसूस करना',
    '3. सोने में कठिनाई होना या बहुत अधिक सोना',
    '4. थकान महसूस करना या ऊर्जा की कमी',
    '5. खराब भूख या अत्यधिक खाना',
    '6. अपने आप को बुरा महसूस करना या यह महसूस करना कि आप असफल हैं या आपने अपने आप या अपने परिवार को निराश किया है',
    '7. चीजों पर ध्यान केंद्रित करने में कठिनाई, जैसे कि अखबार पढ़ना या टेलीविजन देखना',
    '8. इतनी धीरे बोलना या चलना कि अन्य लोग नोटिस कर सकते हैं। या इसके विपरीत, इतनी बेचैनी या अस्थिरता महसूस करना कि आप सामान्य से अधिक घूम रहे हैं',
    '9. यह सोचना कि आप मरना बेहतर होगा, या खुद को चोट पहुँचाने के विचार'
  ];

  List<int> answers = List.filled(9, 0);
  PageController _pageController = PageController();
  int _currentPage = 0;

  int calculateScore() {
    return answers.reduce((a, b) => a + b);
  }

  String getResult() {
    int score = calculateScore();
    if (score <= 4) return 'न्यूनतम या कोई अवसाद नहीं';
    if (score <= 9) return 'हल्का अवसाद';
    if (score <= 14) return 'मध्यम अवसाद';
    if (score <= 19) return 'मध्यम से गंभीर अवसाद';
    return 'गंभीर अवसाद';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'अवसाद परीक्षण',
          style: TextStyle(
            fontFamily: 'Mangal', // Apply Mangal font
          ),
        ),
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
                                    fontFamily: 'Mangal', // Apply Mangal font
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
                                            fontFamily: 'Mangal', // Apply Mangal font
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
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
                            Text('पीछे'),
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
                            Text('अगला'),
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
                                title: Text('परीक्षण परिणाम'),
                                content: Text('आपका अवसाद स्तर: $result'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).popUntil(
                                              (route) => route.settings.name == '/chat_hindi');
                                    },
                                    child: Text('ठीक है'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Text('परीक्षण सबमिट करें'),
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
        return 'बिलकुल नहीं';
      case 1:
        return 'कुछ दिनों के लिए';
      case 2:
        return 'आधे से ज्यादा दिन';
      case 3:
        return 'लगभग हर दिन';
      default:
        return '';
    }
  }
}
