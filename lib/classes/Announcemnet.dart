class Announcemnet {
   int id;
   String title;
   String readMore;

   Announcemnet({this.id,this.title,this.readMore});

   factory Announcemnet.fromJson(Map<String, dynamic> json) {
    return Announcemnet(
      id:json['id'],
      readMore: json['readMore'],
      title: json['title'],
      
    );
  }
   



}