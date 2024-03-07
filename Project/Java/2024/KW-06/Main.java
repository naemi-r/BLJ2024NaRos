public class Main {
    public static void main(String[] args) {
        boolean wiederholen = true;

        while (wiederholen) {
            // Hier kommt dein bestehender Code oder die Funktion, die du wiederholen möchtest

            // Beispiel: Gib "Hello, World!" aus
            System.out.println("Hello, World!");

            // Frage den Benutzer, ob er den Code wiederholen möchte
            System.out.println("Möchtest du den Code wiederholen? (ja/nein)");
            java.util.Scanner scanner = new java.util.Scanner(System.in);
            String antwort = scanner.nextLine();

            // Überprüfe die Antwort des Benutzers
            if (!antwort.equalsIgnoreCase("ja")) {
                wiederholen = false;
            }
        }
    }
}
