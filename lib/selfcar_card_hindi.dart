import 'package:flutter/material.dart';
import 'dart:math';
import 'package:glass/glass.dart'; // Import the glass package

class SelfCareCardsPageHindi extends StatefulWidget {
  @override
  _SelfCareCardsPageHindiState createState() => _SelfCareCardsPageHindiState();
}

class _SelfCareCardsPageHindiState extends State<SelfCareCardsPageHindi> {
  final List<Map<String, dynamic>> selfCareActivities = [
    {"activity": "5 मिनट के लिए गहरी साँस लें", "icon": Icons.air, "image": 'https://example.com/deep_breathing.jpg'},
    {"activity": "दो सूर्य नमस्कार करें", "icon": Icons.self_improvement, "image": 'https://example.com/surya_namaskaar.jpg'},
    {"activity": "एक पेड़ लगाएं", "icon": Icons.park, "image": 'https://example.com/plant_tree.jpg'},
    {"activity": "पौधों को पानी दें", "icon": Icons.local_florist, "image": 'https://example.com/water_plants.jpg'},
    {"activity": "एक मित्र से बात करें", "icon": Icons.chat, "image": 'https://example.com/talk_to_friend.jpg'},
    {"activity": "एक जानवर को खाना खिलाएं", "icon": Icons.pets, "image": 'https://example.com/feed_animal.jpg'},
    {"activity": "30 मिनट के लिए पार्क जाएं", "icon": Icons.directions_walk, "image": 'https://example.com/park.jpg'},
    {"activity": "10 मिनट के लिए धूप सेंकें", "icon": Icons.wb_sunny, "image": 'https://example.com/sun_bath.jpg'},
    {"activity": "अपना बिस्तर लगाएं", "icon": Icons.bed, "image": 'https://example.com/make_bed.jpg'},
    {"activity": "एक कमरा साफ करें", "icon": Icons.cleaning_services, "image": 'https://example.com/clean_room.jpg'},
  ];

  List<Map<String, dynamic>> availableActivities = [];
  Map<String, dynamic>? currentActivity;

  @override
  void initState() {
    super.initState();
    availableActivities = List.from(selfCareActivities);
    _getNewActivity();
  }

  void _getNewActivity() {
    if (availableActivities.isNotEmpty) {
      final random = Random();
      final index = random.nextInt(availableActivities.length);
      setState(() {
        currentActivity = availableActivities[index];
        availableActivities.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('सेल्फ-केयर कार्ड चुनें'),
        centerTitle: true,
        backgroundColor: Color(0xFF4A148C), // Deep purple color for AppBar
      ),
      backgroundColor: Color(0xFF311B92), // Darker shade of purple for background
      body: Center(
        child: currentActivity == null
            ? const CircularProgressIndicator(color: Colors.purpleAccent)
            : GestureDetector(
          onTap: _getNewActivity,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.all(16.0),
            child: SelfCareCardHindi(
              activity: currentActivity!["activity"],
              icon: currentActivity!["icon"],
              image: currentActivity!["image"],
            ),
          ),
        ),
      ),
    );
  }
}

class SelfCareCardHindi extends StatelessWidget {
  final String activity;
  final IconData icon;
  final String image;

  const SelfCareCardHindi({Key? key, required this.activity, required this.icon, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            blurRadius: 12,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 50,
                color: Colors.purpleAccent,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "स्व-देखभाल गतिविधि",
              style: TextStyle(
                fontFamily: 'Cursive',
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              activity,
              style: const TextStyle(
                fontFamily: 'Sans',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              "पुनः चार्ज और पुनः ऊर्जावान होने के लिए एक क्षण लें।",
              style: TextStyle(
                fontSize: 16,
                color: Colors.purpleAccent,
              ),
            ),
          ],
        ),
      ),
    ).asGlass(
      tintColor: Color(0xFF311B92).withOpacity(0.2), // Slightly transparent dark purple for glossy effect
      blurX: 10.0,
      blurY: 10.0,
      clipBorderRadius: BorderRadius.circular(20),
    );
  }
}
