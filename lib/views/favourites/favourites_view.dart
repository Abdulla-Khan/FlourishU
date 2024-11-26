import 'package:flourish/views/history/history_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';

class FavouritesView extends GetView {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        surfaceTintColor: bgColor,
        elevation: 0,
        title: const Text(
          'Favourites',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
          ),
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.04,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: favouritesList.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    return FovouriteOptionsCard(
                      index: index,
                    );
                  },
                ),
              ),
              SizedBox(height: context.height * 0.04),
              Obx(() => favouritesList[0]['isSelected']
                  ? ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemBuilder: (context, index) => ItemCards(
                        title: 'Pizza',
                        date: 'The Silver line Diner',
                        rowText: "See Full Menu",
                        width: context.width * 0.3,
                      ),
                    )
                  : Container(
                      margin:
                          EdgeInsets.symmetric(vertical: context.height * 0.01),
                      width: context.width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 20,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: context.height * 0.01,
                                horizontal: context.width * 0.02),
                            width: context.width,
                            height: context.height * 0.16,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSimaNh0YeiTaW8CDy-dN8pqo0nl0Sr0orWnQ&s",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.topRight,
                            child: Container(
                              width: context.width * 0.09,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: textBtnColor,
                                  width: 2.0,
                                ),
                              ),
                              child: const CircleAvatar(
                                backgroundColor: textBtnColor,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: context.height * 0.02),
                            padding: EdgeInsets.symmetric(
                                horizontal: context.width * 0.02),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'The Silver Line Diner',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: textBtnColor,
                                      size: 18,
                                    ),
                                    Text(
                                      'Johnson Street,Vesu Surat, Guarat',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}

class FovouriteOptionsCard extends StatelessWidget {
  const FovouriteOptionsCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          for (var i in favouritesList) {
            i['isSelected'] = i['value'] == favouritesList[index]['value'];
          }
        },
        child: Obx(
          () => Container(
              width: context.width * 0.25,
              decoration: BoxDecoration(
                color:
                    favouritesList[index]['isSelected'] ? textBtnColor : null,
                borderRadius: BorderRadius.circular(25),
                border: favouritesList[index]['isSelected']
                    ? null
                    : Border.all(
                        width: 1,
                        color: Colors.black.withOpacity(0.2),
                      ),
              ),
              alignment: Alignment.center,
              child: Text(
                favouritesList[index]['value'],
                style: TextStyle(
                  color: !favouritesList[index]['isSelected']
                      ? Colors.black
                      : Colors.white,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              )),
        ));
  }
}

RxList<RxMap<String, dynamic>> favouritesList = [
  {"value": "Food", "isSelected": true}.obs,
  {"value": "Restaurants", "isSelected": false}.obs
].obs;
