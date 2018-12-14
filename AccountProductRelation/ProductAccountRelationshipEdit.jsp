<%-- 
    Document   : EditProductAccountType
    Created on : Dec 12, 2018, 3:43:16 PM
    Author     : LS
--%>

<%@page import="ProductCategory.ProductCategoryBean"%>
<%@page import="AccountSubType.AccountSubTypeBean"%>
<%@page import="Account_Management_New.AccountTypeBean"%>
<%@page import="Account_Management_New.Account_SubType_Bean"%>
<%@page import="Account_Management_New.AccountQuery"%>
<%@page import="java.util.HashMap"%>
<%@page import="ExpensesWithAccount.ExpenseWithAccountQuery"%>
<%@page import="ExpensesWithAccount.ExpenseTypeBean"%>
<%
    try {
        if (!session.getAttribute("s_id").toString().equals(null)) {
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Update Product Accounts Relations | Intslate</title>
        <meta name="robots" content="nofollow"/>
        <link rel="SHORTCUT ICON" href="/intslate/int.png" type="image/ico">
        <script src="/intslate/global/plugins/pace/pace.min.js" type="text/javascript"></script>
        <link href="/intslate/global/plugins/pace/themes/pace-theme-minimal.css" rel="stylesheet" type="text/css"/>
        <!-- END PACE PLUGIN FILES -->
        <link href="/intslate/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="/intslate/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
        <link href="/intslate/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="/intslate/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
        <link href="/intslate/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="/intslate/global/plugins/select2/select2.css">
        <link rel="stylesheet" type="text/css" href="/intslate/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css"/>
        <link rel="stylesheet" type="text/css" href="/intslate/global/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
        <link href="/intslate/global/css/components.css" rel="stylesheet" type="text/css"/>
        <link href="/intslate/global/css/plugins.css" rel="stylesheet" type="text/css"/>
        <link href="/intslate/admin/layout2/css/layout.css" rel="stylesheet" type="text/css"/>
        <link id="style_color" href="/intslate/admin/layout2/css/themes/default.css" rel="stylesheet" type="text/css"/>
        <link href="/intslate/admin/layout2/css/custom.css" rel="stylesheet" type="text/css"/>

        <!-- BEGIN PAGE LEVEL STYLES -->
        <link rel="stylesheet" type="text/css" href="/intslate/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
    </head>
    <body class="page-sidebar-closed-hide-logo page-container-bg-solid page-sidebar-closed-hide-logo page-sidebar-closed page-header-fixed page-sidebar-fixed">
        <!-- BEGIN HEADER -->
        <%@include file="/Adminstration/Header.jsp" %>
        <!-- END HEADER -->
        <div class="clearfix">
        </div>
        <!-- BEGIN CONTAINER -->

        <div class="page-container">
            <%@include file="/Adminstration/SettingsSidebar.jsp" %>
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>
                                <a href="/intslate/Adminstration/Dashboard.jsp">Home</a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <a href="/intslate/Adminstration/Settings.jsp"> Setting Dashboard </a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <a>Update Product Accounts Relationship</a>
                            </li>

                        </ul>

                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="portlet-body">
                                <!--msg print-->
                            </div>

                            <div class="portlet box blue">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="fa fa-file-text"></i>Update Product Accounts Relations
                                    </div>
                                    <div class="tools actions">
                                        <div class="pull-right">
                                            <a href="/intslate/Services/Accounts/Settings/ProductAccountRelation.jsp" id="sd" class="btn btn-default btn-sm">
                                                Product Accounts Head List <i class="fa fa-list-alt"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>

                                <div class="portlet-body">

                                    <div class="portlet-body form">
                                        <!-- BEGIN FORM-->
                                      <form action="/intslate/EditProductRelationWithAccount" method="post" class="form-horizontal" id="form_m">
                                            <div class="form-body">                                                
                                                <div class="row">
                                                   <div class="col-md-6">
                                                            <div class="form-group" id="Product">
                                                                <label class="control-label col-md-4">Product Category<span class="required">
                                                                        * </span>
                                                                </label>
                                                                 <div class="col-md-8">
                                                                <div class="input-icon right">
                                                                    <i class="fa"></i>
                                                                    <input type="text" class="form-control" name="pName" value="<%=request.getParameter("pName")%>" required="">
                                                                    <%-- <input type="hidden" id="id" name="id" value="<%=request.getParameter("pId")%>">    --%>  
                                                                <input type="hidden" id="pId" name="pId" value="<%=request.getParameter("pId")%>">
                                                                 <input type="hidden" id=id" name="id" value="<%=request.getParameter("id")%>">
                                                                </div>
                                                            </div>
                                                            </div>
                                                                
                                                        </diV> 
                                                    <!--/span-->                                                   

                                                     <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="control-label col-md-4">Account Head<span class="required">
                                                                            * </span>
                                                                    </label>
                                                                    <div class="col-md-8">
                                                                        <div class="input-icon right">
                                                                            <i class="fa"></i>                                                                    
                                                                            <select class="form-control" id="accountSubType"  name="accountSubType">
                                                                                <option value="">Select Account Head</option>
                                                                                <% HashMap dbp2 = new HashMap();
                                                                                    if (session.getAttribute("dbnme") != null) {
                                                                                        dbp2.put("param1", session.getAttribute("dbnme").toString());
                                                                                    }

                                                                                  AccountSubTypeBean ast_bean = new AccountSubTypeBean();
                                                                                  ArrayList alist =  new ArrayList();
                                                                                  AccountForLedger.Query afl_dao = new AccountForLedger.Query();
                                                                                  alist = afl_dao.getAllAccountSubType(dbp2);
                                                                                  Iterator itr = alist.iterator();
                                                                                  while(itr.hasNext()){
                                                                                      ast_bean = (AccountSubTypeBean) itr.next();
                                                                                %>
                                                                                <option value="<%=ast_bean.getAccountSubTypeId() %>"><%=ast_bean.getAccountSubTypeName() %></option>
                                                                                <% 
                                                                                  }
                                                                                %>
                                                   
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                    
                                                    
                                                </div>
                                                <!--/row-->                                               

                                            </div>
                                           <div class="form-actions">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="row">
                                                                    <div class="col-md-offset-3 col-md-8">
                                                                        <button type="submit" class="btn green">Submit</button>
                                                                        <button type="reset" class="btn default">Cancel</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                            </div>
                                                        </div>
                                                    </div>
                                        </form>
                                        
                                        
                                         
                                       
                                        <%--end of form--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END CONTAINER -->

        <!-- BEGIN FOOTER -->
        <%@include file="/Adminstration/Footer.jsp" %>
        <!-- END FOOTER -->
        <script src="/intslate/global/plugins/jquery-1.11.0.min.js" type="text/javascript"></script>
        <script src="/intslate/global/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
        <!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
        <script src="/intslate/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
        <script src="/intslate/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="/intslate/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <script src="/intslate/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="/intslate/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="/intslate/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
        <script src="/intslate/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
        <script src="/intslate/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript" src="/intslate/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="/intslate/global/plugins/jquery-validation/js/additional-methods.min.js"></script>
        <script type="text/javascript" src="/intslate/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript" src="/intslate/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="/intslate/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
        <script type="text/javascript" src="/intslate/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
        <script type="text/javascript" src="/intslate/global/plugins/ckeditor/ckeditor.js"></script>
        <script type="text/javascript" src="/intslate/global/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
        <script type="text/javascript" src="/intslate/global/plugins/bootstrap-markdown/lib/markdown.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="/intslate/global/scripts/metronic.js" type="text/javascript"></script>
        <script src="/intslate/admin/layout2/scripts/layout.js" type="text/javascript"></script>
        <script src="/intslate/admin/layout2/scripts/demo.js" type="text/javascript"></script>
        <script src="/intslate/admin/pages/scripts/form-samples.js"></script>
        <script src="/intslate/admin/pages/scripts/form-validation.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->

        <!-- END JAVASCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                // initiate layout and plugins
                Metronic.init(); // init metronic core components
                Layout.init(); // init current layout
                Demo.init(); // init demo features
                FormValidation.init();

            });

        </script>
        <!-- END JAVASCRIPTS-->
    </body>
</html>
<%        } else {

        }
    } catch (Exception e) {
        session.setAttribute("status", "fail");
        session.setAttribute("msg", "Session Expired!");
        response.sendRedirect("/intslate");
    }
%>
