package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDAO;
import model.LoginLogic;
import model.LoginUser;
import model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    // 新規登録へ
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 文字のエンコーディング
        // 処理の分岐で使うactionをリクエストパラメータから取得
        // セッションスコープの使用宣言
        request.setCharacterEncoding("UTF-8");
        String forwardPath = null;
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        // DAOに接続
        LoginDAO dao = new LoginDAO();

        // actionでログインと新規に分岐
        switch (action) {

        // ユーザー削除処理
        case "3":

            // セッションスコープセッションスコープから取得
            LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");

            // 削除処理
            dao.deleteUser(loginUser);
            System.out.println("デリートメソッド呼び出し成功");

            // セッションスコープを破棄
            session.invalidate();

            // Top画面にフォワード
            forwardPath = "/index.html";
            request.getRequestDispatcher(forwardPath).forward(request, response);

            break;

        default:

            // 新規登録画面にフォワード
            forwardPath = "/WEB-INF/jsp/register.jsp";
            request.getRequestDispatcher(forwardPath).forward(request, response);

        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // NULLチェックが未作業なので追加

        // 文字のエンコーディング
        // 処理の分岐で使うactionをリクエストパラメータから取得
        // セッションスコープの使用宣言
        request.setCharacterEncoding("UTF-8");
        String forwardPath = null;
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        // リクエストパラメータ取得
        String id = request.getParameter("id");
        int pass = Integer.parseInt(request.getParameter("pass"));
        String name = request.getParameter("name");

        // 取得した情報をuserに入れる
        User user = new User(id, pass, name);

        // DAOに接続
        LoginDAO dao = new LoginDAO();

        // actionでログインと新規に分岐
        switch (action) {

        // ログイン処理
        case "1":

            // ログイン実行
            LoginLogic login = new LoginLogic();
            boolean result = login.execute(user);

            LoginUser loginUser = dao.findLogin(user);

            // ログイン判定の結果
            if (result) {

                // 成功
                // sessionスコープに保存
                session.setAttribute("loginUser", loginUser);

                // メイン画面にフォワード
                forwardPath = "/WEB-INF/jsp/main.jsp";
                request.getRequestDispatcher(forwardPath).forward(request, response);

            } else {

                // 失敗したらエラーページにフォワード
                request.getRequestDispatcher("WEB-INF/jsp/loginError.jsp").forward(request, response);
            }

            break;

        // 新規登録処理
        case "2":

            // DAOのメソッドで判定して新規登録
            String nu = dao.serchNum(user);
            LoginUser lu = dao.Register(user);

            // 画面にフォワード
            if (nu != null) {

                // エラー画面にフォワード
                forwardPath = "/WEB-INF/jsp/registerError.jsp";
                request.getRequestDispatcher(forwardPath).forward(request, response);
            } else {

                // メイン画面にフォワード
                // sessionスコープに保存
                loginUser = dao.findLogin(user);
                session.setAttribute("loginUser", loginUser);
                forwardPath = "/WEB-INF/jsp/main.jsp";
                request.getRequestDispatcher(forwardPath).forward(request, response);
            }

            break;

        // ユーザー削除処理
        case "3":

            // 削除画面にフォワード
            forwardPath = "/WEB-INF/jsp/deleteUser.jsp";
            request.getRequestDispatcher(forwardPath).forward(request, response);

            break;

        }
    }

}
