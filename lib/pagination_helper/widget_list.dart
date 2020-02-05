import 'package:flutter/material.dart';
import 'package:flutter_pagination_helper/pagination_helper/progressbar.dart';

class WidgetList<T extends Widget> extends StatelessWidget {
  final List<T> widgetList;
  final Function onScrollListener;
  final Widget _progressWidget;

  WidgetList(this.widgetList, this._progressWidget, this.onScrollListener);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    _scrollController.addListener(() {
      print(_scrollController.position.pixels.round());
      if ((_scrollController.position.maxScrollExtent.round() - 10) ==
          _scrollController.position.pixels.round()) {
        onScrollListener();
      }
    });
    return ListView.builder(
      controller: _scrollController,
      itemCount: widgetList.length,
      itemBuilder: (BuildContext context, int index) => ListItem(
        model: widgetList[index],
        progressWidget: _progressWidget,
      ),
    );
  }
}

class ListItem<T extends Widget> extends StatelessWidget {
  final T model;
  final Widget progressWidget;

  ListItem({Key key, this.model, this.progressWidget});

  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: progressWidget ?? ProgressWidget(),
        ),
      );
    } else {
      return model;
    }
  }
}
