class FaqsModel {
  var id, title;
  List<Faqsubcat> subcat;

  FaqsModel({this.id, this.title, required this.subcat});
}

class Faqsubcat {
  var id, title;
  var is_textbox;

  List<Faqsubsubcat> subsubcat;

  Faqsubcat({
    this.id,
    this.title,
    required this.subsubcat,
    this.is_textbox,
  });
}

class Faqsubsubcat {
  var id, title, subString;
  var is_textbox;

  Faqsubsubcat({this.id, this.title, this.subString, this.is_textbox});
}
