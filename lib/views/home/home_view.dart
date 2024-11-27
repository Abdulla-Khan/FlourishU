import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home/home_controller.dart';
import '../../utils/constants/colors.dart';
import '../components/common/custom_button.dart';
import '../components/home/nearby_eatry_card.dart';
import '../components/home/nearby_eatry_options.dart';
import '../components/home/other_diet_plans.dart';
import '../components/home/search_header.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: context.height * 0.02,
        backgroundColor: bgColor,
        surfaceTintColor: bgColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchHeader(),
              SizedBox(height: context.height * 0.03),
              const Text(
                'Your Diet Plans',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'No plan yet. Start customizing your diet',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: context.height * 0.03),
              const ItemsCard(
                image: "assets/healthy-diet.png",
                text: "   Healthy Diet",
              ),
              SizedBox(height: context.height * 0.01),
              CustomButton(
                text: 'Customize Your Plan',
                showIcon: true,
                onTap: () => Get.toNamed('/customDiet'),
              ),
              Divider(
                thickness: 1,
                height: context.height * 0.05,
                color: Colors.black.withOpacity(0.2),
              ),
              const Text(
                'Other Diet Plans',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              OtherDietPlansList(controller: controller),
              Divider(
                thickness: 1,
                height: context.height * 0.05,
                color: Colors.black.withOpacity(0.2),
              ),
              const Text(
                'Nearby Eateries',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              NearbyEatryOptions(controller: controller),
              const NeabyEatriesCard()
            ],
          ),
        ),
      ),
    );
  }
}

class ItemsCard extends StatelessWidget {
  const ItemsCard({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.height * 0.01),
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
      height: context.height * 0.08,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 20,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: context.width * 0.15,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
