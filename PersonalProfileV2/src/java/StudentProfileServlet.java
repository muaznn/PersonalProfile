import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import profile.bean.ProfileBean;


public class StudentProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
   
            String name = request.getParameter("name");
            String studentId = request.getParameter("studentId");
            String program = request.getParameter("program");
            String email = request.getParameter("email");
            String hobby = request.getParameter("hobby");
            String intro = request.getParameter("intro");
            
            ProfileBean pb = new ProfileBean(name, studentId, program, email, hobby, intro);

            try  {
            try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/StudentProfile", "app", "app")) {
                String query = "INSERT INTO PROFILE (name, studentId, program, email, hobby, intro) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt =  conn.prepareStatement (query);
                stmt.setString(1, pb.getName());
                stmt.setString(2, pb.getStudentId());
                stmt.setString(3, pb.getProgram());
                stmt.setString(4, pb.getEmail());
                stmt.setString(5, pb.getHobby());
                stmt.setString(6, pb.getIntro());
                stmt.executeUpdate();
            }
               } catch (SQLException e) {
                   e.printStackTrace();
               }
            
            request.setAttribute("student",pb);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
