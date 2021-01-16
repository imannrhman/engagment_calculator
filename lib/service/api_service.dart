import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:engagment_calculator/config/constants.dart';
import 'package:engagment_calculator/model/instagram_profile.dart';
import 'package:engagment_calculator/model/search_result.dart';
import 'package:http/http.dart';

class ApiService {
  static String _baseUrl = Constants.baseUrl;

  static Future<InstagramProfile> getInstagramProfileByUsername({String username})async{
    InstagramProfile instagramProfile;
    Response response = await get("$_baseUrl/$username/?__a=1");

    if(response.statusCode == 200){
      instagramProfile = instagramProfileFromJson(response.body);
      return instagramProfile;
    }else if(response.statusCode == 404){
      throw "Username Not Found";
    }else{
      throw "Failed Get Data";
    }
  }

  static Future<SearchResult> getListUserBySearch({String query})async{
    SearchResult searchResult;
    Response response = await get("$_baseUrl/web/search/topsearch/?query=$query");
    if(response.statusCode == 200){
      searchResult = searchResultFromJson(response.body);
      if(searchResult.users.isNotEmpty){
        return searchResult;
      }else{
        throw SearchResultError(message: "User Not Found");
      }
    }else if(response.statusCode == 404){
      throw "Username Not Found";
    }else{
      throw "Failed Get Data";
    }
  }


}