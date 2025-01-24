import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Services',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 7, 7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 150),
            HeaderSection(),
            SizedBox(height: 50),
            EdgeImagesSection(),
            SizedBox(height: 50),
            AboutUsSection(),
            SizedBox(height: 100),
            ServicesCardsSection(),
            SizedBox(height: 50),
            EmbeddedYouTubeVideo(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Find professional\nservices in your area',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Autospace is one of the most finest group of\ncollaborative services you wish for',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Roboto',
              color: Color.fromARGB(255, 255, 152, 0),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/google_play.png', height: 20),
              const SizedBox(width: 10),
              Image.asset('assets/app_store.png', height: 60),
            ],
          ),
        ],
      ),
    );
  }
}

class EdgeImagesSection extends StatelessWidget {
  const EdgeImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 200,
          width: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/left.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          height: 390,
          width: 360,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/right.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          padding: const EdgeInsets.all(100),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About us',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'We connect with reliable and skilled professionals\n'
                'offering on-demand services in your local area. \n'
                'Trusted expertise who get the job done quickly.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        Positioned(
          top: -250,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: 600,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(66, 251, 251, 251),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/2app.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ServicesCardsSection extends StatelessWidget {
  const ServicesCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'title': 'Nearby Parking Search',
        'description':
            'Users can check the availability of parking slots in nearby parking plots.',
      },
      {
        'title': 'Navigation to Parking Lot',
        'description':
            'The app provides navigation assistance to the selected parking lot using Google Maps.',
      },
      {
        'title': 'Pre-booking of Parking Slots',
        'description':
            'Users can pre-book a parking slot for a specific time and select the duration for which they need the parking.',
      },
      {
        'title': 'Slot Extension',
        'description':
            'Users can extend their parking time after pre-booking if needed.',
      },
      {
        'title': 'Real-time Parking Slot Availability',
        'description':
            'The app provides real-time information on the availability of parking slots in the parking plot.',
      },
      {
        'title': 'Notifications for Parking Time Expiration',
        'description':
            'Users receive notifications when their parking time is about to end, prompting them to extend if necessary.',
      },
      {
        'title': 'Monthly/Yearly Subscription Plans',
        'description':
            'Users can opt for a subscription plan (monthly or yearly) for continuous parking service.',
      },
      {
        'title': 'Automatic Entry/Exit',
        'description':
            'The app supports automatic entry and exit using license plate recognition for seamless gate operation without manual intervention.',
      },
    ];

    return CarouselSlider.builder(
      itemCount: (services.length / 4).ceil(),
      itemBuilder: (context, index, realIndex) {
        final startIndex = index * 4;
        final endIndex = (startIndex + 4).clamp(0, services.length);
        final currentServices = services.sublist(startIndex, endIndex);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: currentServices.length,
          itemBuilder: (context, index) {
            final service = currentServices[index];
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.orange, // Changed background color to orange
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          service['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          service['description']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    service['title']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      backgroundColor: Colors.black54,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        viewportFraction: 1.0,
      ),
    );
  }
}

class EmbeddedYouTubeVideo extends StatefulWidget {
  const EmbeddedYouTubeVideo({super.key});

  @override
  State<EmbeddedYouTubeVideo> createState() => _EmbeddedYouTubeVideoState();
}

class _EmbeddedYouTubeVideoState extends State<EmbeddedYouTubeVideo> {
  late YoutubePlayerController _controller;
  String selectedLanguage = 'English';

  final Map<String, String> videoIds = {
    'English': 'qaeHKoq_CLM',
    'Malayalam': 'rwrOBUwauT4',
  };

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: videoIds[selectedLanguage]!,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  void _changeVideo(String language) {
    setState(() {
      selectedLanguage = language;
      _controller.loadVideoById(videoId: videoIds[language]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Watch Our Video',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 251, 251),
          ),
        ),
        const SizedBox(height: 20),
        DropdownButton<String>(
          value: selectedLanguage,
          items: videoIds.keys.map((String language) {
            return DropdownMenuItem<String>(
              value: language,
              child: Text(
                language,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              _changeVideo(newValue);
            }
          },
          dropdownColor: Colors.white,
        ),
        const SizedBox(height: 20),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 600,
            child: YoutubePlayer(
              controller: _controller,
              aspectRatio: 16 / 9,
            ),
          ),
        ),
      ],
    );
  }
}
