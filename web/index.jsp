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
        <p align="right">Please Login first</p>
      </div>
      <div class="col-md-4">
        <p align="right"><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
      </div>
    </div>
  </div>
</div>

<div class="alert alert-warning alert-dismissible .fade .in" role="alert" id="alertDiv">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
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

  <div class="login">
    <div style="margin:30px auto; width:300px; height:300px; background:#ffffff;">
      <div class="row" >
      <div class="col-md-4"></div>
      <div class="style_1" class="col-md-4">
        <form method="post" id="searchform" action="LoginServlet">

          <div class="row" >
            <div class="form-group" >
              <div class="col-md-1"></div>
              <div class="col-md-4">
                <label for="s1" class="control-label" style="font-size: 15px">Name</label>
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
              </div>
              <div class="col-md-4">
                <input id="s1" name="name" type="text" value="Enter Name" class="text_input" onblur="if(this.value==''){this.value='Enter Name';}" onfocus="if(this.value=='Enter Name'){this.value='';}"  />
              </div>
              <div class="col-md-3"></div>
            </div>
          </div>

          <br>

          <div class="row" >
            <div class="form-group" >
              <div class="col-md-1">

              </div>
              <div class="col-md-4">
                <div class="row" >
                  <label for="s2" class="control-label" style="font-size: 15px">Password</label>
                  <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                </div>
              </div>

              <div class="col-md-4">
                <input id="s2" name="passwd" type="password" value="" class="password_input" onblur="if(this.value=='Enter password'){this.value='Enter password';}" />
              </div>
              <div class="col-md-3"></div>
            </div>
          </div>

          <br>

          <div class="row" >
            <div class="form-group" >
              <div class="col-md-1"></div>
              <div class="col-md-4">
                <label for="s3" class="control-label" style="font-size: 15px">Code</label>
                <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
              </div>
              <div class="col-md-4">
                <input id="s3" name="vcode" type="text" value="Enter vcode" class="text_input" onblur="if(this.value==''){this.value='Enter vcode';}" onfocus="if(this.value=='Enter vcode'){this.value='';}"/>
              </div>
              <div class="col-md-3"></div>
            </div>
          </div>

          <br>

          <div class="row" >
            <div class="form-group" >
              <div class="col-md-1"></div>
              <div class="col-md-4">
              </div>
              <div class="col-md-4">
                <img alt="Refresh" id="checkImg" src="GetCaptcha" onClick="change(this)" style="cursor: hand">
              </div>
              <div class="col-md-3"></div>
            </div>
          </div>

          <br>

          <div class="row">
            <div class="form-group">
              <div class="col-md-1"></div>
              <div class="col-md-3"></div>
              <div class="col-md-6">
                <div class="row" >
                  <div class="col-md-4">
                    <button type="submit" class="btn btn-primary" onsubmit="check()">
                      Login
                    </button>
                  </div>
                  <div class="col-md-4"></div>
                  <div class="col-md-4">
                    <button type="reset" class="btn btn-primary">
                      Reset
                    </button>

                  </div>

                </div>
              </div>
            </div>
          </div>

          <br>
          <div class="row">
            <div class="form-group" >
              <div class="col-md-5" style="margin:0; padding:0;">
                <ul align="left">
                  <li><a href = "changepassword.jsp">Reset&nbsp;Password</a></li>
                  <li><a href="register.jsp">Sign&nbsp;In</a></li>
                </ul>
              </div>
              <div class="col-md-4"></div>
            <div class="col-md-3"></div>
          </div>
          </div>

        </form>
      </div>
      <div class="col-md-4"></div>
      </div>
    </div>
  </div>
</section>

<script src="js/jquery-3.2.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
    function check(){
        if(document.getElementById("form1").name.value=="")
        {
            alert("请输入用户名");
            document.getElementById("form1").name.focus();
            return false;
        }
        if(document.getElementById("form1").passwd.value=="")
        {
            alert("请输入密码");
            document.getElementById("form1").passwd.focus();
            return false;
        }
    }
    function change(img) {
        img.src=img.src+"?"+new Date().getTime();
    }
</script>
</body>
</html>
