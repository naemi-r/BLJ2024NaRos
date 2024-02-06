import java.math.BigDecimal;
import java.util.Scanner;

public class Snackautomat_Version02 {

    public static void main(String[] args) {
        // Instantiate an object of SnackMachine class
        SnackMachine snackMachine = new SnackMachine();

        // Call a method or perform operations related to the SnackMachine
        // For example:
        snackMachine.displayMenu();
        snackMachine.handleUserChoice();
    }
}

class SnackMachine {
         
        private Scanner scanner = new Scanner(System.in);
        private static final BigDecimal PRICE_TWIX = new BigDecimal("6.00");
        private static final BigDecimal PRICE_MILCH = new BigDecimal("14.00");
        private static final BigDecimal PRICE_DU = new BigDecimal("100.00");

        public void displayMenu() {
            System.out.println("------------------------");
            System.out.println("|01 Twix  | 6.00 CHF   |");
            System.out.println("|02 Milch | 14.00 CHF  |");
            System.out.println("|03 Du    | 100.00 CHF |");
            System.out.println("------------------------");
            System.out.println("Choose an ID for a snack...");
        }

        public void handleUserChoice() {
            int chosenID = scanner.nextInt();
            
            switch (chosenID) {
                case 1:
                    handlePayment("Twix", PRICE_TWIX);
                    break;
                case 2:
                    handlePayment("Milch", PRICE_MILCH);
                    break;
                case 3:
                    handlePayment("Du", PRICE_DU);
                    break;
                default:
                
                    System.out.println("This ID does not exist!");

                }
                    
            }
        

        private void handlePayment(String snack, BigDecimal price) {
            System.out.println("You have to pay " + price + " CHF for " + snack);
            BigDecimal userPayment = scanner.nextBigDecimal();

            while (userPayment.compareTo(price) < 0) {
                BigDecimal remainingAmount = price.subtract(userPayment);
                System.out.println("You have to pay more. Please enter additional money: " + remainingAmount + " CHF");
                userPayment = userPayment.add(scanner.nextBigDecimal());
            }

            BigDecimal returnMoney = userPayment.subtract(price);
            System.out.println("Thanks! Enjoy your " + snack + ". You will get return money: " + returnMoney + " CHF");
        }

    
}

