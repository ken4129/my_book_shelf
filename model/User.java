package model;

import java.io.Serializable;

public class User implements Serializable{

    String id ;
    int pass;
    String name;

    public User() {}

    public User(String id,int pass,String name) {
        this.id = id;
        this.pass = pass;
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getPass() {
        return pass;
    }

    public void setPass(int pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
