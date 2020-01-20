import 'package:flutter/material.dart';
import 'package:flutter_book_app_ui/Widget/bottom_nav.dart';
import 'package:flutter_book_app_ui/constants/app_configs.dart';
import 'package:flutter_book_app_ui/provider/book_provider.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    AppConfigs.init(context);
    final _provider =Provider.of<BookProvider>(context);
    return Scaffold(
        bottomNavigationBar: Bottom(),
        appBar: MyAppBar(_provider),
        body: SingleChildScrollView(
          child:  Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 5.0, right: 5.0),
              child: Column(
                children: <Widget>[
                  _suggestionBookLabel(),
                  SizedBox(height: AppConfigs.height * 0.03),
                  getbookCategoryList(_provider),
                  SizedBox(height: AppConfigs.height * 0.02),
                  _chaptersLabel(),
                  SizedBox(height: AppConfigs.height * 0.03),
                  _chaptersList(_provider)
                ],
              ),),
        ));
  }
  Widget MyAppBar(BookProvider provider) => AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: _centerTitle(),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10),
        child: CircleAvatar(child: Icon(Icons.star)),
      ),
      actions: <Widget>[
        InkWell(
            child: Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80.0),
                  child: Image.network(
                      provider.getProfileImage())
                )),
            onTap: () {
              print('click');
            }),
        SizedBox(width: 20)
      ],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(55))),
      bottom: _appBarBottom());

    //bookCategory
  Widget getbookCategoryList(BookProvider bookList) => Container(
      height: AppConfigs.height /2.6,
      width: AppConfigs.width,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: bookList.getCategoryList().length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: FadeInImage.memoryNetwork(
                          width: AppConfigs.width / 3,
                          fit: BoxFit.contain,
                          placeholder: kTransparentImage,
                        image:bookList.getCategoryList()[index]
                      ))),
              ConstrainedBox(
                  constraints:
                      BoxConstraints(maxWidth: AppConfigs.height * 0.2),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(bookList.getCategoryTitle()[index],
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w700))))
            ]);
          }));

          //centerTitle
  Widget _centerTitle() => AppBar(
        title: Text('e-llumin8',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
        centerTitle: true,
      );

 // Widget _bottomNavigationBar() =>

  _appBarBottom() => PreferredSize(
      child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Center(
              child: Container(
                  height: AppConfigs.height * 0.05,
                  width: AppConfigs.width / 1.8,
                  decoration: ShapeDecoration(
                      color: Colors.blueAccent[700],
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0)))),
                  child: textFieldDecoration()))),
      preferredSize: const Size.fromHeight(90.0));

  Widget _suggestionBookLabel() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              'SuggestionBook',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
              width: AppConfigs.width / 6,
              height: AppConfigs.height /24,
            padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(40.0)),
              child: Center(
                  child:
                      Text('See All', style: TextStyle(color: Colors.white,fontSize: 12))))
        ],
      );

  _chaptersLabel() =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text('My Chaters',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800))),
        Container(
            width: AppConfigs.width / 6,
            height: AppConfigs.height /24,
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(40.0)),
            child: Center(
                child: Text('See All', style: TextStyle(color: Colors.white,fontSize: 12))))
      ]);

  _chaptersList(BookProvider bookProvider) => Container(
      height: AppConfigs.height * 0.4,
      width: AppConfigs.width,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: FadeInImage.memoryNetwork(
                          width: AppConfigs.width / 3,
                          fit: BoxFit.contain,
                          placeholder: kTransparentImage,
                          image: bookProvider.getChaptersList()[index]))),
              ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 100.0),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(bookProvider.getChapterTitle()[index],
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w700))))
            ]);
          }));

  Widget textFieldDecoration() => TextFormField(
    style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintStyle:
              TextStyle(color: Colors.white, height: 0.4, fontSize: 14.0),
          suffixIcon: Padding(
              padding: const EdgeInsets.all(4.5),
              child: CircleAvatar(
                  backgroundColor: Colors.amberAccent,
                  child: Icon(Icons.search, size: 15.0, color: Colors.white))),
          hintText: 'Search Books..',
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
              borderSide: new BorderSide(width: 1.0, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(10))));
}
