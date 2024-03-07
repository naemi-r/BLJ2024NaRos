import java.util.Scanner;

public class Snackautomat {
    public static void main(String[] args) {
        // Objekt der SnackMachine-Klasse instanziieren
        SnackMachine snackMachine = new SnackMachine();

        // Methode displayMenu() aufrufen, um den Automaten zu verwenden
        snackMachine.displayMenu();

        // Nach Verwendung den Scanner schließen
        snackMachine.closeScanner();
    }
}

class SnackMachine {
    private Scanner scanner = new Scanner(System.in);
    private float waterBottle = 3f;

    public void displayMenu() {
        System.out.println("You can pay with 1 Fr. and 2 Fr.");
        System.out.println("Waterbottle | 3 Fr. | ID 01");
        int chosenID = scanner.nextInt();

        while (true) {
            // Ausgabe des aktuellen Kostenstands der Wasserflasche
            System.out.println("Current cost: " + waterBottle + " Fr.");

            // Benutzer wird nach Zahlungsaufforderung gefragt
            System.out.print("Do you want to pay 3 Fr.? (Enter 1 to pay 1 Fr. or enter 2 to pay 2 Fr., 0 to exit): ");

            // Benutzereingabe wird eingelesen
            int userInput = scanner.nextInt();

            // Überprüfung der Benutzereingabe
            if (userInput == 1 || userInput == 2) {
                // Reduzierung des Wasserflaschenbetrags um den entsprechenden Betrag
                waterBottle -= userInput;

                // Ausgabe der Zahlungsinformation und des verbleibenden Betrags
                System.out.println("You have to pay " + waterBottle);

                // Überprüfung, ob der volle Betrag bezahlt wurde
                if (waterBottle <= 0) {
                    // Ausgabe bei vollständiger Bezahlung und Beendigung der Schleife
                    System.out.println("You have paid the full amount. Thank you!");
                    break;
                }
            } else if (userInput == 0) {
                // Ausgabe bei Beendigung der Zahlungsschleife und Anzeige des verbleibenden Betrags
                System.out.println("Exiting payment loop. Remaining amount: " + waterBottle + " Fr.");
                break;
            } else {
                // Ausgabe bei ungültiger Eingabe
                System.out.println("Invalid input. Please enter 1 to pay 1 Fr., 2 to pay 2 Fr., or 0 to exit.");
            }
        }
    }

    public void closeScanner() {
        scanner.close();
    }
}
