import 'package:flutter/material.dart';
import 'package:pokemon_app/detail_page.dart';
import 'package:pokemon_app/services.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? pokemon;
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    if (mounted) {
      getData();
    }
  }

  getData() async {
    pokemon = await RemoteService().getPokemonData();
    if (pokemon != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Visibility(
      visible: isLoaded,
      replacement: const Center(child: CircularProgressIndicator()),
      child: Stack(children: [
        Positioned(
          right: -100,
          top: -50,
          child: Image.asset(
            'assets/pokeball.png',
            height: 300,
            fit: BoxFit.fitHeight,
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
        const Positioned(
          top: 70,
          left: 20,
          child: Text(
            "Pokedex",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          top: 150,
          bottom: 0,
          width: width,
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                    ),
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: pokemon?.length,
                    itemBuilder: (context, index) {
                      var type = pokemon![index]['type'][0];
                      var color = type == "Grass"
                          ? Colors.greenAccent
                          : type == "Fire"
                              ? Colors.redAccent
                              : type == "Water"
                                  ? Colors.blue
                                  : type == 'Poison'
                                      ? Colors.deepPurpleAccent
                                      : type == 'Electric'
                                          ? Colors.amber
                                          : type == "Rock"
                                              ? Colors.grey
                                              : type == "Ground"
                                                  ? Colors.brown
                                                  : type == "Psychic"
                                                      ? Colors.indigo
                                                      : type == "Fighting"
                                                          ? Colors.orange
                                                          : type == "Bug"
                                                              ? Colors
                                                                  .lightGreenAccent
                                                              : type == 'Ghost'
                                                                  ? Colors
                                                                      .deepPurple
                                                                  : type ==
                                                                          "Normal"
                                                                      ? Colors
                                                                          .grey
                                                                      : Colors
                                                                          .pink;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => DetailPage(
                                        color: color,
                                        type: type,
                                        pokemon: pokemon![index],
                                        heroTag: index,
                                      ))),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: -40,
                                    bottom: -40,

                                    // bottom: -10,
                                    child: Image.asset(
                                      'assets/pokeball.png',
                                      height: 150,
                                      fit: BoxFit.fitHeight,
                                      color: Colors.white54,
                                    ),
                                  ),
                                  Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Hero(
                                        tag: index,
                                        child: CachedNetworkImage(
                                          imageUrl: pokemon![index]['img'],
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      )),
                                  Positioned(
                                      top: 30,
                                      left: 10,
                                      child: Text(
                                        pokemon![index]['name'],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      )),
                                  Positioned(
                                      top: 60,
                                      left: 10,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 10.0,
                                            right: 10,
                                            top: 5,
                                            bottom: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                            color:
                                                Colors.black.withOpacity(0.2)),
                                        child: Text(
                                          type,
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
                                      )),
                                ],
                              )),
                        ),
                      );
                    }),
              )
            ],
          ),
        )
      ]),
    ));
  }
}
