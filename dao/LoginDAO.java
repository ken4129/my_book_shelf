package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.LoginUser;
import model.User;

public class LoginDAO {

     //データベース接続に使用する情報
     //接続情報書き直す
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

     public LoginUser findLogin(User user) {
         LoginUser loginUser = null;

         // データベースへ接続
         try (Connection con = getConnection()) {

             // SELECT文を準備
             String sql = "SELECT * FROM USER WHERE ID=? AND PASS=?";
             PreparedStatement ps = con.prepareStatement(sql);

             // プレースホルダに差し込む
             ps.setString(1, user.getId());
             ps.setInt(2, user.getPass());

             // オートコミットをオフ
             con.setAutoCommit(false);

             // 実行
             ResultSet rs = ps.executeQuery();

             // コミット
             con.commit();

             //検査結果を取得
             if (rs.next()) {
                 String id = rs.getString("ID");
                 int pass = rs.getInt("PASS");
                 String name = rs.getString("NAME");

                 loginUser = new LoginUser(id, pass, name);
             }

         } catch (SQLException e) {

          // 失敗した時の処理
             e.printStackTrace();
             return null;
         }

         // 結果を返す
         return loginUser;

     }

     // 新規登録処理
     public LoginUser Register(User user) {

         LoginUser loginUser = null;

         // データベースへ接続
         try (Connection con = getConnection()) {

             // SELECT文を準備
             String sql = "INSERT INTO  USER VALUES (?,?,?)";
             PreparedStatement ps = con.prepareStatement(sql);

             // プレースホルダー
             ps.setString(1, user.getId());
             ps.setInt(2, user.getPass());
             ps.setString(3, user.getName());

             // 実行
             ps.executeUpdate();

         } catch (SQLException e) {

             // 失敗した時の処理
             e.printStackTrace();
             return null;
         }

         // 結果を返す
         return loginUser;

     }

     public String serchNum(User user) {
         // LoginUser loginUser= null ;
         String msg = null;
         List<String> idShow = new ArrayList<>();

         // データベースへ接続
         try (Connection con = getConnection()) {

             // SELECT文を準備
             String sql = "SELECT *  FROM  USER ID";
             PreparedStatement ps = con.prepareStatement(sql);

             // 実行
             ResultSet answer = ps.executeQuery();

             //SQLで取得した全IDをリストに入れる
             while (answer.next()) {
                 idShow.add(answer.getString(1));
             }

             //取得したリストと入力されたIDを比較
             if (idShow.contains(user.getId())) {

                 //同じIDがあればエラーメッセージを返す
                 msg = "error!";
             }

         } catch (SQLException e) {

             //失敗した時の処理
             e.printStackTrace();
             return null;
         }

         //結果を返す
         return msg;

     }

     //ユーザー削除メソッド
     public void deleteUser(LoginUser loginUser) {
         try {
             System.out.println("デリートメソッド開始成功");
             // データベースに接続し、接続を表すConnectionオブジェクトを取得
             Connection con = getConnection();

             // SQL文を準備
             PreparedStatement st = con.prepareStatement("DELETE FROM user WHERE id =?");

              st.setString(1, loginUser.getId());
              String id = loginUser.getId();
              System.out.println(id);


              // SELECT文を実行
             st.executeUpdate();

         } catch (SQLException e) {
             e.printStackTrace();
             return;
         }
     }

     //本の削除メソッド
     public void deleteBook(LoginUser loginUser) {
         try {

             // データベースに接続し、接続を表すConnectionオブジェクトを取得
             Connection con = getConnection();

             // SQL文を準備
             PreparedStatement st = con.prepareStatement("DELETE FROM booklist WHERE userid =?");

              st.setString(1, loginUser.getId());

              // SELECT文を実行
             st.executeUpdate();

         } catch (SQLException e) {
             e.printStackTrace();
             return;
         }
     }
 }