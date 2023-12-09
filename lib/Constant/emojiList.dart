class EmojiMood{
  final String title;
  bool isSelected;
  EmojiMood(this.title, this.isSelected);


  static List allMoodListData = [
    "Life",
    "Inspirational",
    "humor",
    "Philosophy",
    "God",
    "Spiritual",
    "Truth",
    "Romance",
    "Poetry",
    "Death",
    "Happiness",
    "Hope",
    "Faith",
  ];




  static List<EmojiMood> allMood = [

    EmojiMood("Life", false),
    EmojiMood("Inspirational", false),
    EmojiMood("humor", false),
    EmojiMood("Philosophy", false),
    EmojiMood("God", false),
    EmojiMood("Spiritual", false),
    EmojiMood("Truth", false),
    EmojiMood("Romance", false),
    EmojiMood("Poetry", false),
    EmojiMood("Death", false),
    EmojiMood("Happiness", false),
    EmojiMood("Hope", false),


  ];




  static List allMoodListImages = [
    "Assets/Images/QB2.jpg",
    "Assets/Images/QB3.jpg",
    "Assets/Images/QB4.jpg",
    "Assets/Images/QB5.jpg",
    "Assets/Images/QB6.jpg",
    "Assets/Images/QB14.jpg",
    "Assets/Images/QB7.jpg",
    "Assets/Images/QB8.jpg",
    "Assets/Images/QB9.jpg",
    "Assets/Images/QB10.jpg",
    "Assets/Images/QB11.jpg",
    "Assets/Images/QB12.jpg",
    "Assets/Images/QB13.jpg",
  ];
}