
class model{
  final String fact;
  final int length;

  model({required this.fact, required this.length});

  factory model.fromJson(Map<String,dynamic> json){
    return model(fact: json['fact'], length: json['length']);
  }
}