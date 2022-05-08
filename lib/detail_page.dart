import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Color color;
  final String type;
  Map? pokemon;
  var heroTag;

  DetailPage(
      {Key? key,
      required this.color,
      required this.type,
      this.pokemon,
      this.heroTag})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(alignment: Alignment.center, children: [
        Positioned(
          right: -50,
          top: 100,
          child: Image.asset(
            'assets/pokeball.png',
            height: 300,
            fit: BoxFit.fitHeight,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        Positioned(
          top: 75,
          left: 20,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: 20,
          child: Text(
            widget.pokemon!['name'],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        Positioned(
          top: 200,
          left: 20,
          child: Container(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.black.withOpacity(0.2)),
            child: Text(
              widget.type,
              // style:
              // TextStyle(color: Colors.white),
              style: const TextStyle(shadows: [
                BoxShadow(
                    color: Colors.blueGrey,
                    offset: Offset(0, 0),
                    spreadRadius: 1.0,
                    blurRadius: 15)
              ], color: Colors.white),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 8, bottom: 8, right: 8),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Text(
                              'Name',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemon!['name'],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 8, bottom: 8, right: 8),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Text(
                              'Height',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemon!['height'],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 8, bottom: 8, right: 8),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Text(
                              'Weight',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemon!['weight'],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 8, bottom: 8, right: 8),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Text(
                              'Type',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemon!['type'].join(', '),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 8, bottom: 8, right: 8),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Text(
                              'Weaknesses',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemon!['weaknesses'].join(", "),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 8, bottom: 8, right: 8),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Text(
                              'Pre Evolution',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                              child: widget.pokemon!['prev_evolution'] != null
                                  ? SizedBox(
                                      height: 20,
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: widget
                                            .pokemon!['prev_evolution'].length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              widget.pokemon!['prev_evolution']
                                                  [index]['name'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : const Text(
                                      "Just Hatched",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 8, bottom: 8, right: 8),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Text(
                              'Next Evolution',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                              child: widget.pokemon!['next_evolution'] != null
                                  ? SizedBox(
                                      height: 20,
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: widget
                                            .pokemon!['next_evolution'].length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              widget.pokemon!['next_evolution']
                                                  [index]['name'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : const Text(
                                      "Maxed Out",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
            )),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            child: Hero(
              tag: widget.heroTag,
              child: CachedNetworkImage(
                imageUrl: widget.pokemon!['img'],
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ))
      ]),
    );
  }
}
