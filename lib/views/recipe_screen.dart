import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_meal_app/utils/utils.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(20),
                //   bottomRight: Radius.circular(20)
                // ),
                image: DecorationImage(
                    image: NetworkImage(
                      'https://www.whiskaffair.com/wp-content/uploads/2017/09/DSC2952.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "American chop suey",
                      style: textStyle(
                        30,
                        Colors.black,
                        FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Chip(
                          side: BorderSide.none,
                          // avatar:const CircleAvatar(
                          //   backgroundImage: AssetImage(
                          //     "assets/images/meal-img.jpg",
                          //   ),
                          // ),
                          backgroundColor: Colors.green.withOpacity(0.2),
                          label: Center(
                            child: Text(
                              "Dinner",
                              style:
                                  textStyle(16, Colors.black, FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Chip(
                          side: BorderSide.none,
                          // avatar:const CircleAvatar(
                          //   backgroundImage: AssetImage(
                          //     "assets/images/meal-img.jpg",
                          //   ),
                          // ),
                          backgroundColor: Colors.green.withOpacity(0.2),
                          label: Center(
                            child: Text(
                              "American",
                              style:
                                  textStyle(16, Colors.black, FontWeight.bold),
                            ),
                          ),
                        ),
                        const Spacer(),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.youtube,
                            color: Colors.white,
                          ),
                          label: Text(
                            "YouTube",
                            style: textStyle(16, Colors.white),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Ingrediants",
                      style: textStyle(22, Colors.black, FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const Image(
                                width: 95,
                                height: 95,
                                image: NetworkImage(
                                    'https://www.greendna.in/cdn/shop/products/Pasta-Macaroni_1024x.jpg?v=1627320315'),
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Macaroni",
                                style: textStyle(
                                    20, Colors.black, FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "1/2 kg",
                                style:
                                    textStyle(18, Colors.grey, FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Steps:",
                      style: textStyle(22, Colors.black, FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "You can add veggies of your choice.",
                      style: textStyle(18, Colors.grey, FontWeight.w500),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
