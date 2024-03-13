//Paul Schlegel and Jackson Payne
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
String identifyCard;
boolean hasMatchingCard;
String aiCard;
String identifyColor;
int remainingCards;

class player {
  String identifyCard(String card) {
    if (card.equals("0") || card.equals("1") || card.equals("2") || card.equals("3") || card.equals("4") || card.equals("5") || card.equals("6") || card.equals("7") || card.equals("8") || card.equals("9")) {
      return "Number card: " + card;
    } else if (card.equals("Skip")) {
      return "Special card: Skip";
    } else if (card.equals("Wild")) {
      return "Special card: Wild";
    } else if (card.equals("Plus2")) {
      return "Special card: Plus2";
    } else if (card.equals("Plus4")) {
      return "Special card: Plus4";
    } else {
      return "Unknown card";
    }
  }

  String identifyColor(String card) {
    String[] colors = {"Red", "Blue", "Green", "Yellow"};
    if (card.equals("Red") || card.equals("Blue") || card.equals("Green") || card.equals("Yellow")) {
      return "Color card: " + card;
    }
    return "Unknown color";
  }

  boolean hasMatchingCard(String aiCard, ArrayList<String> aiHand) {
    for (String card : aiHand) {
      if (card.equals(aiCard)) {
        return true;
      }
    }
    return false;
  }
  String[] colors = {"Red", "Blue", "Green", "Yellow"};
  String[] normal = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};
  String[] special = {"Skip", "Wild", "Plus2", "Plus4"};

  String generateRandomCard() {
    String cards = " ";
    String card = "";
    for (int i = 0; i < 7; i++) {
      if (random(2) == 0) {
        card = colors[int(random(colors.length))] + " " + normal[int(random(normal.length))];
      } else {
        card = special[int(random(special.length))];
      }
      cards += "Generated card: a " + card + "\n";
    }
    return cards;
  }

  // int remainingCards(int 7) {
}
