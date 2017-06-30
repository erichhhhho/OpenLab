<%--
  Created by IntelliJ IDEA.
  User: liam
  Date: 2017/6/15
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome to the openLab</title>
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>

<div class="jumbotron" style="background-image:url(/image/Lab/Chemistry-1920x960.jpg); background-size:100%">
    <div class="row" >
        <div class="form-group" >
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h1 align="center">This is OpenLab,</h1>
            </div>
            <div class="col-md-4">

            </div>
        </div>
    </div>
    <div class="row" >
        <div class="form-group" >
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <p align="right">Please Sign In first</p>
            </div>
            <div class="col-md-4">
                <p align="right"><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
            </div>
        </div>
    </div>
</div>

<div class="alert alert-warning alert-dismissible .fade .in" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
    <strong>Warning!</strong>
    <%
        String str="Please Input the information correctly";
        String temp= (String) request.getAttribute("msg");
        if(temp==""||temp==null){
    %>
    <%=str%>
    <%
    }else{
    %>
    ${msg}
    <%
        }
    %>
</div>

<section>
    <div class="title">
        Register
    </div>
    <div class="login">
        <div style="margin:30px auto; width:300px; height:300px; background:#ffffff;">
            <h2 style="text-align:center; margin-top:20px;"></h2>
            <div class="style_1">
                <form id="searchform" action="RegisterServlet" method="post">
                    <table>
                        <tr>
                            <td>
                                <div>
                                <label for="s1" class="control-label" style="font-size: 15px">Name</label>
                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                            </div>
                            </td>
                            <td>
                            <fieldset>
                                <input id="s1" name="name" type="text" value="Enter Name" class="text_input" onblur="if(this.value==''){this.value='Enter Name';}" onfocus="if(this.value =='Enter Name') {this.value=''; }" />
                            </fieldset>
                            </td>
                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>
                            <div>
                                <label for="s2" class="control-label" style="font-size: 15px">Password</label>
                                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                            </div>
                            </td>
                            <td>
                            <fieldset>
                                <input id="s2" name="passwd1" type="password" value="" class="password_input" onblur="if(this.value=='Enter password'){this.value='Enter password';}" onfocus="if(this.value =='Enter password') {this.value=''; }" />
                            </fieldset>
                            </td>
                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                            <tr>
                        <td>
                        <div>
                            <label for="s2" class="control-label" style="font-size: 15px">Password Once</label>

                        </div>
                        </td>
                        <td>
                            <fieldset>
                                <input id="s3" name="passwd2" type="password" value="" class="password_input" onblur="if(this.value=='Enter password'){this.value='Enter password';}" onfocus="if(this.value =='Enter password') {this.value=''; }" />
                            </fieldset>
                        </td>
                    </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                        <td>
                        <div>
                            <label for="s3" class="control-label" style="font-size: 15px">Code</label>
                            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
                        </div>
                        </td>
                        <td>
                            <fieldset>
                                <input id="s" name="vcode" type="text" value="Enter vcode" class="text_input" onblur="if(this.value==''){this.value='Enter vcode';}" onfocus="if(this.value =='Enter vcode') {this.value=''; }" />
                            </fieldset>
                        </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                            <fieldset>
                                <img alt="Refresh" id="checkImg" src="GetCaptcha" onClick="change(this)" style="cursor: hand">

                            </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                            <div class="row" >
                                <div class="col-md-1"></div>
                                <div class="col-md-3">
                                    <button type="submit" class="btn btn-primary" onsubmit="return check()">
                                        Sign&nbsp;In
                                    </button>
                                </div>
                                <div class="col-md-2"></div>
                                <div class="col-md-4">
                                    <button type="reset" class="btn btn-primary">
                                        Reset
                                    </button>

                                </div>
                             </div>
                             </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</section>
<div>
    <tr>
        <td colspan="2">
            <a href="index.jsp">Already registered</a>
        </td>
    </tr>
</div>
<script type="text/javascript">
    function change(img) {
        img.src=img.src+"?"+new Date().getTime();
    }
</script>
</body>
</html>
