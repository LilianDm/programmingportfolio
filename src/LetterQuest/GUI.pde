public class GUI {
  SoundFile wrong;
  String word;
  int lineHeight = 50; // Height of each line
  int letterSpacing = 20;
  int lineSpacing = lineHeight + letterSpacing; // Spacing between lines
  int incorrectGuesses = 0;
  public boolean won = false;

  GUI(String word) {
    this.word = word;
  }
  String createGuessedWord(String word) {
    String result = "";
    boolean allLettersGuessed = true;
    for (int i = 0; i < word.length(); i++) {
      result += "_ ";
      char letter = word.charAt(i);
      if (!guessedLetters.contains(String.valueOf(letter))) {
        allLettersGuessed = false;
        break;
      }
    }

    return result;
  }
  void display() {
    String displayWord = "";
    for (int i = 0; i < word.length(); i++) {
      char letter = word.charAt(i);
      if (guessedLetters.indexOf(letter) != -1) {
        displayWord += letter + " ";
      } else {
        displayWord += "_ ";
      }
      if (word.charAt(i) == word.length()){
        won = true;
      }
    }
    if(incorrectGuesses == 1) {
      strokeWeight(2);
      line(400,300,360,250);
    } else if(incorrectGuesses == 2) {
      strokeWeight(2);
      line(320,300,360,250);
      line(400,300,360,250);
    } else if(incorrectGuesses == 3) {
      strokeWeight(2);
      line(320,300,360,250);
      line(400,300,360,250);
      line(360,200,360,250);
    } else if(incorrectGuesses == 4) {
      strokeWeight(2);
      line(320,300,360,250);
      line(400,300,360,250);
      line(360,200,360,250);
      line(320,250,360,200);
    } else if(incorrectGuesses == 5) {
      strokeWeight(2);
      line(320,300,360,250);
      line(400,300,360,250);
      line(360,200,360,250);
      line(320,250,360,200);
      line(400,250,360,200);
    } else if(incorrectGuesses == 6) {
      strokeWeight(2);
      line(320,300,360,250);
      line(400,300,360,250);
      line(360,200,360,250);
      line(320,250,360,200);
      line(400,250,360,200);
      line(360,200,360,190);
      circle(360, 170, 40);
      text("Last Chance!!", width/2, 50);
    }
    text(displayWord, 150, height/2 + 50);
    text("Incorrect Guesses: " + incorrectGuesses, width/2, 100);
  }

  void keyPressed() {
    // Get the pressed key as a character
    char keyChar = key;

    // Check if the pressed key is a letter and if it's not already guessed
    if (Character.isLetter(keyChar) && guessedLetters.indexOf(keyChar) == -1) {
      // Add the guessed letter to the list of guessed letters
      guessedLetters += keyChar;

      // Check if the guessed letter is in the word
      if (word.indexOf(keyChar) != -1) {
        println("Correct guess: " + keyChar);
      } else {
        println("Incorrect guess: " + keyChar);
        incorrectGuesses++;
      }
      // Check if the word is completed
        boolean wordCompleted = true;
        for (int i = 0; i < word.length(); i++) {
            if (guessedLetters.indexOf(word.charAt(i)) == -1) {
                wordCompleted = false;
                break;
            }
        }

        // If word is completed, set won to true
        if (wordCompleted) {
            won = true;
        }
      if (incorrectGuesses == 7) {
        gameOver();
      }
    }
  }
  public boolean isWon() {
    return won;
  }
}
