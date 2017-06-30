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
</head>
<body>
<section>
    <div class="title">
        Change your Password
    </div>
    <div class="login">
        <div style="margin:30px auto; width:300px; height:300px; background:#ffffff;">
            <h2 style="text-align:center; margin-top:20px;"></h2>
            <div class="style_1">
                <form method="post" id="searchform" action="">
                    <fieldset>
                        <input id="s1" name="name" type="text" value="Enter Name" class="text_input" onblur="if(this.value==''){this.value='Enter Name';}" onfocus="if(this.value =='Enter Name') {this.value=''; }" />
                    </fieldset>
                    <fieldset>
                        <input id="s2" name="passwd1" type="password" value="" class="password_input" onblur="if(this.value=='Enter password'){this.value='Enter password';}" onfocus="if(this.value =='Enter password') {this.value=''; }" />
                    </fieldset>
                    <fieldset>
                        <input id="s3" name="passwd2" type="password" value="" class="password_input" onblur="if(this.value=='Enter password'){this.value='Enter password';}" onfocus="if(this.value =='Enter password') {this.value=''; }" />
                    </fieldset>
                    <fieldset>
                        <input id="s4" name="vcode" type="text" value="Enter vcode" class="text_input" onblur="if(this.value==''){this.value='Enter vcode';}" onfocus="if(this.value =='Enter vcode') {this.value=''; }" />
                    </fieldset>
                    <table>
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
