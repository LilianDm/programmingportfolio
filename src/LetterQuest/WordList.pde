class WordList {
  String[] words;
    WordList() {
    // Initialize the list of words
    words = new String[]{"quest", "journey", "noble", "hero", "dungeon", "spider", "knight", "dragon", "kingdom", "king", "win"};
    this.words = words;
  }
  String randWord() {
    // Select a random word from the list
    return words[int(random(words.length))];
  }
}
