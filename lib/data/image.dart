class ImageObject{
  String photo;
  String id;

  ImageObject({this.photo,this.id});
  ImageObject.fromMap(Map<dynamic, dynamic> json, this.id)
      : photo = json['photo'];
}