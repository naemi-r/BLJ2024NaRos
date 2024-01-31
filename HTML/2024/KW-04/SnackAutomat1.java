import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class SnackAutomat1 {
    private Map<String, Snack> snackInventory;
    private Map<String, Snack> snackInventory2;

    public SnackAutomat1() {
        snackInventory = new HashMap<>();
        initializeSnacks();
        snackInventory2 = new HashMap<>();
        initializeSnackInventory2();
    }



    private void initializeSnacks() {
        snackInventory.put("1", new Snack("CocaCola", 2.50, 0));
        snackInventory.put("2", new Snack("Schoggi", 3.20, 0));
        snackInventory.put("3", new Snack("RedBull", 4.75, 0));
        snackInventory.put("4", new Snack("Kekse", 2.80, 0));
        snackInventory.put("5", new Snack("Wasser", 1.90, 0));
        snackInventory.put("6", new Snack("Gummibärli", 3.50, 0));
        snackInventory.put("7", new Snack("Fanta", 2.90, 0));
        snackInventory.put("8", new Snack("Chips", 3.80, 0));
        snackInventory.put("9", new Snack("IceTea", 3.10, 0));
    }

    private void initializeSnackInventory2() {
        snackInventory.put("1", new Snack (red +"CocaCola     " + reset, 2.50,0));
        snackInventory.put("2", new Snack(brown +"Schoggi      " + reset, 3.20, 0));
        snackInventory.put("3", new Snack(blue +"RedBull      " + reset, 4.75, 0));
        snackInventory.put("4", new Snack(beige +"Kekse        "  + reset, 2.80, 0));
        snackInventory.put("5", new Snack(cyan +"Wasser       "  + reset, 1.90, 0));
        snackInventory.put("6", new Snack(pink +"Gummibärli   " + reset, 3.50, 0));
        snackInventory.put("7", new Snack(orange +"Fanta        " + reset, 2.90, 0));
        snackInventory.put("8", new Snack(lighterYellow +"Chips        " + reset, 3.80, 0));
        snackInventory.put("9", new Snack(green +"IceTea       " + reset, 3.10, 0));
    }

    // Definition der Farbcodes
    public static final String red = "\u001B[31m";
    public static final String yellow = "\u001B[33m";
    public static final String green = "\u001B[32m";
    public static final String violet = "\u001B[35m";
    public static final String blue = "\u001B[34m";
    public static final String cyan = "\u001B[36m";
    public static final String reset = "\u001B[0m";
    public static final String black = "\u001B[30m";
    private static final String brown = "\u001B[0;38;5;136m";
    private static final String beige = "\u001B[0;38;5;187m";
    private static final String lightBlue = "\u001B[0;38;5;159m";
    private static final String pink = "\u001B[0;38;5;200m";
    private static final String orange = "\u001B[0;38;5;208m";
    private static final String lighterYellow = "\u001B[0;38;5;226m";

    // Anzeige des Menüs im Konsolenfenster
    public void displayMenu() {
        System.out.println(violet + "+----------------------------------------------------------+");
        System.out.println("|  ___              _             _                  _     |");
        System.out.println("| / __|_ _  __ _ __| |____ _ _  _| |_ ___ _ __  __ _| |_   |");
        System.out.println("| \\__ \\ ' \\/ _` / _| / / _` | || |  _/ _ \\ '  \\/ _` |  _|  |");
        System.out.println("| |___/_||_\\__,_\\__|_\\_\\__,_|\\_,_|\\__\\___/_|_|_\\__,_|\\__|  | ");
        System.out.println("+----------------------------------------------------------+" + reset);

        for (int i = 1; i <= 3; i++) {
            System.out.println(violet +  "+----------------------------------------------------------+" + reset);
            for (int j = 1; j <= 3; j++) {
                int index = (i - 1) * 3 + j;
                String key = String.valueOf(index);
                Snack snack = snackInventory.get(key);

                if (snack.getAvailability() > 0) {
                    System.out.printf("| %-20s %-2d |", snack.getName(), snack.getAvailability());
                } else {
                    System.out.printf("| %-17s|", red +"Ausverkauft      " + reset);
                }
            }
            System.out.println();
            for (int j = 1; j <= 3; j++) {
                int index = (i - 1) * 3 + j;
                String key = String.valueOf(index);
                Snack snack = snackInventory.get(key);

                System.out.printf("| %-5.2fFr.    Nr.%-2s|", snack.getPrice(), key);
            }
            System.out.println();
        }

        System.out.println(violet + "+----------------------------------------------------------+" + reset);
    }


    public void purchaseSnack(String selection) {
        if (selection.equals("1886")) {
            refillAutomat();
            System.out.println("Automat wurde aufgefüllt!");
            return;
        }

        Snack selectedSnack = snackInventory.get(selection);

        if (selectedSnack != null && selectedSnack.getAvailability() > 0) {
            processPurchase(selectedSnack);
        } else {
            System.out.println("Ungültige Auswahl oder Produkt nicht verfügbar. Bitte wählen Sie eine gültige Nummer.");
        }
    }

    private void processPurchase(Snack selectedSnack) {
        System.out.printf("Der Preis für %s beträgt %.2f CHF.%n", selectedSnack.getName(), selectedSnack.getPrice());

        Scanner scanner = new Scanner(System.in);
        System.out.print("Bitte geben Sie den Betrag ein: ");
        double userAmount = scanner.nextDouble();

        if (userAmount == selectedSnack.getPrice() || userAmount > selectedSnack.getPrice()) {
            handleSuccessfulPurchase(selectedSnack, userAmount);
        } else {
            System.out.println("Eingegebener Betrag reicht nicht aus. Der Kauf wurde abgebrochen.");
        }
    }

    private void handleSuccessfulPurchase(Snack selectedSnack, double userAmount) {
        System.out.println("Vielen Dank für Ihren Kauf!");
        System.out.println("Sie haben " + selectedSnack.getName() + " erhalten.");

        if (userAmount > selectedSnack.getPrice()) {
            double change = userAmount - selectedSnack.getPrice();
            System.out.printf("Ihr Wechselgeld beträgt: %.2f CHF%n", change);
        }

        selectedSnack.reduceAvailability();

        Scanner scanner = new Scanner(System.in);
        askForNextPurchase(scanner);
    }

    private void refillAutomat() {
        for (Snack snack : snackInventory.values()) {
            snack.setAvailability(12);
        }
    }

    private void askForNextPurchase(Scanner scanner) {
        System.out.print("Möchten Sie noch etwas kaufen ('ja'/'nein')? ");
        String response = scanner.next();

        if (response.equalsIgnoreCase("ja")) {
            scanner.nextLine();
            System.out.print("Bitte wählen Sie die Nummer des gewünschten Snacks oder '1886' zum Auffüllen: ");
            String nextSelection = scanner.nextLine();
            purchaseSnack(nextSelection);
        } else {
            System.out.println("Vielen Dank! Auf Wiedersehen!");
            System.exit(0);
        }
    }

    public static void main(String[] args) {
        SnackAutomat snackAutomat = new SnackAutomat();
        Scanner scanner = new Scanner(System.in);

        while (true) {
            snackAutomat.displayMenu();
            System.out.print("Bitte wählen Sie die Nummer des gewünschten Snacks oder 'exit' zum Beenden: ");
            String selection = scanner.nextLine();

            if (selection.equalsIgnoreCase("exit")) {
                System.out.println("Vielen Dank! Auf Wiedersehen!");
                break;
            }

            //snackAutomat.purchaseSnack(selection);
        }

        scanner.close();
    }
}

class Snack {
    private String name;
    private double price;
    private int availability;

    public Snack(String name, double price, int availability) {
        this.name = name;
        this.price = price;
        this.availability = availability;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int getAvailability() {
        return availability;
    }

    public void setAvailability(int availability) {
        this.availability = availability;
    }

    public void reduceAvailability() {
        if (availability > 0) {
            availability--;
        }
    }
}