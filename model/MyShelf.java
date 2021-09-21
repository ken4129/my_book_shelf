package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class MyShelf implements Serializable{
    List<BookData> myBooksList = new ArrayList<>();

    public MyShelf() {
    }

    public MyShelf(MyShelf myShelf) {

    }

    public List<BookData> getMyBooksList() {
        return myBooksList;
    }

    public void setMyBooksList(BookData myBook) {
        myBooksList.add(myBook);
    }



}
