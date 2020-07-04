import 'package:Nursing_Home/datas.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FunctionPage extends StatefulWidget {
  @override
  _FunctionPageState createState() => _FunctionPageState();
}

class _FunctionPageState extends State<FunctionPage> {
  Widget _areaWidgets;
  Widget _instWidgets;
  Widget _careWidgets;
  List<bool> _areaSelected = [];
  List<bool> _instSelected = [];
  List<bool> _careSelected = [];
  int selectedPage = 0;
  int choiceChip = 0;

  // 购物车页

  _areaInitRow() {
    List<Widget> l = [];
    l.add(
      Container(
        width: 90,
        alignment: Alignment.centerLeft,
        child: Text(
          "地区",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
    List<Widget> r = [];
    for (int index = 0; index < ConstStrings.areaList.length; index++) {
      Color color = Colors.white;
      if (_areaSelected[index]) {
        color = Colors.blue[300];
      }
      r.add(
        GestureDetector(
          onTap: () {
            setState(
              () {
                _areaSelected[index] = !_areaSelected[index];
              },
            );
          },
          child: Chip(
            backgroundColor: color,
            label: Text("${ConstStrings.areaList[index]}"),
          ),
        ),
      );
    }
    l.add(Wrap(
      direction: Axis.horizontal,
      spacing: 4.0,
      runSpacing: 2.0,
      children: r,
    ));
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: l,
    );
  }

  _insiInitRow() {
    List<Widget> l = [];
    l.add(
      Container(
        width: 90,
        alignment: Alignment.centerLeft,
        child: Text(
          "机构性质",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
    List<Widget> r = [];
    for (int index = 0; index < ConstStrings.institutional.length; index++) {
      Color color = Colors.white;
      if (_instSelected[index]) {
        color = Colors.blue[300];
      }
      r.add(
        GestureDetector(
          onTap: () {
            setState(
              () {
                _instSelected[index] = !_instSelected[index];
              },
            );
          },
          child: Chip(
            backgroundColor: color,
            label: Text("${ConstStrings.institutional[index]}"),
          ),
        ),
      );
    }
    l.add(Wrap(
      direction: Axis.horizontal,
      spacing: 4.0,
      runSpacing: 2.0,
      children: r,
    ));
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: l,
    );
  }

  _careInitRow() {
    List<Widget> l = [];
    l.add(
      Container(
        width: 90,
        alignment: Alignment.centerLeft,
        child: Text(
          "收住对象",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
    List<Widget> r = [];
    for (int index = 0; index < ConstStrings.careType.length; index++) {
      Color color = Colors.white;
      if (_careSelected[index]) {
        color = Colors.blue[300];
      }
      r.add(
        GestureDetector(
          onTap: () {
            setState(
              () {
                _careSelected[index] = !_careSelected[index];
              },
            );
          },
          child: Chip(
            backgroundColor: color,
            label: Text("${ConstStrings.careType[index]}"),
          ),
        ),
      );
    }
    l.add(Wrap(
      direction: Axis.horizontal,
      spacing: 4.0,
      runSpacing: 2.0,
      children: r,
    ));
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: l,
    );
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < ConstStrings.areaList.length; i++) {
      _areaSelected.add(false);
    }
    for (var i = 0; i < ConstStrings.institutional.length; i++) {
      _instSelected.add(false);
    }
    for (var i = 0; i < ConstStrings.careType.length; i++) {
      _careSelected.add(false);
    }
    _areaWidgets = _areaInitRow();
    _instWidgets = _insiInitRow();
    _careWidgets = _careInitRow();
  }

  @override
  Widget build(BuildContext context) {
    _areaWidgets = _areaInitRow();
    _instWidgets = _insiInitRow();
    _careWidgets = _careInitRow();

    // 判断全选
    bool a1 = false, a2 = false, a3 = false;
    for (var item in _areaSelected) {
      if (item) {
        a1 = true;
      }
    }
    for (var item in _instSelected) {
      if (item) {
        a2 = true;
      }
    }
    for (var item in _careSelected) {
      if (item) {
        a3 = true;
      }
    }
    // 筛选
    List<Map<String, Object>> _map1 = ConstStrings.keyValueMap;
    List<bool> _selected = [];
    for (var i = 0; i < _map1.length; i++) _selected.add(false);

    if (a1) {
      for (var j = 0; j < ConstStrings.areaList.length; j++) {
        for (var i = 0; i < _map1.length; i++) {
          if (_areaSelected[j] &&
              ConstStrings.getAddtress(i)[0] == ConstStrings.areaList[j]) {
            _selected[i] = true;
          }
        }
      }
    }
    if (a2) {
      for (var j = 0; j < ConstStrings.institutional.length; j++) {
        for (var i = 0; i < _map1.length; i++) {
          if (_instSelected[j] &&
              ConstStrings.getInstitutional(i) ==
                  ConstStrings.institutional[j]) {
            _selected[i] = true;
          }
        }
      }
    }
    if (a3) {
      for (var i = 0; i < _map1.length; i++) {
        for (var j = 0; j < 5; j++) {
          if (_careSelected[j] && ConstStrings.getOb(i)[j]) {
            _selected[i] = true;
          }
        }
      }
    }

    return Scaffold(
      body: Row(children: [
        // leftbar
        Container(
          width: 350.0,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.all(8.0),
                height: 250,
                color: Colors.white60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            "asset/page_picture/优尔健设计图.png",
                            width: 150,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text("用户名"),
                      ],
                    ),
                    Text("等级：v6"),
                    Text("已注册会员"),
                  ],
                ),
              ),
              ChoiceChip(
                label: Container(
                  width: 200,
                  alignment: Alignment.center,
                  child: Text("主  页"),
                ),
                selected: selectedPage == 0,
                onSelected: (s) => setState(() => selectedPage = 0),
              ),
              ChoiceChip(
                label: Container(
                  width: 200,
                  alignment: Alignment.center,
                  child: Text("购物车"),
                ),
                selected: selectedPage == 1,
                onSelected: (value) => setState(() => selectedPage = 1),
              ),
            ],
          ),
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              switch (selectedPage) {
                case 0:
                  // 主页
                  return buildListPage(a1, a2, a3, _selected, context);
                  break;
                case 1:
                  // 功能页
                  return buildShopping();
                default:
                  return Container();
              }
            },
          ),
        ),
      ]),
    );
  }

  // 购物车页
  buildShopping() {
    return Row(children: [
      Expanded(
        child: ListView.builder(
          itemCount: ShoppingDatas.shopping.length,
          itemBuilder: (BuildContext context, int index) {
            return _BuildCard(
              context: context,
              index: ShoppingDatas.shopping[index],
              icon: Icons.remove_shopping_cart,
            );
          },
        ),
      ),
    ]);
  }

  /// _showDialog({int index1, int index2, BuildContext context}) {
  ///   Map<String, Object> _data1 = ConstStrings.keyValueMap[index1];
  ///   Map<String, Object> _data2 = ConstStrings.keyValueMap[index2];
  ///   return showDialog(
  ///     context: context,
  ///     child: Row(children: [
  ///       Padding(
  ///         padding: const EdgeInsets.fromLTRB(300.0, 100.0, 300.0, 100.0),
  ///         child: Card(
  ///           child: Padding(
  ///             padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 16.0),
  ///             child: Column(
  ///               crossAxisAlignment: CrossAxisAlignment.start,
  ///               children: [
  ///                 Row(
  ///                   children: [
  ///                     Image.asset("asset/img/p.jpg"),
  ///                     Expanded(
  ///                       child: Padding(
  ///                         padding: const EdgeInsets.all(8.0),
  ///                         child: Column(
  ///                             crossAxisAlignment: CrossAxisAlignment.start,
  ///                             children: [
  ///                               Padding(
  ///                                 padding: const EdgeInsets.all(8.0),
  ///                                 child: Text(
  ///                                   _data1["nusingName"],
  ///                                   style: TextStyle(
  ///                                     fontSize: 32.0,
  ///                                   ),
  ///                                 ),
  ///                               ),
  ///                               Padding(
  ///                                 padding: const EdgeInsets.all(8.0),
  ///                                 child: Text(
  ///                                   "价格：${_data1["moneyDown"]}-${_data1["moneyUp"]}",
  ///                                   style: TextStyle(
  ///                                     fontSize: 20.0,
  ///                                     color: Colors.red[500],
  ///                                   ),
  ///                                 ),
  ///                               ),
  ///                             ]),
  ///                       ),
  ///                     ),
  ///                   ],
  ///                 ),
  ///                 Divider(),
  ///                 Padding(
  ///                   padding: EdgeInsets.all(8.0),
  ///                   child: Text(
  ///                     "机构性质：${_data1["institutional"]}",
  ///                     style: TextStyle(
  ///                       fontSize: 16.0,
  ///                     ),
  ///                   ),
  ///                 ),
  ///                 Padding(
  ///                   padding: EdgeInsets.all(8.0),
  ///                   child: Text(
  ///                     "成立时间：${_data1["time"]}",
  ///                     style: TextStyle(
  ///                       fontSize: 16.0,
  ///                     ),
  ///                   ),
  ///                 ),
  ///                 Padding(
  ///                   padding: EdgeInsets.all(8.0),
  ///                   child: Text(
  ///                     "占地面积：${_data1["area"]}",
  ///                     style: TextStyle(
  ///                       fontSize: 16.0,
  ///                     ),
  ///                   ),
  ///                 ),
  ///                 Padding(
  ///                   padding: EdgeInsets.all(8.0),
  ///                   child: Text(
  ///                     "建筑面积：${_data1["structArea"]}",
  ///                     style: TextStyle(
  ///                       fontSize: 16.0,
  ///                     ),
  ///                   ),
  ///                 )
  ///               ],
  ///             ),
  ///           ),
  ///         ),
  ///       ),
  ///       VerticalDivider(),
  ///       Padding(
  ///         padding: const EdgeInsets.fromLTRB(300.0, 100.0, 300.0, 100.0),
  ///         child: Card(
  ///           child: Padding(
  ///             padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 16.0),
  ///             child: Column(
  ///               crossAxisAlignment: CrossAxisAlignment.start,
  ///               children: [
  ///                 Row(
  ///                   children: [
  ///                     Image.asset("asset/img/p.jpg"),
  ///                     Expanded(
  ///                       child: Padding(
  ///                         padding: const EdgeInsets.all(8.0),
  ///                         child: Column(
  ///                             crossAxisAlignment: CrossAxisAlignment.start,
  ///                             children: [
  ///                               Padding(
  ///                                 padding: const EdgeInsets.all(8.0),
  ///                                 child: Text(
  ///                                   _data2["nusingName"],
  ///                                   style: TextStyle(
  ///                                     fontSize: 32.0,
  ///                                   ),
  ///                                 ),
  ///                               ),
  ///                               Padding(
  ///                                 padding: const EdgeInsets.all(8.0),
  ///                                 child: Text(
  ///                                   "价格：${_data2["moneyDown"]}-${_data2["moneyUp"]}",
  ///                                   style: TextStyle(
  ///                                     fontSize: 20.0,
  ///                                     color: Colors.red[500],
  ///                                   ),
  ///                                 ),
  ///                               ),
  ///                             ]),
  ///                       ),
  ///                     ),
  ///                   ],
  ///                 ),
  ///                 Divider(),
  ///                 Padding(
  ///                   padding: EdgeInsets.all(8.0),
  ///                   child: Text(
  ///                     "机构性质：${_data2["institutional"]}",
  ///                     style: TextStyle(
  ///                       fontSize: 16.0,
  ///                     ),
  ///                   ),
  ///                 ),
  ///                 Padding(
  ///                   padding: EdgeInsets.all(8.0),
  ///                   child: Text(
  ///                     "成立时间：${_data2["time"]}",
  ///                     style: TextStyle(
  ///                       fontSize: 16.0,
  ///                     ),
  ///                   ),
  ///                 ),
  ///                 Padding(
  ///                   padding: EdgeInsets.all(8.0),
  ///                   child: Text(
  ///                     "占地面积：${_data2["area"]}",
  ///                     style: TextStyle(
  ///                       fontSize: 16.0,
  ///                     ),
  ///                   ),
  ///                 ),
  ///                 Padding(
  ///                   padding: EdgeInsets.all(8.0),
  ///                   child: Text(
  ///                     "建筑面积：${_data2["structArea"]}",
  ///                     style: TextStyle(
  ///                       fontSize: 16.0,
  ///                     ),
  ///                   ),
  ///                 )
  ///               ],
  ///             ),
  ///           ),
  ///         ),
  ///       ),
  ///     ]),
  ///   );
  /// }

  Row buildListPage(
      bool a1, bool a2, bool a3, List<bool> _selected, BuildContext context) {
    return Row(children: [
      Expanded(
        child: CustomScrollView(
          slivers: <Widget>[
            // 轮播图

            // 主页
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // 按逻辑加载
                  if (!(a1 || a2 || a3))
                    return _BuildCard(
                      context: context,
                      index: index,
                      icon: Icons.add_shopping_cart,
                    );
                  else {
                    if (_selected[index])
                      return _BuildCard(
                        context: context,
                        index: index,
                        icon: Icons.add_shopping_cart,
                      );
                    else
                      return Container();
                  }
                },
                childCount: ConstStrings.keyValueMap.length,
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 350,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _areaWidgets,
              _instWidgets,
              _careWidgets,
            ],
          ),
        ),
      ),
    ]);
  }
}

