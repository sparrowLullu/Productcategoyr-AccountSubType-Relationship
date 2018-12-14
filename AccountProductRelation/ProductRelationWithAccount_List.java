package AccountForLedger;

import AccountSubType.AccountSubTypeBean;
import AccountType.AccountTypeBean;
import ProductCategory.ProductCategoryBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LS 7/12/18
 */
public class ProductRelationWithAccount_List extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            HashMap dbp = new HashMap();
            if (session.getAttribute("dbnme") != null) {
                dbp.put("param1", session.getAttribute("dbnme").toString());
            }
            AccountForLedger.Query afl_dao = new AccountForLedger.Query();
            ArrayList list = afl_dao.relationJoinProductAccountSub(dbp);
            if (!list.isEmpty()) {
                Iterator itr = list.iterator();
                while (itr.hasNext()) {

                    Bean_AccSubType_ProdCatg ap_bean = (Bean_AccSubType_ProdCatg) itr.next();  //for iterating
                    ProductCategoryBean pc_bean = ap_bean.getProductCategoryBean();
                    AccountSubTypeBean ast_bean = ap_bean.getAccountSubTypeBean();
                    //  AccountTypeBean at_bean = ap_bean.getAccountTypeBean();

                    out.println("<tr id='" + ap_bean.getRelId() + "'>");
                    //for displaying purpose start
                    out.println("<td>");
                    out.println(pc_bean.getPRODUCTCATEGORYNAME());
                    out.println("</td>");
                    out.println("<td>");
                    out.println(ast_bean.getAccountSubTypeName());
                    out.println("</td>");
                    //end
                    out.println("<td>");
                    out.println("<a  title='Edit'   href='javascript:void(null);' onclick=\"document.getElementById('f" + ap_bean.getRelId() + "').submit();\"><i class='fa fa-edit' style='color: black;margin-left: 10px'></i></a>");
                    out.println("<form action='EditProductAccountRelation.jsp' method='post' id='f" + ap_bean.getRelId() + "' style='display:none;'>"
                            + "<input type='hidden' value='" + ap_bean.getRelId() + "' name='id'>" //relationId
                            + "<input type='hidden' value='" + pc_bean.getPRODUCTCATEGORYID() + "' name='pId'>" //product category id
                            + "<input type='hidden' value='" + pc_bean.getPRODUCTCATEGORYNAME() + "' name='pName'>" //product category nme which we will use in editing jsp

                            + "<input type='hidden' value='" + ast_bean.getAccountSubTypeId() + "' name='accSubId'>" // Acccount subtype Id
                            + "<input type='hidden' value='" + ast_bean.getAccountSubTypeName() + "' name='accSubName'>" //account sub type Name

                            + "</form>");
                    out.println("<a href=\"#portlet-config\" data-toggle=\"modal\" title='Delete' onclick='deleteConfirm(" + ap_bean.getRelId() + ")'><i class='fa fa-trash'  style='color: black;margin-left: 12px'></i></a>");
                    out.println("</td>");
                    out.println("</tr>");
                }
            } else {
                out.println("<tr>");
                out.println("<td colspan='3'>");
                out.println("<b>No Record Found</b>");
                out.println("</td>");
                out.println("</tr>");
            }
        } catch (Exception e) {
            e.printStackTrace();
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
