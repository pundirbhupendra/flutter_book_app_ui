import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookProvider with ChangeNotifier{

  static const String profileImage ='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJhUHidYiGsxaq5xss06PUXBYql_Dm0LvAJztmmFh2ouadPGsI1A&s';
  static var myChaptersList = [
    'https://i.pinimg.com/236x/f5/da/90/f5da901de158988c7825960c669c0078--vintage-book-covers-vintage-books.jpg?nii=t',
    'https://img3.stockfresh.com/files/k/krabata/m/35/2705847_stock-photo-vintage-elements-for-frame-or-book-cover-card.jpg',
    'https://cdn3.vectorstock.com/i/1000x1000/43/07/vintage-book-cover-vector-22334307.jpg',
    'https://f0.pngfuel.com/png/296/297/flyer-template-brochure-creative-book-designs-sample-logo-poster-png-clip-art-thumbnail.png'
  ];
  static var bookCategoryTitle = [
    'Moonstoner',
    'Your Text',
    'Cover Book',
    'Book Logo'
  ];

  static var bookCategoryList = [
    'https://cdn.pastemagazine.com/www/system/images/photo_albums/best-book-covers-july-2019/large/bbcjuly19verynice.jpg?1384968217',
    'https://files.realpython.com/media/python-tricks-book-cover.5b0f5df06d94.jpg',
    'https://cdn3.vectorstock.com/i/1000x1000/43/07/vintage-book-cover-vector-22334307.jpg',
    'https://f0.pngfuel.com/png/296/297/flyer-template-brochure-creative-book-designs-sample-logo-poster-png-clip-art-thumbnail.png'
  ];
  static var bookChapterTitle = [
    'Very Nice',
    'Python Tricks',
    'Cover Book',
    'Book Logo'
  ];

  getProfileImage() {
    return profileImage;
  }
  List<String> getChaptersList() {
    return myChaptersList;
  }

  List<String> getChapterTitle() {
    return bookChapterTitle;
  }
  List<String> getCategoryTitle() {
    return bookChapterTitle;
  }


  List<String> getCategoryList() {
    return bookCategoryList;
  }
}
