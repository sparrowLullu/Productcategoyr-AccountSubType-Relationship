<%-- 
    Document   : ProductAccountRelation
    Created on : Dec 7, 2018, 4:08:10 PM
    Author     : LS
--%>

<%@page import="ProductCategory.ProductCategoryBean"%>
<%@page import="AccountType.AccountTypeBean"%>
<%@page import="AccountSubType.AccountSubTypeBean"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>


<%@page import="ExpensesWithAccount.ExpenseWithAccountQuery"%>
<%@page import="ExpensesWithAccount.ExpenseTypeBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="Month.MonthBean"%>
<%    try {
        if (!session.getAttribute("s_id").toString().equals(null)) {
%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Vector"%>
<%@page import="FeeType.FeeTypeBean"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Product Account Relationship Establishment | Intslate</title>
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
        <script type="text/javascript">
            <%-- js function used for listing --%>
            function loadProdAccRelation()
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    xmlhttp = new XMLHttpRequest();
                }
                else
                {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        document.getElementById("tbody").innerHTML = xmlhttp.responseText;
                    }
                }
                xmlhttp.open("POST", "/intslate/ProductRelationWithAccount_List", true);
                xmlhttp.send();
            }
            
            <%-- js function used for delete --%>
            function deleteConfirm(i) {
                document.getElementById('ide').value = i;
            }
            function Delete()
            {
                window.location.reload();

                var i = document.getElementById('ide').value;
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    xmlhttp = new XMLHttpRequest();
                }
                else
                {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var temp = xmlhttp.responseText;
                        if (temp == 1)
                        {
                            var table = document.getElementById(i);
                            for (var j = 1; j >= 0; j--)
                            {
                                table.deleteCell(j);


                            }
                        }
                        else
                        {
                            alert("This Data is Used at Some Other Place");
                        }
                    }

                }
                xmlhttp.open("POST", "/intslate/DeleteProductAccountRelationship?id=" + i, false);
            <%--   xmlhttp.open("POST", "/intslate/DeleteProductAccountRelationship?relationId=" + i, false);  --%>
                xmlhttp.send();
            }


        </script>
    </head>
    <body class="page-container-bg-solid page-sidebar-closed-hide-logo page-sidebar-closed page-header-fixed page-sidebar-fixed">
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
                    <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    <h4 class="modal-title">Are You Sure?</h4>
                                </div>
                                <div class="modal-body">
                                    You Want to Delete It!
                                </div>
                                <input type="hidden" id="ide">
                                <div class="modal-footer">
                                    <button type="button" id="save1" class="btn blue" data-dismiss="modal" value="save" onclick="Delete()">Save changes</button>
                                    <button type="button" class="btn default" value="close" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
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
                                <a>Product Accounts Relations </a>
                            </li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="portlet-body">
                                <!--MSG PRINT-->
                                <%if (session.getAttribute("status") != null) {
                                        if (session.getAttribute("status").toString().equalsIgnoreCase("success")) {%>
                                <div class="alert alert-success alert-dismissable"><strong>Success!&nbsp;</strong>

                                    <%} else if (session.getAttribute("status").toString().equalsIgnoreCase("fail")) {%>
                                    <div class="alert alert-danger alert-dismissable"><strong>Error!&nbsp;</strong>
                                        <%} else if (session.getAttribute("status").toString().equalsIgnoreCase("info")) {%>
                                        <div class="alert alert-info alert-dismissable"><strong>Information!&nbsp</strong>
                                            <%}%>
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
                                            <%=session.getAttribute("msg")%>
                                        </div>
                                        <%session.removeAttribute("status");
                                                session.removeAttribute("msg");
                                            }%>
                                    </div>

                                    <div class="portlet box blue">
                                        <div class="portlet-title">
                                            <div class="caption">
                                                <i class="fa fa-file-text"></i>Product Account Relationship
                                            </div>

                                            <div class="actions">
                                                <div class="tools">
                                                    <div class="col-md-12">

                                                        <div class="btn-group pull-right">
                                                            <a href="/intslate/Adminstration/Settings.jsp" id="sd" class="btn btn-default btn-sm">
                                                                <i class="icon-settings"></i> 
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="portlet-body form">
                                            <!-- BEGIN FORM-->
                                            <form action="/intslate/ProductRelationWithAccount" method="post" class="form-horizontal" id="form_m">
                                                <div class="form-body"> 
                                                    <br>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group" id="Expenditures">
                                                                <label class="control-label col-md-4">Product Category<span class="required">
                                                                        * </span>
                                                                </label>
                                                                <div class="col-md-8" id="chose-expenditure-heads">
                                                                    <div class="input-icon right">
                                                                        <i class="fa"></i>                                                                    
                                                                        <select class="form-control" id=""  name="ProdAccRelation">
                                                                            <option value="">Select Product Category</option>
                                                                            <%
                                                                                HashMap dbp = new HashMap();
                                                                                if (session.getAttribute("dbnme") != null) {
                                                                                    dbp.put("param1", session.getAttribute("dbnme").toString());
                                                                                }

                                                                                ProductCategoryBean pgbean = new ProductCategoryBean();
                                                                                ArrayList prod_cat_list = new ArrayList();
                                                                                ProductCategory.Query pc_dao = new ProductCategory.Query();
                                                                                prod_cat_list = pc_dao.viewAllProductCategory(dbp);
                                                                                Iterator itr = prod_cat_list.iterator();
                                                                                while (itr.hasNext()) {
                                                                                    pgbean = (ProductCategoryBean) itr.next();
                                                                            %>
                                                                            <option value="<%=pgbean.getPRODUCTCATEGORYID()%>"><%=pgbean.getPRODUCTCATEGORYNAME()%></option>
                                                                            <%
                                                                                }
                                                                            %>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </diV>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label col-md-4">Account Head<span class="required">
                                                                        * </span>
                                                                </label>
                                                                <div class="col-md-8">
                                                                    <div class="input-icon right">
                                                                        <i class="fa"></i>                                                                    
                                                                        <select class="form-control" id="accountType"  name="accountType">
                                                                            <option value="">Select Account Head</option>
                                                                            <% HashMap dbp2 = new HashMap();
                                                                                if (session.getAttribute("dbnme") != null) {
                                                                                    dbp2.put("param1", session.getAttribute("dbnme").toString());
                                                                                }

                                                                                AccountSubTypeBean accountBean = new AccountSubTypeBean();
                                                                                AccountTypeBean bean = new AccountTypeBean();
                                                                                Vector<Object> list2 = new Vector<Object>();
                                                                                Vector<Object> list3 = new Vector<Object>();
                                                                                int acc_id = 0;
                                                                                list2 = AccountType.Query.viewAll(dbp2);
                                                                                Iterator acc_it = list2.iterator();
                                                                                while (acc_it.hasNext()) {
                                                                                    bean = (AccountTypeBean) acc_it.next();
                                                                                    acc_id = bean.getAccountTypeId();
                                                                                    if (acc_id >= 0) {
                                                                                        list3 = AccountSubType.Query.viewAll1(acc_id, dbp2);
                                                                                        Iterator sub_acc_it = list3.iterator();
                                                                                        while (sub_acc_it.hasNext()) {
                                                                                            accountBean = (AccountSubTypeBean) sub_acc_it.next();
                                                                            %>
                                                                            <option value="<%=accountBean.getAccountSubTypeId()%>"><%=accountBean.getAccountSubTypeName()%></option>
                                                                            <% }
                                                                                }

                                                                            %>
                                                                            <%}%>

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </diV>
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
                                        </div>
                                        <!-- END FORM-->

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="portlet box blue">
                                        <div class="portlet-title">
                                            <div class="caption">
                                                <i class="fa fa-list"></i> Product and Account Relations list
                                            </div>
                                            <div class="actions">
                                                <div class="tools">
                                                    <div class="col-md-12">
                                                        <div class="btn-group pull-right">
                                                            <a href="/intslate/Adminstration/Settings.jsp" id="sd" class="btn btn-default btn-sm">
                                                                <i class="icon-settings"></i> 
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                                           
                                        </div>
                                        <div class="portlet-body" style="display: none;">
                                            <div class="alert alert-block alert-danger fade in">
                                                <button type="button" class="close" data-dismiss="alert"></button>
                                                <h4 class="alert-heading">Alert! Are you sure?</h4>

                                                <p>
                                                    <a class="btn red" href="#">
                                                        Do this </a>
                                                    <a class="btn blue" href="#">
                                                        Cancel </a>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <!------ status msg start------->  
                                            <!------ status msg start end------->
                                            <div id="sample_1_wrapper" class="dataTables_wrapper no-footer">
                                                <div class="portlet-body flip-scroll">
                                                    <table class="table table-bordered table-striped table-condensed flip-content">
                                                        <thead class="flip-content">
                                                            <tr>
                                                                <th>Product Category Head</th>
                                                                <th>Account Head</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbody">
                                                            <tr>
                                                                <td colspan="3">
                                                                    <div class="spinner">
                                                                        <div class="bounce1"></div>
                                                                        <div class="bounce2"></div>
                                                                        <div class="bounce3"></div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <!-- END SAMPLE TABLE PORTLET-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>     

                            <%--start --%>                   

                            <%--end--%>
                        </div>
                    </div>

                </div>
            </div>
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
                                            loadProdAccRelation();

                                        });

            </script>
            <script>
                function fillAllMonth(val) {
                    if (val == 4) {
                        $(".monthid").prop("checked", true);
                        $(".monthid").parent().addClass('checked');
                        $(".monthid").parent().parent().addClass('checker');
                    }
                    else {
                        $(".monthid").prop("checked", false);
                        $(".monthid").parent().removeClass('checked');
                    }
                }
            </script>
        </div>
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