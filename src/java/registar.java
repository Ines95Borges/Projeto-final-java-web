
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/registar"})
public class registar extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
  }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
    PrintWriter out = response.getWriter();
    
    String name = request.getParameter("username");
    String pwd = request.getParameter("password");
    try{
      Conexao objCon = new Conexao();
      objCon.abreConexao();
      
      MessageDigest md = MessageDigest.getInstance("SHA-256");
      byte []messageDigest = md.digest(pwd.getBytes("UTF-8"));
      
      StringBuilder sb = new StringBuilder();
      
      for(byte b : messageDigest){
        sb.append(String.format("%02x", 0xFF & b));
      }
      
      pwd = sb.toString();
      
      PreparedStatement ps = objCon.conn.prepareStatement("INSERT INTO clientes(id, nome, pwd) VALUES (?,?,?)");
      ps.setString(1, null);
      ps.setString(2, name);
      ps.setString(3, pwd);
      
      int i = ps.executeUpdate();
      
      if(i>0){
        request.setAttribute("entrou", "entrou");
        request.getRequestDispatcher("loja.jsp").forward(request, response);
      }
      
    }catch(Exception e){
      out.print(e);
    }
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
