import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CriaLogin {
  
  public boolean validaLogin(String nome, String password){
    
    boolean status = false;
    try{
      Conexao ObjCon = new Conexao();
      ObjCon.abreConexao();
      MessageDigest md = MessageDigest.getInstance("SHA-256");
      byte []messageDigest = md.digest(password.getBytes("UTF-8"));
      
      StringBuilder sb = new StringBuilder();
      
      for(byte b : messageDigest){
        sb.append(String.format("%02x", 0xFF & b));
      }
      
      password = sb.toString();
      
      PreparedStatement ps = ObjCon.conn.prepareStatement("SELECT * FROM clientes WHERE nome=? AND pwd=?;");
      ps.setString(1, nome);
      ps.setString(2, password);
      
      ResultSet rs = ps.executeQuery();
      status = rs.next();
      System.out.println(status);
      
      
    }catch(Exception e){
      System.out.println(e);
    }
    
    return status;
    
  }
  
}