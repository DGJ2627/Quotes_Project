class Quotes_Model {

  String quote;
  String author;
  String count;
  String header;


  Quotes_Model({required this.author, required this.quote,required this.count,required this.header});

  factory Quotes_Model.fromMap({required Map data}) {
    return Quotes_Model(author: data['auth'], quote: data['quote'],count: data['likes'],header: data['hed']);
  }
}



// class MoodName{
//   String mood;
//
//   MoodName({required this.mood});
//
// }
