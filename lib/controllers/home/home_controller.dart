import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<RxMap<String, dynamic>> nearbyEatriesList = [
    {"value": "Dining Halls", "isSelected": true}.obs,
    {"value": "Franchises", "isSelected": false}.obs,
  ].obs;
  List<Map<String, String>> otherDietPlans = [
    {
      "title": "Mediterranean Diet",
      "image": "assets/home/mediterranean.png",
      "description":
          """This diet is based on the traditional eating habits of countries bordering the Mediterranean Sea. It emphasizes whole foods, including fruits, vegetables, whole grains, nuts, olive oil, and lean proteins like fish. It is widely recommended for heart health and longevity due to its focus on healthy fats and plant-based foods.""",
    },
    {
      "title": "Keto (Ketogenic) Diet",
      "image": "assets/home/keto.png",
      "description":
          """The keto diet focuses on high fat, moderate protein, and very low carbohydrate intake to push the body into ketosis, where fat is burned for energy. It’s popular for weight loss and managing certain medical conditions, though it requires strict adherence to macronutrient ratios.""",
    },
    {
      "title": "Paleo Diet",
      "image": "assets/home/paleo.png",
      "description":
          """The Paleo diet encourages eating foods that would have been available to our prehistoric ancestors, such as lean meats, fish, fruits, vegetables, nuts, and seeds. It excludes processed foods, grains, dairy, and legumes, aiming to improve health by focusing on whole, natural foods""",
    },
    {
      "title": "Healthy Overall Diet",
      "image": "assets/home/health.png",
      "description":
          """Promotes a balance of macronutrients (proteins, fats, carbohydrates) and focuses on minimizing processed foods, added sugars, and excessive sodium. It’s recommended for maintaining long-term health, weight management, and reducing the risk of chronic diseases like heart disease, diabetes, and hypertension""",
    },
  ];
}
