import 'package:f/Hindi_menu.dart';
import 'package:flutter/material.dart';
import 'menu.dart'; // Import the MenuDrawer

class ChatHindi extends StatefulWidget {
  const ChatHindi({super.key});

  @override
  State<ChatHindi> createState() => _ChatHindiState();
}

class _ChatHindiState extends State<ChatHindi> {
  final List<String> messages = [
    "मैं हीलो हूँ, आपकी भावनात्मक भलाई के लिए आपका व्यक्तिगत एआई कोच। ✨✨\n\nयह आपकी किसी भी बात को साझा करने के लिए एक सुरक्षित और गोपनीय स्थान है, और मैं आपकी भावनात्मक सेहत को पोषित करने के लिए हर संभव प्रयास करूंगा।",
    "नमस्ते!",
    "आप कैसे हैं?",
    "मैं अच्छा हूँ, धन्यवाद!",
    "और आप?",
    "मैं भी बढ़िया हूँ, धन्यवाद!",
  ];

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add(_messageController.text);
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A148C), // Dark Purple
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'चैट',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'MANGAL', // Use Mangal font
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              // Action for calendar icon
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Action for share icon
            },
          ),
        ],
      ),
      drawer: MenuDrawerHindi(),
      backgroundColor: Color(0xFF1A003B), // Darker Purple
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipPath(
              clipper: CloudyClipper(),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                color: Color(0xFF6A1B9A), // Dark Purple
                child: Text(
                  "नमस्ते! हीलो यहाँ मदद के लिए है ✨",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Mangal', // Use Mangal font
                    color: Colors.white,
                    letterSpacing: 1.5,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Color(0xFFAB47BC) // Lighter Purple
                            : Color(0xFF4A148C), // Dark Purple
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(index % 2 == 0 ? 15 : 0),
                          bottomRight: Radius.circular(index % 2 == 0 ? 0 : 15),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Text(
                        messages[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Mangal', // Use Mangal font
                          color: index % 2 == 0 ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: "अपना संदेश दर्ज करें",
                        hintStyle: TextStyle(color: Colors.white54, fontFamily: 'Mangal'), // Use Mangal font
                        filled: true,
                        fillColor: Color(0xFFAB47BC), // Lighter Purple
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      ),
                      style: TextStyle(color: Colors.black, fontFamily: 'Mangal'), // Use Mangal font
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF4A148C), // Dark Purple
                    ),
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Clipper for Cloudy Effect
class CloudyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 10);

    path.quadraticBezierTo(size.width * 0.2, size.height - 15, size.width * 0.4, size.height - 16);
    path.quadraticBezierTo(size.width * 0.6, size.height - 25, size.width * 0.8, size.height - 15);
    path.quadraticBezierTo(size.width * 0.6, size.height - 10, size.width, size.height - 15);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
