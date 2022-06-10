import 'package:banner_view/banner_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_dart/ArticleItem.dart';
import 'package:study_dart/page_webview.dart';

import 'http/Api.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  ScrollController _controller = new ScrollController();
  bool _isHide = true;
  List articles = [];
  List banners = [];
  var totalCount = 0;
  var curPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels && curPage < totalCount) {
        _getArticleList();
      }
    });

    /// 因为这一个方法就是去请求文章列表与banner图，下拉刷新需要重新请求
    /// 然而初始化数据也是请求相同的数据，所以在initState初始化数据的时候手动请求一次！
    _pullToRefresh();
  }

  _getArticleList([bool update = true]) async {
    var data = await Api.getArticleList(curPage);
    if (data != null) {
      var map = data['data'];
      var datas = map['datas'];
      totalCount = map["pageCount"];
      if (curPage == 0) {
        articles.clear();
      }
      curPage++;
      articles.addAll(datas);
      if (update) {
        setState(() {});
      }
    }
  }

  _getBanner([bool update = true]) async {
    var data = await Api.getBanner();
    if (data != null) {
      banners.clear();
      banners.addAll(data['data']);
      if (update) {
        setState(() {});
      }
    }
  }

  Future<void> _pullToRefresh() async {
    curPage = 0;
    Iterable<Future> future = [_getArticleList(), _getBanner()];
    await Future.wait(future);
    _isHide = false;
    setState(() {});
    return null;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Offstage(
          offstage: !_isHide,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        Offstage(
          offstage: _isHide,
          child: RefreshIndicator(
              child: ListView.builder(
                itemBuilder: (context, i) => _buildItem(i),
                itemCount: articles.length + 1,
                controller: _controller,
              ),
              onRefresh: _pullToRefresh),
        ),
      ],
    );
  }

  Widget _buildItem(int i) {
    if (i == 0) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: _bannerView(),
      );
    }
    var itemData = articles[i - 1];
    return ArticleItem(itemData);
  }

  Widget? _bannerView() {
    List<Widget> list = banners.map((item) {
      return InkWell(
        child: Image.network(item['imagePath'], fit: BoxFit.cover),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return WebViewPage(item);
          }));
        },
      );
    }).toList();
    return list.isNotEmpty
        ? BannerView(list, intervalDuration: const Duration(seconds: 3))
        : null;
  }
}