class _BuildCard extends StatefulWidget {
  final index;
  final icon;
  final BuildContext context;
  const _BuildCard({
    Key key,
    @required this.context,
    @required this.index,
    @required this.icon,
  }) : super(key: key);
  @override
  __BuildCardState createState() => __BuildCardState();
}

class __BuildCardState extends State<_BuildCard> {
  bool ex;
  @override
  void initState() {
    super.initState();
    ex = true;
  }

  @override
  Widget build(BuildContext context) {
    String pictureName =
        "asset/img/${ConstStrings.getName(widget.index)} (1).jpg";
    if (!true) {
      return Container();
    } else {
      return Card(
        child: FlatButton(
          onPressed: () {
            _showDialog(context: context, index: widget.index);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  pictureName,
                  height: 160,
                  width: 300.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, object, trace) {
                    return Image.asset(
                      "asset/img/p.jpg",
                      height: 160,
                      width: 300.0,
                      fit: BoxFit.cover,
                    );
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 50.0),
                            child: Text(
                              ConstStrings.keyValueMap[widget.index]
                                  ["nusingName"],
                              style: TextStyle(fontSize: 32.0),
                            ),
                          ),
                          StarsWidget(widget.index),
                          Text(ConstStrings.keyValueMap[widget.index]
                              ["addtress"]),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FlatButton(
                    onPressed: () {
                      if (widget.icon == Icons.add_shopping_cart) {
                        ShoppingDatas.addData(index: widget.index);
                      } else {
                        setState(() {
                          ex = false;
                        });
                        ShoppingDatas.delData(index: widget.index);
                      }
                    },
                    child: Icon(
                      widget.icon,
                      size: 48.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  _showDialog({int index, BuildContext context}) {
    Map<String, Object> _data = ConstStrings.keyValueMap[index];
    return showDialog(
      context: context,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(300.0, 100.0, 300.0, 100.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("asset/img/p.jpg"),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _data["nusingName"],
                                  style: TextStyle(
                                    fontSize: 32.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "价格：${_data["moneyDown"]}-${_data["moneyUp"]}",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.red[500],
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "机构性质：${_data["institutional"]}",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "成立时间：${_data["time"]}",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "占地面积：${_data["area"]}",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "建筑面积：${_data["structArea"]}",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StarsWidget extends StatelessWidget {
  final int index;
  const StarsWidget(
    this.index, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        List<bool> data = ConstStrings.getOb(index);
        List<String> title = [
          "自理",
          "半自理/介助",
          "不能自理/介护",
          "特护",
          "专护",
        ];
        List<Widget> _widget = [];
        for (var i = 0; i < 5; i++) {
          if (data[i]) {
            _widget.add(Chip(
              avatar: Icon(
                Icons.star,
                color: Colors.yellow[700],
              ),
              label: Text(title[i]),
            ));
          } else {
            _widget.add(Chip(
              avatar: Icon(
                Icons.star_border,
                color: Colors.yellow[700],
              ),
              label: Text(title[i]),
            ));
          }
        }
        return Wrap(
          direction: Axis.horizontal,
          children: _widget,
        );
      },
    );
  }
}
