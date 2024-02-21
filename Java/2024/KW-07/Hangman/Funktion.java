import java.util.Random;
import java.util.Scanner;

public class Funktion {
    public static void main(String[] args) {

        String[] words = {"Hallo", "Welt", "Java", "Hangman", "Programmieren"};
        Random random = new Random();
        int randomIndex = random.nextInt(words.length);
        String word = words[randomIndex];
        Scanner scanner = new Scanner(System.in);

        System.out.println("Welcome to Hangman!");
        System.out.println("Enter your first try!");
        String userTry = scanner.nextLine();

        if (!userTry.equals(word)) {
            System.out.println("Sorry, but no.");
            System.out.println("The word was" +word);
        } else {
            System.out.println("Yeah, you got it!");
        }

        scanner.close(); // Close the scanner to prevent resource leak
    }
}
