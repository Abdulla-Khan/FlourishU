import 'package:flourish/views/auth/email_verify/email_verify_view.dart';
import 'package:flourish/views/auth/forgot_password/forgot_password_confirmation.dart';
import 'package:flourish/views/auth/forgot_password/forgot_password_view.dart';
import 'package:flourish/views/auth/login/login_view.dart';
import 'package:flourish/views/auth/onboarding/personal_detail_form.dart';
import 'package:flourish/views/auth/onboarding/prefernces_form.dart';
import 'package:flourish/views/auth/onboarding/school_detail_form.dart';
import 'package:flourish/views/auth/reset_password/reset_password_view.dart';
import 'package:flourish/views/auth/sign_up/sign_up_view.dart';
import 'package:flourish/views/customize_diet_plans/customize_diet_plans_view.dart';
import 'package:flourish/views/customize_diet_plans/food_diary_view.dart';
import 'package:flourish/views/customize_diet_plans/meal_plan_view.dart';
import 'package:flourish/views/favourites/favourites_view.dart';
import 'package:flourish/views/home/home_view.dart';
import 'package:flourish/views/profile/change_password_view.dart';
import 'package:flourish/views/profile/edit_profile_view.dart';
import 'package:flourish/views/settings/pages/about_us.dart';
import 'package:flourish/views/settings/pages/customer_service_view.dart';
import 'package:flourish/views/settings/pages/privacy_policy_view.dart';
import 'package:flourish/views/settings/pages/terms_conditions_view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: '/',
    page: () => const LoginView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/signUp',
    page: () => const SignUpView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/verifyEmail',
    page: () => const EmailVerifyView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/personalInfo',
    page: () => const PersonalDetailForm(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/schoolInfo',
    page: () => const SchoolDetailForm(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/forgotPassword',
    page: () => const ForgotPasswordView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/forgotPasswordConfirm',
    page: () => const ForgotPasswordConfirmation(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/preferences',
    page: () => const PreferncesFormView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/resetPassword',
    page: () => const ResetPasswordView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/home',
    page: () => const HomeView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/customDiet',
    page: () => const CustomizeDietPlansView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/foodDiary',
    page: () => const FoodDiaryView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/mealPlan',
    page: () => const MealPlanView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/editProfile',
    page: () => const EditProfileView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/changePassword',
    page: () => const ChangePasswordView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/favourites',
    page: () => const FavouritesView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/about-us',
    page: () => const AboutUsView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/customer-support',
    page: () => const CustomerServiceView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/privacy-policy',
    page: () => const PrivacyPolicyView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/terms&conditions',
    page: () => const TermsAndConditionsView(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
];
