package com.project.ecommerce.dao;

import com.project.ecommerce.model.DBConnect;
import com.project.ecommerce.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;



public class ProductDAO {
	public static void main(String[] args) {
		String aString="cuộc đời là những niềm đau";
		String textSearch="cuôc";
		if(removeAccent(aString).toUpperCase().contains(removeAccent(textSearch).toUpperCase())){
			System.out.print(removeAccent(aString));
			
		}
		else {
			System.out.print("loi");
		}
	}
	public static List<Product> listAllProduct() throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		List<Product> listProduct = new ArrayList<>();
		Date d=new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		String sqlString = String.format(" select *from Product ");

		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			Product product = new Product(rSet.getString("id"),rSet.getString("name"),rSet.getInt("price"),rSet.getInt("quantity"),rSet.getString("image"),rSet.getString("description"),rSet.getInt("new"),rSet.getInt("brandID"));
			listProduct.add(product);
		}
	return listProduct;
	}

	public static List<Product> listProductbyCategoryBrand(int cateID) throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		List<Product> listProduct = new ArrayList<>();
		Date d=new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		String sqlString = String.format("Select  P.ID, P.name, P.price, P.quantity, P.image,P.description, P.new, P.brandID  \r\n" +
				"   from Product as P left join Brand as B on P.brandID = B.ID left join Category as C on B.cateID = C.ID \r\n" +
				"   Where C.ID =" +cateID);

		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			Product product = new Product(rSet.getString("id"),rSet.getString("name"),rSet.getInt("price"),rSet.getInt("quantity"),rSet.getString("image"),rSet.getString("description"),rSet.getInt("new"),rSet.getInt("brandID"));
			listProduct.add(product);
		}
		return listProduct;
	}

	public static List<Product> listProductbyCategory(int cateID) throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		List<Product> listProduct = new ArrayList<>();
		Date d=new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		String sqlString = String.format(" select  A.ID, A.name, A.price, A.quantity, A.image,A.description, A.new, B.percent_promotion, A.brandID from Promotion as C join Promotion_detail as B on \r\n" + 
				"C.id = B.promotionID right outer join Product as A on B.productID = A.ID and C.dateStart<= '"+date+"' and C.dateEnd>= '"+date+"'\r\n" + 
				"right outer join Brand as D on D.ID = A.brandID right outer join Category as E on E.ID= D.cateID\r\n" + 
		"where E.ID ="+cateID);

		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			Product product = new Product(rSet.getString("id"),rSet.getString("name"),rSet.getInt("price"),rSet.getInt("quantity"),rSet.getString("image"),rSet.getString("description"),rSet.getInt("new"),rSet.getInt("percent_promotion"),rSet.getInt("brandID"));
			listProduct.add(product);
		}
	return listProduct;
	}
	public static List<Product> listProductbyPromotion() throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		List<Product> listProduct = new ArrayList<>();
		Date d=new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		String sqlString = String.format("select a.ID, a.name, a.price, a.quantity, a.image,a.description, a.new, a.brandID, b.percent_promotion \r\n" + 
				"from Product a inner join (select * from Promotion_detail where promotionID in \r\n" + 
				"(select id from Promotion where dateStart <= '"+date+"' and dateEnd >= '"+date+"' )) b on a.id = b.productid");
	
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			Product product = new Product(rSet.getString("id"),rSet.getString("name"),rSet.getInt("price"),rSet.getInt("quantity"),rSet.getString("image"),rSet.getString("description"),rSet.getInt("new"),rSet.getInt("percent_promotion"),rSet.getInt("brandID"));
			listProduct.add(product);
		}
	return listProduct;
	}
	public static List<Product> listProductbyPromotionCate(int idCate) throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		List<Product> listProduct = new ArrayList<>();
		Date d=new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		String sqlString = String.format("select a.ID, a.name, a.price, a.quantity, a.image,a.description, a.new, a.brandID, b.percent_promotion \r\n" + 
				"from Product a inner join (select * from Promotion_detail where promotionID in \r\n" + 
				"(select id from Promotion where dateStart <= '"+date+"' and dateEnd >= '"+date+"' )) b on a.id = b.productid\r\n" + 
				" inner join (select *from Brand where cateID in ( select id from Category where cateID="+idCate+")) c on c.ID = a.brandID");
	
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			Product product = new Product(rSet.getString("id"),rSet.getString("name"),rSet.getInt("price"),rSet.getInt("quantity"),rSet.getString("image"),rSet.getString("description"),rSet.getInt("new"),rSet.getInt("percent_promotion"),rSet.getInt("brandID"));
			listProduct.add(product);
		}
	return listProduct;
	}
	public static List<Product> listProductbyBrand(int brandID) throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		List<Product> listProduct = new ArrayList<>();
		Date d=new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		String sqlString = String.format("select a.ID, a.name, a.price, a.quantity, a.image,a.description, a.new, a.brandID, b.percent_promotion \r\n" + 
				"from Product a left join (select * from Promotion_detail where promotionID in \r\n" + 
				"(select id from Promotion where dateStart <= '"+date+"' and dateEnd >= '"+date+"' )) b on a.id = b.productid\r\n" + 
				"where a.brandID in (select id from Brand where id="+brandID+")");
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
	
			Product product = new Product(rSet.getString("id"),rSet.getString("name"),rSet.getInt("price"),rSet.getInt("quantity"),rSet.getString("image"),rSet.getString("description"),rSet.getInt("new"),rSet.getInt("percent_promotion"),rSet.getInt("brandID"));
			listProduct.add(product);
		}
	return listProduct;
	}
	public static Product productbyID(String ID) throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		Product product= new Product();
		Date d=new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		String sqlString = String.format("select a.ID, a.name, a.price, a.quantity, a.image,a.description, a.new, a.brandID, b.percent_promotion \r\n" + 
				"from Product a left join (select * from Promotion_detail where promotionID in \r\n" + 
				"(select id from Promotion where dateStart <= '"+date+"' and dateEnd >= '"+date+"' )) b on a.id = b.productid\r\n" + 
				"where a.ID='"+ID+"'");
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			 product = new Product(rSet.getString("id"),rSet.getString("name"),rSet.getInt("price"),rSet.getInt("quantity"),rSet.getString("image"),rSet.getString("description"),rSet.getInt("new"),rSet.getInt("percent_promotion"),rSet.getInt("brandID"));
			
		}
	return product;
	}
	public static List<Product> listProductNew() throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		List<Product> listProduct = new ArrayList<>();
		Date d=new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		String sqlString = String.format("select a.ID, a.name, a.price, a.quantity, a.image,a.description, a.new, a.brandID, b.percent_promotion \r\n" + 
				"from Product a left join (select * from Promotion_detail where promotionID in \r\n" + 
				"(select id from Promotion where dateStart <= '"+date+"' and dateEnd >= '"+date+"' )) b on a.id = b.productid\r\n" + 
				"where a.new=1");
	
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			Product product = new Product(rSet.getString("id"),rSet.getString("name"),rSet.getInt("price"),rSet.getInt("quantity"),rSet.getString("image"),rSet.getString("description"),rSet.getInt("new"),rSet.getInt("percent_promotion"),rSet.getInt("brandID"));
			listProduct.add(product);
		}
	return listProduct;
	}
	public static List<Product> listProductNewCate(int cateID) throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		List<Product> listProduct = new ArrayList<>();
		Date d=new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		String sqlString = String.format("select a.ID, a.name, a.price, a.quantity, a.image,a.description, a.new, a.brandID, b.percent_promotion \r\n" + 
				"from Product a left join (select * from Promotion_detail where promotionID in \r\n" + 
				"(select id from Promotion where dateStart <= '"+date+"' and dateEnd >= '"+date+"' )) b on a.id = b.productid\r\n" + 
				" inner join (select *from Brand where cateID in ( select id from Category where cateID="+cateID+")) c on c.ID = a.brandID\r\n" + 
				" where a.new=1");
	
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			Product product = new Product(rSet.getString("id"),rSet.getString("name"),rSet.getInt("price"),rSet.getInt("quantity"),rSet.getString("image"),rSet.getString("description"),rSet.getInt("new"),rSet.getInt("percent_promotion"),rSet.getInt("brandID"));
			listProduct.add(product);
		}
	return listProduct;
	}
	public static List<Product> listProductSpecial() throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		List<Product> listProduct = new ArrayList<>();
		Date d=new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		String sqlString = String.format(" select A.ID, A.name, A.price, A.quantity, A.image,A.description, A.new, B.percent_promotion, A.brandID from Promotion as C join Promotion_detail as B on \r\n" + 
				"C.id = B.promotionID right outer join Product as A on B.productID = A.ID and C.dateStart<= '"
				+ date+"' and C.dateEnd>= '"+date+"'where A.new =1 and B.percent_promotion is not null");
	
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			Product product = new Product(rSet.getString("id"),rSet.getString("name"),rSet.getInt("price"),rSet.getInt("quantity"),rSet.getString("image"),rSet.getString("description"),rSet.getInt("new"),rSet.getInt("percent_promotion"),rSet.getInt("brandID"));
			listProduct.add(product);
		}
	return listProduct;
	}
	public static  String removeAccent(String s) {
		  String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
		  Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		  return pattern.matcher(temp).replaceAll("").replaceAll("đ", "d").replaceAll("Đ", "d");
		 }
	public static List<Product> listProductbySearch(String textSearch) throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		List<Product> listProduct = new ArrayList<>();
		//String ss = "%"+textSearch+"%";
		Date d=new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		String sqlString = String.format("select a.ID, a.name, a.price, a.quantity, a.image,a.description, a.new, a.brandID, b.percent_promotion \r\n" + 
				"from Product a left join (select * from Promotion_detail where promotionID in \r\n" + 
				"(select id from Promotion where dateStart <= '"+date+"' and dateEnd >= '"+date+"' )) b on a.id = b.productid");
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
	
			Product product = new Product(rSet.getString("id"),rSet.getString("name"),rSet.getInt("price"),rSet.getInt("quantity"),rSet.getString("image"),rSet.getString("description"),rSet.getInt("new"),rSet.getInt("percent_promotion"),rSet.getInt("brandID"));
			if(removeAccent(rSet.getString("name")).toUpperCase().contains(removeAccent(textSearch).toUpperCase())){
				listProduct.add(product);
			}
			
		}
	return listProduct;
	}
	public void updateQuantityProduct(String idProduct,int quantity) throws SQLException {
		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		String sql=String.format("update product set quantity=quantity-"+quantity+" where id ='"+idProduct+"'");
		int result= stm.executeUpdate(sql);
		
	}
	public int updateProduct(String idProduct, int price, String name, String description) throws SQLException {
		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		String sql= String.format("select *from Product where name=N'"+name+"' and id!='"+idProduct+"'");
		ResultSet resultSet= stm.executeQuery(sql);
		while(resultSet.next()) {
			return 1;
		}
		String sqlString= String.format("update product set price="+price+", name= N'"+name+"', description= N'"+description+"' where id= '"+idProduct+"'");
		int result= stm.executeUpdate(sqlString);
		if(result>0) {
			return 0;
		}
		return 2;
		
	}
	public int insertProduct(String idProduct, String nameProduct, int priceProduct, int quantityProduct,String imageProduct, String descriptionProduct, int brandProduct)  throws SQLException {
		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		String sql1= String.format("select * from Product where id='"+idProduct+"'");
		ResultSet resultSet1=stm.executeQuery(sql1);
		while(resultSet1.next()) {
			return 1;
		}
		String sql= String.format("select *from Product where name=N'"+nameProduct+"' and id!='"+idProduct+"' and brandID="+brandProduct);
		ResultSet resultSet= stm.executeQuery(sql);
		while(resultSet.next()) {
			return 2;
		}
		String sqlString= String.format("insert into dbo.Product(ID,name,price,quantity,image,description,new,brandID) "
				+ "values(N'"+idProduct+"', N'"+nameProduct+"',"+priceProduct+", "+quantityProduct+" , N'"+imageProduct+"', N'"+descriptionProduct+"', 1 , "+brandProduct+")");
		int result= stm.executeUpdate(sqlString);
		if(result>0) {
			return 0;
		}
		return 3;
		
	}
	public int addOldProduct(String idProduct, int quantityProduct) throws SQLException {
		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		String sqlString= String.format("update product set quantity=quantity+"+quantityProduct+" where id= '"+idProduct+"'");
		int result= stm.executeUpdate(sqlString);
		if(result>0) {
			return 0;
		}
		return 1;
		
	}
	public int deleteProduct(String idProduct) throws SQLException {
		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		String sqlString= String.format("delete from product where id= '"+idProduct+"'");
		int result= stm.executeUpdate(sqlString);
		if(result>0) {
			return 0;
		}
		return 2;
		
	}
	public static Product productbyGoodReceiptDetail(int ID) throws SQLException {

		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		Product product= new Product();
		String sqlString = String.format("select *  from Product b where b.ID in (select ProductID from Seri where GoodReceipt_detailID="+ID+")");
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			 product = new Product(rSet.getString("id"),rSet.getString("name"),rSet.getInt("price"),rSet.getInt("quantity"),rSet.getString("image"),rSet.getString("description"),rSet.getInt("new"),rSet.getInt("brandID"));
			
		}
	return product;
	}
	public int countProductinSeri(String id) throws SQLException {
		DBConnect dBconnect=new DBConnect();
		Statement stm = dBconnect.getConnection().createStatement();
		String sqlString = String.format("select count(*) as count from seri where ProductID=N'"+id+"'");
		ResultSet rSet = stm.executeQuery(sqlString);
		int count=0;
		while (rSet.next()) {
			 count= rSet.getInt("count");
		} 
		return count;
	}
}
