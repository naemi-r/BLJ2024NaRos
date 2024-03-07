// Die Klasse repräsentiert den Hauptprogrammablauf.
public class basic {
    public static void main(String[] args) {
        // Erstellung von zwei Person-Objekten mit den Namen "Jack" und "Maya" sowie dem Geburtsjahr 2000.
        Person p1 = new Person("Jack", 2000);
        Person p2 = new Person("Maya", 2000);
    }
}

// Eine separate Klasse, um die Eigenschaften und Methoden für eine Person zu definieren.
class Person {
    // Private Instanzvariablen, um die Daten der Person zu speichern.
    private String firstname;
    private int birthyear;

    // Konstruktor, um ein Person-Objekt zu erstellen und die Eigenschaften zu initialisieren.
    public Person(String firstname, int birthyear) {
        this.firstname = firstname;
        this.birthyear = birthyear;
    }

    // Hier könnten Getter und Setter hinzugefügt werden, je nach Bedarf.
}

    
