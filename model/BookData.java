package model;

import java.io.Serializable;

public class BookData implements Serializable{
        //フィールド変数
        String isbn ;
        String imglink; //画像
        String title;
        String authors; //著者名
        String publisher;//出版社
        String publishedDate;//出版日
        String description;//説明
        String purchasedate;//購入日
        String price;//価格
        String checklist;//書籍状態

        //空のコンストラクタ
        public BookData() {
        }
        //引数8のコンストラクタ 検索結果保存用
        public BookData(String isbn,String imglink,String title, String authors, String publisher, String publishedDate, String price,String description) {
            this.isbn= isbn;
            this.imglink= imglink;
            this.title = title;
            this.authors = authors;
            this.publisher = publisher;
            this.publishedDate = publishedDate;
            this.price = price;
            this.description = description;
        }
        //引数9のコンストラクタ
        public BookData(String isbn, String imglink, String title, String authors, String publisher, String publishedDate, String price, String description, String checklist) {

            this.isbn = isbn;
            this.imglink = imglink;
            this.title = title;
            this.authors = authors;
            this.publisher = publisher;
            this.publishedDate = publishedDate;
            this.price = price;
            this.description = description;
            this.checklist = checklist;
        }

//        public BookData(String imglink, String title, String authors, String publisher, String publishedDate,
//				String price, String description,String checklist) {
//            this.imglink = imglink;
//            this.title = title;
//            this.authors = authors;
//            this.publisher = publisher;
//            this.publishedDate = publishedDate;
//            this.price = price;
//            this.description = description;
//            this.checklist = checklist;
//		}
        //各セッター＆ゲッター
        public String getPrice() {
            return price;
        }

        public void setPrice(String price) {
            this.price = price;
        }

		public String getIsbn() {
            return isbn;
        }

        public void setIsbn(String isbn) {
            this.isbn = isbn;
        }


        public String getImglink() {
            return imglink;
        }


        public void setImglinlk(String imglinlk) {
            this.imglink = imglinlk;
        }


        public String getTitle() {
            return title;
        }


        public void setTitle(String title) {
            this.title = title;
        }


        public String getAuthors() {
            return authors;
        }


        public void setAuthors(String authors) {
            this.authors = authors;
        }


        public String getPublisher() {
            return publisher;
        }


        public void setPublisher(String publisher) {
            this.publisher = publisher;
        }


        public String getPublishedDate() {
            return publishedDate;
        }


        public void setPublisheddate(String publishedDate) {
            this.publishedDate = publishedDate;
        }


        public String getDescription() {
            return description;
        }


        public void setDescription(String description) {
            this.description = description;
        }


        public String getPurchasedate() {
            return purchasedate;
        }


        public void setPurchasedate(String purchasedate) {
            this.purchasedate = purchasedate;
        }


        public String getChecklist() {
            return checklist;
        }


        public void setChecklist(String checklist) {
            this.checklist = checklist;
        }


}
