import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class Item {
    String name;
    double price;

    Item(String name, double price) {
        this.name = name;
        this.price = price;
    }
    // addNewItem(String name, double price){

    // }
}
class AvailableItem{
    public List<Item> items;
    AvailableItem(){
        items = new ArrayList<>();
    }
    void addNewItem(Item item){
        items.add(item);
    }

    void displayAvItems(){
        System.out.println("========================Available Items======================");
        int c = 0;
        for (Item item : items) {
            System.out.println(c++ + "- " + item.name + ": $" + item.price);
        }
        System.out.println("========================###############======================");
    }
}
class ShoppingCart {
    private List<Item> cart;
    private double discountPercentage;

    ShoppingCart() {
        cart = new ArrayList<>();
        discountPercentage = 0.0;
    }
 
    void addItem(Item item) {
        cart.add(item);
        // cart.add(new Item(name, price));
        // System.out.println(name + " added to the cart.");
    }

    
    void applyDiscount(double discount) {
        if (discount >= 0 && discount <= 100) {
            discountPercentage = discount;
            System.out.println("Discount of " + discount + "% applied.");
        } else {
            System.out.println("Invalid discount percentage.");
        }
    }

    
    double calculateTotal() {
        double total = 0.0;
        for (Item item : cart) {
            total += item.price;
        }
        total -= total * (discountPercentage / 100);
        return total;
    }

    
    void displayCart() {
        System.out.println("\nItems in your cart:");
        int c = 0;
        for (Item item : cart) {
            System.out.println(c++ + "- " + item.name + ": $" + item.price);
        }
    }
}

public class ShoppingCartDemo {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ShoppingCart cart = new ShoppingCart();
        Item item1 = new Item("Laptop",1200.50);
        Item item2 = new Item("Headphones",150.75);
        Item item3 = new Item("Mouse",25.99);
        Item item5 = new Item("Chain",1225.99);
        Item item6 = new Item("Watch",245.99);
        
        AvailableItem myItem = new AvailableItem();
        myItem.addNewItem(item1);
        myItem.addNewItem(item2);
        myItem.addNewItem(item3);
        myItem.addNewItem(item5);
        myItem.addNewItem(item6);
        myItem.displayAvItems();
        System.out.print("enter 99 for quit \n");
        while (true) {
            System.out.print("Enter Number of the item: ");
            int num = scanner.nextInt();
            if(num == 99) break;
            try {
                cart.addItem(myItem.items.get(num));
            } catch (Exception e) {
                System.out.print("cant find that item\n ");
            }
            
        }
        cart.displayCart();
        System.out.printf("\nTotal cost Before discount: $%.2f\n", cart.calculateTotal());
        System.out.print("discount for this items: ");
        int disc = scanner.nextInt();
        

        
        cart.applyDiscount(disc);

        
        double total = cart.calculateTotal();
        System.out.printf("\nTotal cost after discount: $%.2f\n", total);
    }
}
