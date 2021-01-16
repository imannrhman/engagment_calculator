
import 'package:engagment_calculator/model/instagram_profile.dart';
import 'package:engagment_calculator/model/search_result.dart';
import 'package:engagment_calculator/service/api_service.dart';

class Repository{

  Future<InstagramProfile> fetchInstagramProfile({String username}){
    return ApiService.getInstagramProfileByUsername(username: username);
  }

  Future<SearchResult> fetchSearchResult({String query}){
    return ApiService.getListUserBySearch(query: query);
  }

}