class ImagesFile{
  int? id;
  String? image1;
  String? name;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  String? result1;
  String? result2;
  String? result3;
  String? result4;
  String? result5;
  DateTime? date;
  String? details;

  ImagesFile({
    this.id,
    this.name,
    this.image1, this.image2, this.image3, this.image4,this.image5,
    this.result1,this.result2,this.result3,this.result4,this.result5,
    this.date,
    this.details,
  });

  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      'id':id,
      'name':name,
      'details':details,
      'date':date!.toIso8601String(),
      'image1':image1,
      'image2':image2,
      'image3':image3,
      'image4':image4,
      'image5':image5,
      'result1':result1,
      'result2':result2,
      'result3':result3,
      'result4':result4,
      'result5':result5,

    };
    return map;
  }

  ImagesFile.fromMap(Map<String,dynamic>map){
    id = map['id'];
    name = map['name'];
    details=map['details'];
    date=DateTime.parse(map['date']as String);
    image1=map['image1'];
    image2=map['image2'];
    image3=map['image3'];
    image4=map['image4'];
    image5=map['image5'];
    result1=map['result1'];
    result2=map['result2'];
    result3=map['result3'];
    result4=map['result4'];
    result5=map['result5'];

  }
}