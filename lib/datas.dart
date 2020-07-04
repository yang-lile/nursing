import 'dart:io';

import 'package:flutter/cupertino.dart';

class ShoppingDatas {
  static List<int> shoppingObject = [null, null];
  static get compare1 {
    if (shoppingObject[0] == null) {
      return null;
    } else {
      return ConstStrings.getName(shoppingObject[0]);
    }
  }

  static get compare2 {
    if (shoppingObject[1] == null) {
      return null;
    } else {
      return ConstStrings.getName(shoppingObject[1]);
    }
  }

  static List<int> shopping = [];

  static addData({@required int index}) {
    if (shopping.any((element) => element == index)) {
      return;
    }
    shopping.add(index);
  }

  static delData({@required int index}) {
    shopping.remove(index);
  }

  static getIndexData({int index}) {
    return ConstStrings.keyValueMap[index];
  }
}

class ConstStrings {
  static String getName(int i) => keyValueMap[i]["nusingName"];

  static String getInstitutional(int i) => keyValueMap[i]["institutional"];

  static getPower(int i) => keyValueMap[i]["power"];

  static List<String> getAddtress(int i) {
    String s = keyValueMap[i]["addtress"];
    return [
      s.split(' - ')[0],
      s.split(' - ')[1],
      s.split(' - ')[2],
    ];
  }

  static Future<List<String>> getPicture(int i) async {
    final String name = ConstStrings.getName(i);
    File file = File("$name (0).jpg");
    if (await file.exists()) {
      int i = 0;
      List l = [];
      while (await file.exists()) {
        l.add(file.path);
        i++;
        file = File("$name ($i).jpg");
      }
      return l;
    } else {
      return [];
    }
  }

  static List<bool> getOb(int j) {
    List<bool> l = [];
    for (var i = 0; i < 5; i++) {
      l.add(ConstStrings.keyValueMap[j]["ob_$i"]);
    }
    return l;
  }

  static const List<String> areaList = [
    "北京市",
    "重庆市",
    "四川省",
  ];

  static const List<String> institutional = [
    "民办",
    "公建民营",
    "民营",
    "公办",
  ];

  static const List<String> careType = [
    "自理",
    "半自理/介助",
    "不能自理/介护",
    "特护",
    "专护",
  ];

