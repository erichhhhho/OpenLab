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
    <link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body>
<section>
    <div class="title">
        Register
    </div>
    <div class="login">
        <div style="margin:30px auto; width:300px; height:300px; background:#ffffff;">
            <h2 style="text-align:center; margin-top:20px;"></h2>
            <div class="style_1">
                <form method="get" id="searchform" action="">
                    <table>
                        <tr>
                            <td>name:</td>
                            <td>
                            <fieldset>
                                <input id="s" name="name" type="text" value="Enter Name" class="text_input" onblur="if(this.value==''){this.value='Enter Name';}" onfocus="if(this.value =='Enter Name') {this.value=''; }" />
                            </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>password</td>
                            <td>
                            <fieldset>
                                <input id="s" name="passwd1" type="password" value="Enter password" class="password_input" onblur="if(this.value=='Enter password'){this.value='Enter password';}" onfocus="if(this.value =='Enter password') {this.value=''; }" />
                            </fieldset>
                            </td>
                        </tr>
                            <tr>
                        <td>password again:</td>
                        <td>
                            <fieldset>
                                <input id="s" name="passwd2" type="password" value="Enter password" class="password_input" onblur="if(this.value=='Enter password'){this.value='Enter password';}" onfocus="if(this.value =='Enter password') {this.value=''; }" />
                            </fieldset>
                        </td>
                    </tr>
                        <tr>
                        <td>vcode:</td>
                        <td>
                            <fieldset>
                                <input id="s" name="vcode" type="text" value="Enter vcode" class="text_input" onblur="if(this.value==''){this.value='Enter vcode';}" onfocus="if(this.value =='Enter vcode') {this.value=''; }" />
                            </fieldset>
                        </td>
                        </tr>
                        <tr>
                            <td>
                            <fieldset>
                                <img alt="Refresh" id="checkImg" src="GetCaptcha" onClick="document.getElementById('checkImg').src='com.lab.captch.GetCaptcha?temp='+ (new Date().getTime().toString(36)); return false">
                            </fieldset>
                            </td>
                        <td>
                    <fieldset>
                        <button>Register</button>
                    </fieldset>
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
</body>
</html>
