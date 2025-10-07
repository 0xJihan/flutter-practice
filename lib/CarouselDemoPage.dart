import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselDemoPage extends StatefulWidget {
  const CarouselDemoPage({super.key});

  @override
  State<CarouselDemoPage> createState() => _CarouselDemoPageState();
}

class _CarouselDemoPageState extends State<CarouselDemoPage> {
  int _currentIndex = 0;
  final List<String> imgList = [
    'https://picsum.photos/800/400?img=1',
    'https://picsum.photos/800/400?img=2',
    'https://picsum.photos/800/400?img=3',
    'https://picsum.photos/800/400?img=4',
    'https://picsum.photos/800/400?img=5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Carousel Examples')),
      body: SingleChildScrollView(
        child: Column(
          children: [


            _sectionTitle('1. Basic Carousel'),
            CarouselSlider(
              items: imgList
                  .map((url) => ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(url, fit: BoxFit.cover, width: 1000),
              ))
                  .toList(),
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                autoPlay: false,
              ),
            ),


            _sectionTitle('2. Auto-Play Carousel'),
            CarouselSlider(
              items: imgList
                  .map((url) => Image.network(url, fit: BoxFit.cover, width: 1000))
                  .toList(),
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
              ),
            ),


            _sectionTitle('3. Carousel with Dots Indicator'),
            Column(
              children: [
                CarouselSlider(
                  items: imgList
                      .map((url) => ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child:
                    Image.network(url, fit: BoxFit.cover, width: 1000),
                  ))
                      .toList(),
                  options: CarouselOptions(
                    height: 200,
                    onPageChanged: (index, reason) {
                      setState(() => _currentIndex = index);
                    },
                    enlargeCenterPage: true,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => {},
                      child: Container(
                        width: 10,
                        height: 10,
                        margin:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == entry.key
                              ? Colors.blueAccent
                              : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),


            _sectionTitle('4. Fade Carousel'),
            CarouselSlider(
              items: imgList
                  .map((url) => ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(url, fit: BoxFit.cover, width: 1000),
              ))
                  .toList(),
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlayAnimationDuration: const Duration(seconds: 2),
                scrollPhysics: const NeverScrollableScrollPhysics(),
              ),
            ),


            _sectionTitle('5. Partial View Carousel'),
            CarouselSlider(
              items: imgList
                  .map((url) => ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(url, fit: BoxFit.cover, width: 1000),
              ))
                  .toList(),
              options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                viewportFraction: 0.7,
                autoPlay: true,
              ),
            ),


            _sectionTitle('6. Vertical Carousel'),
            CarouselSlider(
              items: imgList
                  .map((url) => ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(url, fit: BoxFit.cover, width: 1000),
              ))
                  .toList(),
              options: CarouselOptions(
                height: 200,
                scrollDirection: Axis.vertical,
                autoPlay: true,
              ),
            ),


            _sectionTitle('7. Carousel with Text Overlay'),
            CarouselSlider(
              items: imgList.map((url) {
                final index = imgList.indexOf(url) + 1;
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(url, fit: BoxFit.cover, width: 1000),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Image $index',
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
              options: CarouselOptions(
                height: 220,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
