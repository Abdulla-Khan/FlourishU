import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';

RxList<RxMap<String, dynamic>> schoolsList = [
  {"name": "HPU", "isSelected": true}.obs,
  {"name": "UMD", "isSelected": false}.obs,
  {"name": "UNCC", "isSelected": false}.obs,
].obs;
RxList<RxMap<String, dynamic>> genderList = [
  {"gender": "Female", "isSelected": false}.obs,
  {"gender": "Male", "isSelected": false}.obs,
].obs;
List<DropdownMenuItem<String>> get studentItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "Freshman", child: Text("Freshman")),
    const DropdownMenuItem(value: "Sophomore", child: Text("Sophomore")),
    const DropdownMenuItem(value: "Junior", child: Text("Junior")),
    const DropdownMenuItem(value: "Senior", child: Text("Senior")),
    const DropdownMenuItem(value: "Maintenance", child: Text("Maintenance")),
  ];
  return menuItems;
}

RxList<RxMap<String, dynamic>> preferences1 = [
  {"value": "Franchise Locations", "isSelected": false}.obs,
  {"value": "University Restaurants", "isSelected": false}.obs,
  {"value": "University cafeteria", "isSelected": false}.obs,
].obs;

RxList<RxMap<String, dynamic>> preferences2 = [
  {"value": "Lose Weight", "isSelected": false}.obs,
  {"value": "Gain Weight", "isSelected": false}.obs,
  {"value": "Maintain Weight", "isSelected": false}.obs,
].obs;
RxList<RxMap<String, dynamic>> preferences3 = [
  {"value": "To Save Money", "isSelected": false}.obs,
  {"value": "To Donate Meals", "isSelected": false}.obs,
  {"value": "To follow a balanced meal plan", "isSelected": false}.obs,
].obs;

RxList<RxMap<String, dynamic>> preferences4 = [
  {"value": "Yes", "isSelected": false}.obs,
  {"value": "No", "isSelected": false}.obs,
].obs;

RxList<RxMap<String, dynamic>> allergyItems = [
  {"value": "Nuts", "isSelected": false}.obs,
  {"value": "Eggs", "isSelected": false}.obs,
  {"value": "Dairy", "isSelected": false}.obs,
  {"value": "Shellfish", "isSelected": false}.obs,
  {"value": "Wheat", "isSelected": false}.obs,
  {"value": "Soybeans", "isSelected": false}.obs,
].obs;

RxList<RxMap<String, dynamic>> preferences5 = [
  {"value": "Never (0 times a week)", "isSelected": true}.obs,
  {"value": "Sometimes (1-2 times a week)", "isSelected": false}.obs,
  {"value": "Regularly (3-4 times a week)", "isSelected": false}.obs,
  {"value": "Often (5-6 times a week)", "isSelected": false}.obs,
  {"value": "Daily (> 7 times a week)", "isSelected": false}.obs,
].obs;

RxList<RxMap<String, dynamic>> exerciseItems = [
  {"value": "Weight Lifting", "isSelected": false}.obs,
  {"value": "Cardio", "isSelected": false}.obs,
  {"value": "Group Classes", "isSelected": false}.obs,
].obs;
