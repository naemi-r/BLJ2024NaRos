import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
 
public class SnackAutomat {
    private Map<String, Snack> snackInventory;
 
    public SnackAutomat() {
        snackInventory = new HashMap<>();
        snackInventory.put("1", new Snack("Chips", 50));
        snackInventory.put("2", new Snack("Schokolade", 60));
        snackInventory.put("3", new Snack("Getränk", 75));
    }
 
    public void displayMenu() {
        System.out.println("+---------------------------+");
        System.out.println("| Willkommen am Snack-Automat |");
        System.out.println("+---------------------------+");
        System.out.println("| Snack   | Preis  |         |");
        System.out.println("|---------|--------|---------|");
        for (Map.Entry<String, Snack> entry : snackInventory.entrySet()) {
            Snack snack = entry.getValue();
            System.out.printf("| %s. %-8s %-6s |\n", entry.getKey(), snack.getName(), snack.getPrice() + " Cent");
        }
 
        System.out.println("+---------------------------+");
    }
 
    public void purchaseSnack(String selection, int money) {
        Snack selectedSnack = snackInventory.get(selection);
 
        if (selectedSnack != null) {
            if (selectedSnack.getPrice() <= money) {
                int change = money - selectedSnack.getPrice();
                System.out.println("Vielen Dank für Ihren Kauf!");
                System.out.println("Sie haben " + selectedSnack.getName() + " erhalten.");
                if (change > 0) {
                    System.out.println("Ihr Wechselgeld beträgt: " + change + " Cent");
                }
            } else {
                System.out.println("Unzureichendes Guthaben. Bitte geben Sie ausreichend Geld ein.");
            }
        } else {
            System.out.println("Ungültige Auswahl. Bitte wählen Sie eine gültige Nummer.");
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
 
            System.out.print("Geben Sie den Betrag ein (in Cent): ");
            int money = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character
 
            snackAutomat.purchaseSnack(selection, money);
        }
 
        scanner.close();
    }
}
 
class Snack {
    private String name;
    private int price;
 
    public Snack(String name, int price) {
        this.name = name;
        this.price = price;
    }
 
    public String getName() {
        return name;
    }
 
    public int getPrice() {
        return price;
    }
}