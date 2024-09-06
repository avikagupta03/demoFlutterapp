import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<String> messages = [
    "I am Healo, your personal AI coach for emotional well-being. ✨✨\n\nThis is a safe and confidential space for anything you want to share, and I will try to help you in every way I can to nurture your emotional health.",
    "Hi there!",
    "How are you?",
    "I'm good, thanks!",
    "What about you?",
    "I'm great, thank you!",
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
        backgroundColor: Color(0xFF6A1B9A),
        iconTheme: IconThemeData(color: Colors.white),
        title: SizedBox.shrink(),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
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
      backgroundColor: Color(0xFF4A148C),
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
                color: Color(0xFFAB47BC),
                child: Text(
                  "Hi! Healo is here to help ✨",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment:Alignment.centerLeft,
              child: Image.network(
                "https://img.freepik.com/free-vector/cute-dog-doctor-with-stethoscope-cartoon-vector-icon-illustration-animal-healthcare-icon-isolated_138676-5182.jpg?t=st=1725527580~exp=1725531180~hmac=eece240973a1788f488a3311bfa8507e389847ec9698bda5c672f18d985ce698&w=740",
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: index % 2 == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Color(0xFFE1BEE7)
                            : Color(0xFF8E24AA),
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
                        hintText: "Enter your message",
                        hintStyle: TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: Color(0xFF7E57C2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF8E24AA),
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
