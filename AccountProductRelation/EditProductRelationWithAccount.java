
package AccountForLedger;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LS
 * Dec 11 2018  4:14 PM
 */
public class EditProductRelationWithAccount extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
       try{ HashMap dbp=new HashMap();
            if(session.getAttribute("dbnme")!=null){
                dbp.put("param1", session.getAttribute("dbnme").toString());
            }
            Bean_AccSubType_ProdCatg  ast_bean = new Bean_AccSubType_ProdCatg ();
            AccountForLedger.Query afl_dao = new AccountForLedger.Query();
            
           int rel_id = Integer.parseInt(request.getParameter("id"));
           ast_bean.setRelId(rel_id);
           ast_bean.setProdCatId( Integer.parseInt(request.getParameter("pId")));
           ast_bean.setAccSubTypeId(Integer.parseInt(request.getParameter("accountSubType")));
           ast_bean.setEntryId(Integer.parseInt(session.getAttribute("user_id").toString()));
            ast_bean.setsId(Integer.parseInt(session.getAttribute("s_id").toString()));
           int i = 0;

           i = afl_dao.updateRelationAccounTProduct(ast_bean, dbp);
             if (i > 0) {
                    session.setAttribute("status", "Success");
                    session.setAttribute("msg",  " Updated Successfully");
                    response.sendRedirect("/intslate/Services/Accounts/Settings/ProductAccountRelation.jsp");
                } else {
                session.setAttribute("status", "Fail");
                session.setAttribute("msg", "Please Check Details and try Again!");
                response.sendRedirect("/intslate/Services/Accounts/Settings/EditProductAccountRelation.jsp");
            }
           
       } catch(Exception e)
        {
            session.setAttribute("status", "Fail");
            session.setAttribute("msg", "Please Check Details and try Again!");
            response.sendRedirect("/intslate/Services/Accounts/Settings/ProductAccountRelation.jsp");
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
