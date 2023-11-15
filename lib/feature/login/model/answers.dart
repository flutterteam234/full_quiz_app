class Answers {
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;

  Answers({this.s1, this.s2, this.s3, this.s4, this.s5});

  Answers.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1'] = s1;
    data['2'] = s2;
    data['3'] = s3;
    data['4'] = s4;
    data['5'] = s5;
    return data;
  }
}
