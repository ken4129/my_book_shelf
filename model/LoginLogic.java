package model;

import dao.LoginDAO;

public class LoginLogic {
     public boolean execute(User user) {
          LoginDAO dao = new LoginDAO();
          LoginUser loginUser = dao.findLogin(user);
          return loginUser != null;
     }
}