  static const List<Map<String, Object>> keyValueMap = [
    {
      "nusingName": "美好家园•孝慈苑（五星级）养老中心",
      "institutional": "公建民营",
      "time": "2016/4/30",
      "area": "5000",
      "structArea": "18000",
      "bedsNum": "500",
      "moneyDown": "3500",
      "moneyUp": "6300",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": false,
      "addtress": "四川省 - 成都市 - 锦江区",
      "power": "二级乙"
    },
    {
      "nusingName": "福邻养老公寓顺城苑",
      "institutional": "民办",
      "time": "2019/1/1",
      "area": "4300",
      "structArea": "4300",
      "bedsNum": "139",
      "moneyDown": "5000",
      "moneyUp": "11000",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": false,
      "addtress": "四川省 - 成都市 - 锦江区",
      "power": "二级乙"
    },
    {
      "nusingName": "成都哺恩光华养老护理中心",
      "institutional": "民办",
      "time": "2019/1/1",
      "area": "4000",
      "structArea": "4000",
      "bedsNum": "148",
      "moneyDown": "3000",
      "moneyUp": "9000",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": false,
      "addtress": "四川省 - 成都市 - 青羊区",
      "power": "一级甲"
    },
    {
      "nusingName": "亲睦家•鹭湖长者社区",
      "institutional": "民办",
      "time": "2015/4/1",
      "area": "16200",
      "structArea": "16200",
      "bedsNum": "500",
      "moneyDown": "3300",
      "moneyUp": "10000",
      "ob_0": true,
      "ob_1": true,
      "ob_2": false,
      "ob_3": false,
      "ob_4": false,
      "addtress": "四川省 - 成都市 - 温江区",
      "power": "二级甲"
    },
    {
      "nusingName": "成都天府新区一暄康养养老中心",
      "institutional": "民办",
      "time": "2016/12/1",
      "area": "3045",
      "structArea": "3045",
      "bedsNum": "100",
      "moneyDown": "3500",
      "moneyUp": "6000",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": false,
      "ob_4": false,
      "addtress": "四川省 - 成都市 - 双流区",
      "power": "二级丙"
    },
    {
      "nusingName": "成都市颐园养老院",
      "institutional": "民办",
      "time": "1995/6/15",
      "area": "20000",
      "structArea": "10000",
      "bedsNum": "400",
      "moneyDown": "1950",
      "moneyUp": "5320",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": false,
      "addtress": "四川省 - 成都市 - 郫都区",
      "power": "二级乙"
    },
    {
      "nusingName": "乐山颐年养老服务中心",
      "institutional": "民办",
      "time": "2015/7/20",
      "area": "1500",
      "structArea": "1500",
      "bedsNum": "150",
      "moneyDown": "1800",
      "moneyUp": "5000",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": false,
      "addtress": "四川省 - 乐山市 - 市中区",
      "power": "二级乙"
    },
    {
      "nusingName": "德怡智康颐养中心",
      "institutional": "民办",
      "time": "2018/11/19",
      "area": "600",
      "structArea": "600",
      "bedsNum": "60",
      "moneyDown": "4500",
      "moneyUp": "6500",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": false,
      "addtress": "四川省 - 成都市 - 武侯区",
      "power": "一级甲"
    },
    {
      "nusingName": "重庆市正博养老院",
      "institutional": "民营",
      "time": "1905/7/8",
      "area": "4000",
      "structArea": "未知",
      "bedsNum": "70",
      "moneyDown": "2000",
      "moneyUp": "4000",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": false,
      "addtress": "重庆市 - 重庆市 - 大渡口区",
      "power": "未知"
    },
    {
      "nusingName": "小平山庄居家养老院",
      "institutional": "民营",
      "time": "1905/7/10",
      "area": "2000",
      "structArea": "未知",
      "bedsNum": "60",
      "moneyDown": "1800",
      "moneyUp": "5000",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": true,
      "addtress": "重庆市 - 重庆市 - 巴南区",
      "power": "未知"
    },
    {
      "nusingName": "五季元养老",
      "institutional": "民营",
      "time": "1905/7/8",
      "area": "4500",
      "structArea": "未知",
      "bedsNum": "130",
      "moneyDown": "3000",
      "moneyUp": "11000",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": true,
      "addtress": "重庆市 - 重庆市 - 江北区",
      "power": "未知"
    },
    {
      "nusingName": "重庆华奥养老院",
      "institutional": "民营",
      "time": "2012/8/15",
      "area": "600",
      "structArea": "未知",
      "bedsNum": "50",
      "moneyDown": "1000",
      "moneyUp": "5000",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": false,
      "ob_4": false,
      "addtress": "重庆市 - 重庆市 - 九龙坡区",
      "power": "未知"
    },
    {
      "nusingName": "重庆静安养老院",
      "institutional": "民营",
      "time": "1905/7/8",
      "area": "3000",
      "structArea": "未知",
      "bedsNum": "200",
      "moneyDown": "1500",
      "moneyUp": "3500",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": false,
      "addtress": "重庆市 - 重庆市 - 渝北区",
      "power": "未知"
    },
    {
      "nusingName": "重庆市大渡口区广仁颐和老年公寓",
      "institutional": "民营",
      "time": "1905/7/6",
      "area": "3333",
      "structArea": "未知",
      "bedsNum": "200",
      "moneyDown": "1800",
      "moneyUp": "6000",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": true,
      "addtress": "重庆市 - 重庆市 - 大渡口区",
      "power": "未知"
    },
    {
      "nusingName": "重庆市沙坪坝群林养老院",
      "institutional": "民营",
      "time": "2013/1/15",
      "area": "1500",
      "structArea": "未知",
      "bedsNum": "120",
      "moneyDown": "2000",
      "moneyUp": "2500",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": false,
      "addtress": "重庆市 - 重庆市 - 沙坪坝区",
      "power": "未知"
    },
    {
      "nusingName": "珍爱老人护理中心",
      "institutional": "民营",
      "time": "1905/7/9",
      "area": "1685",
      "structArea": "未知",
      "bedsNum": "85",
      "moneyDown": "2000",
      "moneyUp": "4500",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": false,
      "addtress": "重庆市 - 重庆市 - 巴南区",
      "power": "未知"
    },
    {
      "nusingName": "朝阳区社会福利中心",
      "institutional": "公办",
      "time": "1905/6/25",
      "area": "5500",
      "structArea": "3600",
      "bedsNum": "170",
      "moneyDown": "600",
      "moneyUp": "1600",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": false,
      "ob_4": false,
      "addtress": "北京市 - 北京市 - 朝阳区",
      "power": "二级乙"
    },
    {
      "nusingName": "北京市第一社会福利院",
      "institutional": "公办",
      "time": "1905/6/9",
      "area": "46650",
      "structArea": "20000",
      "bedsNum": "1067",
      "moneyDown": "1140",
      "moneyUp": "4950",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": false,
      "ob_4": false,
      "addtress": "北京市 - 北京市 - 朝阳区",
      "power": "一级甲"
    },
    {
      "nusingName": "四季青敬老院",
      "institutional": "公办",
      "time": "1905/5/11",
      "area": "44635",
      "structArea": "27142",
      "bedsNum": "756",
      "moneyDown": "2700",
      "moneyUp": "5000",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": false,
      "addtress": "北京市 - 北京市 - 海淀区",
      "power": "一级甲"
    },
    {
      "nusingName": "北京市石景山寿山福海养老服务中心",
      "institutional": "民办",
      "time": "1905/6/30",
      "area": "26800",
      "structArea": "26600",
      "bedsNum": "600",
      "moneyDown": "4800",
      "moneyUp": "5300",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": true,
      "addtress": "北京市 - 北京市 - 石景山区",
      "power": "一级甲"
    },
    {
      "nusingName": "远洋·椿萱茂（北京亦庄）老年公寓",
      "institutional": "民办",
      "time": "1905/7/5",
      "area": "6400",
      "structArea": "6000",
      "bedsNum": "116",
      "moneyDown": "6350",
      "moneyUp": "20000",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": false,
      "addtress": "北京市 - 北京市 - 大兴区",
      "power": "一级甲"
    },
    {
      "nusingName": "泰康之家·燕园",
      "institutional": "民办",
      "time": "1905/7/7",
      "area": "140000",
      "structArea": "310000",
      "bedsNum": "3000",
      "moneyDown": "6200",
      "moneyUp": "21000",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": false,
      "addtress": "北京市 - 北京市 - 昌平区",
      "power": "一级甲"
    },
    {
      "nusingName": "银龄老年公寓",
      "institutional": "公办",
      "time": "1905/6/24",
      "area": "4150",
      "structArea": "6800",
      "bedsNum": "241",
      "moneyDown": "2700",
      "moneyUp": "4500",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": false,
      "ob_4": false,
      "addtress": "北京市 - 北京市 - 西城区",
      "power": "二级甲"
    },
    {
      "nusingName": "北京西城区牛街民族敬老院",
      "institutional": "公建民营",
      "time": "1905/7/2",
      "area": "未知",
      "structArea": "11000",
      "bedsNum": "220",
      "moneyDown": "3700",
      "moneyUp": "6800",
      "ob_0": true,
      "ob_1": true,
      "ob_2": true,
      "ob_3": true,
      "ob_4": false,
      "addtress": "北京市 - 北京市 - 西城区",
      "power": "二级甲"
    },
  ];
}
