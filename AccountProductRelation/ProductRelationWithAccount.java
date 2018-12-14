package AccountForLedger;

import ExpensesWithAccount.ExpenseTypeBean;
import ExpensesWithAccount.ExpenseWithAccountQuery;
import ExpensesWithAccount.SubExpenseTypeBean;
import RecentAddedSetting.RecentAddedBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LS 6/12/18
 */
public class ProductRelationWithAccount extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            HashMap dbp = new HashMap();
            if (session.getAttribute("dbnme") != null) {
                dbp.put("param1", session.getAttribute("dbnme").toString());
            }
            int i = 0;
            ArrayList list = new ArrayList();
            int sid = Integer.parseInt(session.getAttribute("s_id").toString());
            int entry_id = Integer.parseInt(session.getAttribute("user_id").toString());
            Bean_AccSubType_ProdCatg apbean = new Bean_AccSubType_ProdCatg();
            apbean.setProdCatId(Integer.parseInt(request.getParameter("ProdAccRelation")));
            apbean.setAccSubTypeId(Integer.parseInt(request.getParameter("accountType")));
            apbean.setEntryId(entry_id);
            apbean.setsId(sid);
           // subExBean.setExpenseBean(exBean);

           Query q_dao = new Query();
             i = q_dao.addRelationAccountProduct(apbean, dbp);
            if (i > 0) {
                 session.setAttribute("status", "Success");
                session.setAttribute("msg", "Detail Added Successfully!");
                response.sendRedirect("/intslate/Services/Accounts/Settings/ProductAccountRelation.jsp");

            } else {
                session.setAttribute("status", "Fail");
                session.setAttribute("msg", "Relationship Already Establish!");
                response.sendRedirect("/intslate/Services/Accounts/Settings/ProductAccountRelation.jsp");
            }
        } catch (Exception e) {
            session.setAttribute("status", "Fail");
            session.setAttribute("msg", "Please Check Details and try Again!");
            response.sendRedirect("/intslate/Services/Accounts/Settings/ProductAccountRelation.jsp");
        }

    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
