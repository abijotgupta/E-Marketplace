package com.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.bean.ProductBean;
import com.bean.DemandBean;
import com.utility.DBUtil;
import com.utility.IDUtil;
import com.utility.MailMessage;

public class ProductDaoImpl implements ProductDao{

	
	
	@Override
	public String addProduct(String prodTitle, String prodmetaTitle, String prodSlug,String prodSummary, double prodPrice, int prodDiscount, 
			int prodQuantity, String prodShop, InputStream prodImage)
	{
		String status = null;
		String prodId = IDUtil.generateId();
		
		ProductBean product = new ProductBean(prodId, prodTitle, prodmetaTitle, prodSlug, prodSummary, prodPrice, prodDiscount, prodQuantity, prodShop, prodImage);
		
	
		status = addProduct(product);
		
		return status;
	}
	
	
	

	@Override
	public String addProduct(ProductBean product) {
		String status = "Product Registration Failed!";
	
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement("insert into product values(?,?,?,?,?,?,?,?,?,?);");
			ps.setString(1, product.getProdId());
			ps.setString(2, product.getProdTitle());
			ps.setString(3, product.getProdmetaTitle());
			ps.setString(4, product.getProdSlug());
			ps.setString(5, product.getProdSummary());
			ps.setDouble(6, product.getProdPrice());
			ps.setInt(7, product.getProdDiscount());
			ps.setInt(8, product.getProdQuantity());
			ps.setString(9,product.getProdShop());
			
			 if (product.getProdImage() != null) {	              
				 ps.setBlob(10, product.getProdImage());
	         }
			
			
			int k = ps.executeUpdate();
			
			if(k>0) {
			
				status = "Product Added Successfully with Product Id: "+product.getProdId(); 

			}
			else {
				
				status = "Product Updation Failed!";
			}
			
		} catch (SQLException e) {
			status = "Error: "+e.getMessage();
			e.printStackTrace();
		}	
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		
		return status;
	}
	
	
	
	

	@Override
	public String removeProduct(String prodId) {
		String status = "Product Removal Failed!";
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		
		try {
			ps = con.prepareStatement("delete from product where id=?");
			ps.setString(1, prodId);
			
			int k = ps.executeUpdate();
			
			if(k>0) {
				status = "Product Removed Successfully!";
			
				ps2 = con.prepareStatement("delete from usercart where productId=?");	
				ps2.setString(1, prodId);
				ps2.executeUpdate();
			
			}
			
		} catch (SQLException e) {
			status = "Error: "+e.getMessage();
			e.printStackTrace();
		}
	
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(ps2);
		
		return status;
	}
	
	

	@Override
	public String updateProduct(ProductBean prevProduct, ProductBean updatedProduct) {
		String status = "Product Updation Failed!";
		
		if(!prevProduct.getProdId().equals(updatedProduct.getProdId())) {
			
			status = "Both Products are Different, Updation Failed!";
			
			return status;
		}
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement("update product set title=?, summary=?, price=?, discount=?, quantity=?, image=? where id=?");
			
			ps.setString(1, updatedProduct.getProdTitle());
			ps.setString(2, updatedProduct.getProdSummary());
			ps.setDouble(3, updatedProduct.getProdPrice());
			ps.setInt(4, updatedProduct.getProdDiscount());
			ps.setInt(5, updatedProduct.getProdQuantity());
			ps.setBlob(6, updatedProduct.getProdImage());
			ps.setString(7, prevProduct.getProdId());
			
			int k = ps.executeUpdate();
			
			if(k>0)
				status = "Product Updated Successfully!";
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		
		return status;
	}
	
	

	@Override
	public String updateProductPrice(String prodId, double updatedPrice) {
		String status = "Price Updation Failed!";
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement("update product set price=? where id=?");
			
			ps.setDouble(1, updatedPrice);
			ps.setString(2, prodId);
			
			int k = ps.executeUpdate();
			
			if(k>0)
				status = "Price Updated Successfully!";
		} catch (SQLException e) {
			status = "Error: "+e.getMessage();
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		
		return status;
	}
	
	

	@Override
	public List<ProductBean> getAllProducts() {
		List<ProductBean> products = new ArrayList<ProductBean>();
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("select * from product");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				ProductBean product = new ProductBean();
				
				product.setProdId(rs.getString(1));
				product.setProdTitle(rs.getString(2));
				product.setProdmetaTitle(rs.getString(3));
				product.setProdSlug(rs.getString(4));
				product.setProdSummary(rs.getString(5));
				product.setProdPrice(rs.getDouble(6));
				product.setProdDiscount(rs.getInt(7));
				product.setProdQuantity(rs.getInt(8));
				product.setProdShop(rs.getString(9));
				product.setProdImage(rs.getAsciiStream(10));
				
				products.add(product);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);
		
		return products;
	}

	
	
	@Override
	public byte[] getImage(String prodId) {
		byte[] image = null;
		
		//byte image = null;
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("select image from product where id=?");
			
			ps.setString(1, prodId);
			
			rs = ps.executeQuery();
			
			if(rs.next())
				image = rs.getBytes("image");
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);
		
		return image;
	}

	
	
	@Override
	public ProductBean getProductDetails(String prodId) {
		ProductBean product = null;
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("select * from product where id=?");
			
			ps.setString(1, prodId);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				product = new ProductBean();
				product.setProdId(rs.getString(1));
				product.setProdTitle(rs.getString(2));
				product.setProdmetaTitle(rs.getString(3));
				product.setProdSlug(rs.getString(4));
				product.setProdSummary(rs.getString(5));
				product.setProdPrice(rs.getDouble(6));
				product.setProdDiscount(rs.getInt(7));
				product.setProdQuantity(rs.getInt(8));
				product.setProdShop(rs.getString(9));
				product.setProdImage(rs.getAsciiStream(10));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		
		return product;
	}

	@Override
	public String updateProductWithoutImage(String prevProductId, ProductBean updatedProduct) {
		String status = "Product Updation Failed!";
		
		if(!prevProductId.equals(updatedProduct.getProdId())) {
			
			status = "Both Products are Different, Updation Failed!";
			
			return status;
		}
		
		/*System.out.println("pId: "+updatedProduct.getProdId());
		System.out.println("pName: "+updatedProduct.getProdName());
		System.out.println("pType: "+updatedProduct.getProdType());
		System.out.println("pInfo: "+updatedProduct.getProdInfo());
		System.out.println("pPrice: "+updatedProduct.getProdPrice());
		System.out.println("pQuantity: "+updatedProduct.getProdQuantity());*/
		
		int prevQuantity = new ProductDaoImpl().getProductQuantity(prevProductId);
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		
		try {
			
			ps = con.prepareStatement("update product set title=?, summary=?, price=?, discount=?, quantity=?  where id=?");
			
			
			ps.setString(1, updatedProduct.getProdTitle());
			ps.setString(2, updatedProduct.getProdSummary());
			ps.setDouble(3, updatedProduct.getProdPrice());
			ps.setInt(4, updatedProduct.getProdDiscount());
			ps.setInt(5, updatedProduct.getProdQuantity());
			ps.setString(6, prevProductId);
			
			
			int k = ps.executeUpdate();
			//System.out.println("prevQuantity: "+prevQuantity);
			if((k>0) && (prevQuantity < updatedProduct.getProdQuantity())) {
				status = "Product Updated Successfully!";
				//System.out.println("updated!");
				List<DemandBean> demandList = new DemandDaoImpl().haveDemanded(prevProductId);
				
				for(DemandBean demand : demandList) {
					
					String userFName = new UserDaoImpl().getFName(demand.getUserName());
					
					MailMessage.productAvailableNow(demand.getUserName(), userFName, updatedProduct.getProdTitle(), prevProductId);
					
					boolean flag = new DemandDaoImpl().removeProduct(demand.getUserName(), prevProductId);
					
					if(flag)
						status += " And Mail Send to the customers who were waiting for this product!";
				}
			}
			else if(k>0)
				status = "Product Updated Successfully!";
			else
				status = "Product Not available in the store!";
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		//System.out.println("Prod Update status : "+status);
		
		return status;
	}

	@Override
	public double getProductPrice(String prodId) {
		double price = 0;
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("select * from product where id=?");
			
			ps.setString(1, prodId);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				price = rs.getDouble("pprice");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		
		return price;
	}

	@Override
	public boolean sellNProduct(String prodId,int n) {
		boolean flag = false;
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		
		try {
			
			ps = con.prepareStatement("update product set quantity=(quantity - ?) where id=?");
			
			ps.setInt(1, n);
			
			ps.setString(2, prodId);
			
			int k = ps.executeUpdate();
			
			if(k>0)
				flag = true;
		} catch (SQLException e) {
			flag = false;
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		
		return flag;
	}

	@Override
	public int getProductQuantity(String prodId) {
		
		int quantity=0;
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("select * from product where id=?");
			
			ps.setString(1, prodId);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				quantity = rs.getInt("pquantity");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		
		return quantity;
	}

}
