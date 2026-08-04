
import 'package:flutter_riverpod/legacy.dart';

final searchProvider = StateNotifierProvider<SearchProvider, String>((ref){
  return SearchProvider();
});

class SearchProvider extends StateNotifier<String> {
  SearchProvider() : super('');

  void search(String query){
    state  = query;
  }

}