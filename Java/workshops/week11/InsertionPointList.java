import java.util.ArrayList;


/**
 * InsertionPointList
 */
public class InsertionPointList<T> {

    private int insertionPoint;
    private ArrayList<T> list = new ArrayList<>();

    /**
     * @param insertionPoint the insertionPoint to set
     */
    public void setInsertionPoint(int insertionPoint) {
        if (insertionPoint > list.size()) {
            insertionPoint = list.size();
        }
        this.insertionPoint = insertionPoint;
    }

    /**
     * @return the insertionPoint
     */
    public int getInsertionPoint() {
        return insertionPoint;
    }

    public void addElt(T elt) {
        list.add(insertionPoint, elt);
    }

    public void copy(int fromIndex, int toIndex) {
        list.add(toIndex, list.get(fromIndex));
    }

    public void removeElt(int index) {
        list.remove(index);
    }

    public T get(int index) {
        return list.get(index);
    }

    public int size() {
        return list.size();
    }

}