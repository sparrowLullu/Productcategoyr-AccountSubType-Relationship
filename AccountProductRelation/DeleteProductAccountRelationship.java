/*
 * @author LS
 * Dec 11 2018 11:11 AM
 * 
 */
package AccountForLedger;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteProductAccountRelationship extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
       PrintWriter out = response.getWriter();
           try{
            HashMap dbp = new HashMap();
            if (session.getAttribute("dbnme") != null) {
                dbp.put("param1", session.getAttribute("dbnme").toString());
            }
                int i = 0;
                int rel_id = Integer.parseInt(request.getParameter("id"));
                Bean_AccSubType_ProdCatg apbean = new Bean_AccSubType_ProdCatg();
                AccountForLedger.Query afl_dao= new AccountForLedger.Query();
                i = afl_dao.deleteRelationAccounTProduct(rel_id,dbp);
                out.println(i);
                
                
            
        }catch (NumberFormatException | SQLException e) {
            out.println(0);
    }
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
