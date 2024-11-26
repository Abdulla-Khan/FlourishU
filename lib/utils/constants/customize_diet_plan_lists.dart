import 'package:get/get.dart';

RxList<RxMap<String, dynamic>> dietplan1 = [
  {"value": "19: 12/7magic", "isSelected": false}.obs,
  {"value": "14 :7/7 special swipes", "isSelected": false}.obs,
  {"value": "7 Meals per week", "isSelected": false}.obs,
  {"value": "30 Meals for a semester", "isSelected": false}.obs,
].obs;

RxList<RxMap<String, dynamic>> dietplan2 = [
  {"value": "BreakFast", "isSelected": false}.obs,
  {"value": "Lunch", "isSelected": false}.obs,
  {"value": "Dinner", "isSelected": false}.obs,
].obs;

RxList<RxMap<String, dynamic>> weekDays = [
  {"value": "Monday", "isSelected": true}.obs,
  {"value": "Tuesday", "isSelected": false}.obs,
  {"value": "Wednesday", "isSelected": false}.obs,
  {"value": "Thursday", "isSelected": false}.obs,
  {"value": "Friday", "isSelected": false}.obs,
  {"value": "Saturday", "isSelected": false}.obs,
  {"value": "Sunday", "isSelected": false}.obs,
].obs;

RxList<RxMap<String, dynamic>> foodOption = [
  {"value": "Breakfast", "isSelected": false}.obs,
  {"value": "Lunch", "isSelected": false}.obs,
  {"value": "Dinner", "isSelected": false}.obs,
  {"value": "Snack", "isSelected": false}.obs,
].obs;
