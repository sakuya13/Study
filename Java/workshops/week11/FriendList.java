import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * FriendList
 */
public class FriendList {

    // private static ArrayList<String> friendList = new ArrayList<>();
    private static InsertionPointList<String> friendList = new InsertionPointList<>();
    static Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        while (true) {

            printMod();
            System.out.println("What do you want (setInsertionPoint, inputName, deleteName, moveName, quit)?");
            String key = s.nextLine();
            switch (key) {
                case "setInsertionPoint":
                    setInsertionPoint();
                    break;
                case "inputName":
                    readMod();
                    break;
                case "deleteName":
                    deleteMod();
                    break;
                case "moveName":
                    moveName();
                    break;
                case "quit":
                    System.exit(0);
                default:
                    System.out.println("invalid command: " + key);
            }
            System.out.println();

        }
    }
    
    private static void setInsertionPoint() {
        while (true) {
            System.out.println("Set insertion point: (-1 to skip)");
            String pointStr = s.nextLine();
            int insertionPoint = Integer.parseInt(pointStr);
            if (insertionPoint == -1) {
                break;
            }
            friendList.setInsertionPoint(insertionPoint);
        }
    }

    private static void printMod() {
        System.out.println("fat at " + friendList.getInsertionPoint());
        if (friendList.size() == 0) {
            System.out.println("Empty list.");
        }
        for (int i = 0; i < friendList.size(); i++) {
            System.out.println((i+1) + " " + friendList.get(i));
        }
    }
    
    private static void readMod() {
        while (true) {
            System.out.println("Enter a name:");
            String newName = s.nextLine();
            if (newName.equals("")) {
                break;
            }
            friendList.addElt(newName);
            // friendList.addElt(newName);
        }
    }

    private static void deleteMod() throws InputMismatchException {
        while (true) {
            System.out.println("Enter position of name to delete (Enter 0 to skip).");
            try {
                String indexStr = s.nextLine();
                int index = Integer.parseInt(indexStr);
                if (index < 0) {
                    throw new InputMismatchException();
                }
                if (index == 0) {
                    break;
                }
                friendList.removeElt(index - 1);
            } catch (Exception e) {
                // s.nextLine();
                System.out.println(e);
                System.out.println("Invalid input.");
                System.out.println("Please try again.");
            }
        }
    }
    
    private static void moveName() {
        while (true) {
            try {
                System.out.println("Enter the position of the name you want to move (0 to skip):");
                String fromIndexStr = s.nextLine();
                int fromIndex = Integer.parseInt(fromIndexStr);
                if (fromIndex == 0) {
                    break;
                }
                System.out.println("Enter the destination position:");
                String toIndexStr = s.nextLine();
                int toIndex = Integer.parseInt(toIndexStr);
                // friendList.copy(toIndex - 1, fromIndex - 1);
                friendList.copy(fromIndex - 1, toIndex);
                friendList.removeElt(fromIndex - 1);
            } catch (Exception e) {
                System.out.println(e);
                System.out.println("Invalid input.");
                System.out.println("Please try again.");
            }

        }
    }
}
