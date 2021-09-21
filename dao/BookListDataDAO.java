package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.AddBookLogic;
import model.BookData;
import model.MyShelf;

public class BookListDataDAO {
 // データベース接続に使用する情報
    private final String JDBC_URL = "jdbc:mysql://localhost:3306/ex13151619";
    private final String DB_USER = "user13151619";
    private final String DB_PASS = "user13151619pass";

    public Connection getConnection() {
        try {

            // JDBCドライバのクラスをロード
            // 記述する場合は。catch文にClassNotFoundExceptionを追加する
            Class.forName("com.mysql.cj.jdbc.Driver");
            // データベースに接続し、接続を表すConnectionオブジェクトを取得
            Connection con = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
            return con;
        } catch (SQLException | ClassNotFoundException e) {
            throw new IllegalStateException(e);
        }
    }

    public List<BookData> findAbstract(String id,String keyword) {

    	//オブジェクトの生成
    	BookData myBook = new BookData();
    	MyShelf myShelf = new MyShelf();
    	AddBookLogic addBookLogic = new AddBookLogic();
    	List<BookData> myBookList = new ArrayList<>();

    	try (

    		// データベースに接続し、接続を表すConnectionオブジェクトを取得
    		Connection con = getConnection();

    		// ResuleSetオブジェクトを取得
    		PreparedStatement pStmt = con.prepareStatement("SELECT * FROM booklist WHERE userid =? AND CONCAT(title, authors, description) like ?")){

    		pStmt.setString(1,id);
    		pStmt.setString(2,"%"+keyword+"%");
//            pStmt.setString(1,isbn3);

    		// SELECT文を実行し、ResuleSetオブジェクトを取得
    		ResultSet rs = pStmt.executeQuery();

    		// ResuleSetオブジェクトの全レコードを表示
    		while (rs.next()) {
    			// 取得したレコードを変数に代入
    			String isbn = rs.getString("isbn");
    			String imglink = rs.getString("imglink");
    			String title = rs.getString("title");
    			String authors = rs.getString("authors");
    			String publisher = rs.getString("publisher");
    			String publishedDate = rs.getString("publishdate");
    			String price = rs.getString("price");
    			String description = rs.getString("description");
    			String checklist = rs.getString("checklist");
    			// 取得した値をコンストラクターで設定
    			myBook = new BookData(isbn, imglink,title,authors,publisher,publishedDate,price,description,checklist);
    			//データをリストに追加
    			myBookList = addBookLogic.execute(myBook, myShelf);

    		}
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return null;
    	}
    	return myBookList;
    }

