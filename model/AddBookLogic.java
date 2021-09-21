package model;

import java.util.ArrayList;
import java.util.List;

public class AddBookLogic {
	public List<BookData> execute(BookData myBook,MyShelf myShelf) {
		//本をリストに追加
		myShelf.setMyBooksList(myBook);
		//追加した本を返す
		List<BookData> myBookList = new ArrayList<BookData>();
		myBookList = myShelf.getMyBooksList();
		return myBookList;
	}

}