    public List<BookData> findOne(String id,String isbn3) {

    	//オブジェクトの生成
    	BookData myBook = new BookData();
        MyShelf myShelf = new MyShelf();
        AddBookLogic addBookLogic = new AddBookLogic();
        List<BookData> myBookList = new ArrayList<>();

        try (

            // データベースに接続し、接続を表すConnectionオブジェクトを取得
            Connection con = getConnection();

            //  PreparedStatementオブジェクトを取得
            PreparedStatement pStmt = con.prepareStatement("SELECT * FROM booklist WHERE userid =? AND isbn = ?")){

            pStmt.setString(1,id);
            pStmt.setString(2,isbn3);

            // SELECT文を実行し、ResuleSetオブジェクトを取得
            ResultSet rs = pStmt.executeQuery();

            // ResuleSetオブジェクトの全レコードを表示
            while (rs.next()) {
                // 取得したレコードを変数に代入
                String isbn = rs.getString("isbn");
                String imglink = rs.getString("imglink");
                String title = rs.getString("title");
                String authors = rs.getString("authors");
                String publisher = rs.getString("publisher");
                String publishedDate = rs.getString("publishdate");
                String price = rs.getString("price");
                String description = rs.getString("description");
                String checklist = rs.getString("checklist");
                // 取得した値をコンストラクターで設定
                myBook = new BookData(isbn, imglink,title,authors,publisher,publishedDate,price,description,checklist);
                //データをリストに追加
                myBookList = addBookLogic.execute(myBook, myShelf);

            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return myBookList;
    }
    public List<BookData> findFlag(String id,String checklist2) {

    	//オブジェクトの生成
    	BookData myBook = new BookData();
    	MyShelf myShelf = new MyShelf();
    	AddBookLogic addBookLogic = new AddBookLogic();
    	List<BookData> myBookList = new ArrayList<>();

    	try(

    		// データベースに接続し、接続を表すConnectionオブジェクトを取得
    		Connection con = getConnection();

    		//  PreparedStatementオブジェクトを取得
    		PreparedStatement pStmt = con.prepareStatement("SELECT * FROM booklist WHERE userid =? AND checklist = ?")){

    		pStmt.setString(1,id);
    		pStmt.setString(2,checklist2);
//            pStmt.setString(1,isbn3);

    		// SELECT文を実行し、ResuleSetオブジェクトを取得
    		ResultSet rs = pStmt.executeQuery();

    		// ResuleSetオブジェクトの全レコードを表示
    		while (rs.next()) {
    			// 取得したレコードを変数に代入
    			String isbn = rs.getString("isbn");
    			String imglink = rs.getString("imglink");
    			String title = rs.getString("title");
    			String authors = rs.getString("authors");
    			String publisher = rs.getString("publisher");
    			String publishedDate = rs.getString("publishdate");
    			String price = rs.getString("price");
    			String description = rs.getString("description");
    			String checklist = rs.getString("checklist");
    			// 取得した値をコンストラクターで設定
    			myBook = new BookData(isbn, imglink,title,authors,publisher,publishedDate,price,description,checklist);
    			//データをリストに追加
    			myBookList = addBookLogic.execute(myBook, myShelf);

    		}
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return null;
    	}
    	return myBookList;
    }
    public List<BookData> findAll(String id) {
        System.out.println(id);

        //オブジェクトの生成
        BookData myBook = new BookData();
        MyShelf myShelf = new MyShelf();
        AddBookLogic addBookLogic = new AddBookLogic();
        List<BookData> myBookList = new ArrayList<>();

        try (

            // データベースに接続し、接続を表すConnectionオブジェクトを取得
            Connection con = getConnection();

            // PreparedStatementオブジェクトを取得
            PreparedStatement pStmt = con.prepareStatement("SELECT * FROM booklist WHERE userid =?")){

            pStmt.setString(1,id);

            // SELECT文を実行し、ResuleSetオブジェクトを取得
            ResultSet rs = pStmt.executeQuery();

            // ResuleSetオブジェクトの全レコードを表示
            while (rs.next()) {
                // 取得したレコードを変数に代入
                String isbn = rs.getString("isbn");
                String imglink = rs.getString("imglink");
                String title = rs.getString("title");
                String authors = rs.getString("authors");
                String publisher = rs.getString("publisher");
                String publishedDate = rs.getString("publishdate");
                String price = rs.getString("price");
                String description = rs.getString("description");
                String checklist = rs.getString("checklist");
                // 取得した値をコンストラクターで設定
                myBook = new BookData(isbn, imglink,title,authors,publisher,publishedDate,price,description,checklist);
                //データをリストに追加
                myBookList = addBookLogic.execute(myBook, myShelf);

            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return myBookList;
    }

    public void addBook(String userid, String isbn, String imglink, String title, String authors, String publisher, String publishdate, String description, String price, String checklist) {

        try (
                // データベースに接続し、接続を表すConnectionオブジェクトを取得
                Connection con = getConnection();

                // PreparedStatementオブジェクトを取得
                PreparedStatement st = con.prepareStatement("INSERT INTO booklist VALUES(?,?,?,?,?,?,?,?,?,?)")){

            // プレースホルダ(?)に値をセット
            st.setString(1, userid);
            st.setString(2, isbn);
            st.setString(3, imglink);
            st.setString(4, title);
            st.setString(5, authors);
            st.setString(6, publisher);
            st.setString(7, publishdate);
            st.setString(8, price);
            st.setString(9,description);
            st.setString(10,checklist);

            // SQL文を実行
            st.executeUpdate();

        } catch (SQLException e) {

        }

    }

    public void deleteBook(String userid, String isbn) {
        try (

            // データベースに接続し、接続を表すConnectionオブジェクトを取得
            Connection con = getConnection();

            // 更新用SQL文を準備
            PreparedStatement st = con.prepareStatement(
                    "DELETE FROM booklist WHERE userid =? AND isbn=?")){

             st.setString(1,userid);
             st.setString(2,isbn);
             System.out.println(userid);
             System.out.println(isbn);

             // SELECT文を実行
            st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }
    }
    public void updateBook(String userid, String isbn, String imglink, String title, String authors, String publisher, String publishdate, String description, String price, String checklist) {
        try (

                // データベースに接続し、接続を表すConnectionオブジェクトを取得
                Connection con = getConnection();

                // SQL文を準備
                PreparedStatement st = con.prepareStatement(
                        "UPDATE booklist"
                        + " SET imglink = ?, title = ?,authors = ?,publisher = ?,"
                        + " publishdate = ?,price = ?,description = ?,checklist = ?"
                        + " WHERE userid = ? AND isbn= ? ")){

            st.setString(1,imglink);
            st.setString(2,title);
            st.setString(3,authors);
            st.setString(4,publisher);
            st.setString(5,publishdate);
            st.setString(6,price);
            st.setString(7,description);
            st.setString(8,checklist);
            st.setString(9,userid);
            st.setString(10,isbn);
            System.out.println(userid);
            System.out.println(isbn);

            // SELECT文を実行
            st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }
    }

}

