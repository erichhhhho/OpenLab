<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome to the openLab</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery-labelauty.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
      *{margin:0px; padding:0px;}
      body{font-family: Arial, Helvetica, sans-serif;font-size: 12px;}
      .cur{cursor:pointer; display:block;color:#788F72;width:146px; height:22px; line-height:22px; padding:0px 0px 0px 2px;}
      .am{border: 0px;color:#000000;cursor: pointer;  width: 150px;height: 19px;margin:10px 0px 0px 10px; padding:3px 0px 0px 2px;}
      .bm{border: 1px #999999 solid ;width: 148px; margin-left:10px;}
    </style>
    <style>
      ul { list-style-type: none;}
      li { display: inline-block;}
      li { margin: 0 0;}
      input.labelauty + label { font: 12px "Microsoft Yahei";}
    </style>
    <script type="text/javascript">
    function $$$$$(_sId){
        return document.getElementById(_sId);
    }
    function hide(_sId)
    {$$$$$(_sId).style.display = $$$$$(_sId).style.display == "none" ? "" : "none";}
    function pick(v) {
        document.getElementById('am').value=v;
        hide('HMF-1')
    }
    function bgcolor(id){
        document.getElementById(id).style.background="#F7FFFA";
        document.getElementById(id).style.color="#000";
    }
    function nocolor(id){
        document.getElementById(id).style.background="";
        document.getElementById(id).style.color="#788F72";
    }
  </script>
  </head>
  <body style="background-image: url(image/nature1.jpg)">
  Welcome,${user.nickname},privilege:${user.privilege}

  <a href="LogoutServlet">退出登录</a>
    <div class="jumbotron page-header">
      <h1>Open Laboratory<small>At your service</small></h1>
      <nav class="navbar navbar-default navbar-fixed-bottom">
        <div class="container">
          <ul id="myTab" class="nav nav-tabs">
          	<li class="active"><a href="#home" data-toggle="tab">Home</a></li>
          	<li><a href="#appointment" data-toggle="tab">Appointment</a></li>
            <li><a href="#management" data-toggle="tab">Management</a></li>
            <li><a href="#search" data-toggle="tab">Search</a></li>
          </ul>
        </div>
      </nav>
    </div>
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane fade in active" id="home">
        &nbsp<p style="color:#ffffff; font-size:35px">Hello! Welcome to OpenLab!</p>
      </div>
      <div class="tab-pane fade" id="appointment">
          <div class="panel panel-default">
        <form action="AddAppointmentServlet" method="post">
            <table  style="border-collapse:separate;border-spacing:20px 20px;">
                <tr>
                    <td style="color:black">日期：</td>
                    <td>
                        <input type="date" name="reservation_date" />
                    </td>

                    <td style="color:#ffffff">实验室：</td>
                    <td>
                        <ul class="dowebok">
                            <li><input type="radio" name="radio" data-labelauty="东区-106 "></li>
                            <li><input type="radio" name="radio" data-labelauty="华山区-106"></li>
                            <li><input type="radio" name="radio" data-labelauty="启林区-106"></li>
                        </ul>
                        <ul class="dowebok">
                            <li><input type="radio" name="radio" data-labelauty="东区-107 "></li>
                            <li><input type="radio" name="radio" data-labelauty="华山区-107"></li>
                            <li><input type="radio" name="radio" data-labelauty="启林区-107"></li>
                        </ul>
                        <ul class="dowebok">
                            <li><input type="radio" name="radio" data-labelauty="东区-108 "></li>
                            <li><input type="radio" name="radio" data-labelauty="华山区-108"></li>
                            <li><input type="radio" name="radio" data-labelauty="启林区-108"></li>
                        </ul>
                        <ul class="dowebok">
                            <li><input type="radio" name="radio" data-labelauty="东区-109 "></li>
                            <li><input type="radio" name="radio" data-labelauty="华山区-109"></li>
                            <li><input type="radio" name="radio" data-labelauty="启林区-109"></li>
                        </ul>

                        <script src="js/jquery-1.8.3.min.js"></script>
                        <script src="js/jquery-labelauty.js"></script>
                        <script>
                            $(function(){
                                $(':input').labelauty();
                            });
                        </script>
                    </td>
                    <td style="color:black">时间段：</td>
                    <td>
                        <input valign="left" onclick="hide('HMF-1')" type="text" value="请选择时间段" id="am" class="am" name="time"/>
                        <div id="HMF-1" style="display: none " class="bm">
                            <span id="a1" onclick="pick('第一节课')" onMouseOver="bgcolor('a1')" onMouseOut="nocolor('a1')" class="cur">第一节课</span>
                            <span id="a2" onclick="pick('第二节课')" onMouseOver="bgcolor('a2')" onMouseOut="nocolor('a2')" class="cur">第二节课</span>
                            <span id="a3" onclick="pick('第三节课')" onMouseOver="bgcolor('a3')" onMouseOut="nocolor('a3')" class="cur">第三节课</span>
                            <span id="a4" onclick="pick('第四节课')" onMouseOver="bgcolor('a4')" onMouseOut="nocolor('a4')" class="cur">第四节课</span>
                            <span id="a5" onclick="pick('第五节课')" onMouseOver="bgcolor('a5')" onMouseOut="nocolor('a5')" class="cur">第五节课</span>
                            <span id="a6" onclick="pick('第六节课')" onMouseOver="bgcolor('a6')" onMouseOut="nocolor('a6')" class="cur">第六节课</span>
                        </div>
                    </td>
                    <td>
                        <input type="submit" class="btn btn-primary btn-lg"/>
                    </td>
                </tr>
            </table>
        </form>
          </div>
      </div>

        <div class="tab-pane fade" id="management">

            <div class="panel panel-default">
                <div class="panel-heading"><h3>预约记录</h3></div>
                <div class="panel-body">
                    <table class="table">
                        <th>日期</th><th>时间段</th><th>实验室</th><th>操作</th>
                        <tr><td>2017-7-2</td><td>第一节课</td><td>主校区-109</td><td><input type="checkbox" name="id0" data-labelauty="删除"></td></tr>
                        <tr><td>2017-7-2</td><td>第一节课</td><td>主校区-109</td><td><input type="checkbox" name="id0" data-labelauty="删除"></td></tr>
                        <tr><td>2017-7-2</td><td>第一节课</td><td>主校区-109</td><td><input type="checkbox" name="id0" data-labelauty="删除"></td></tr>
                        <tr><td>2017-7-2</td><td>第一节课</td><td>主校区-109</td><td><input type="checkbox" name="id0" data-labelauty="删除"></td></tr>
                        <tr><td>2017-7-2</td><td>第一节课</td><td>主校区-109</td><td><input type="checkbox" name="id0" data-labelauty="删除"></td></tr>
                    </table>
                    <hr>
                    <br/>
                </div>
            </div>
        </div>

      <div class="tab-pane fade" id="search" style="font-color:#ffffff">
        <nav class="navbar navbar-default">
          <div class="container">
            <ul id="myTab2" class="nav nav-tabs">
              <li class="active"><a href="#date" data-toggle="tab">按时间</a></li>
              <li><a href="#room" data-toggle="tab">按实验室</a></li>
            </ul>
          </div>
        </nav>
        <div class="tab-pane fade" id="date">
        <form>
          <table>
              <td style="color:#ffffff">日期：</td>
              <td>
                  <input type="date" name="reservation_date" />
              </td>
              <td>
                  <input type="submit" class="btn btn-primary btn-lg"/>
              </td>
          </table>
        </form>
        </div>
        <div class="tab-pane fade" id="room">

          <form>
            <table style="border-collapse:separate;border-spacing:20px 20px;">
              <td>
              <ul class="dowebok">
                  <li><input type="radio" name="radio" data-labelauty="东区-106 "></li>
                  <li><input type="radio" name="radio" data-labelauty="华山区-106"></li>
                  <li><input type="radio" name="radio" data-labelauty="启林区-106"></li>
              </ul>
              <ul class="dowebok">
                  <li><input type="radio" name="radio" data-labelauty="东区-107 "></li>
                  <li><input type="radio" name="radio" data-labelauty="华山区-107"></li>
                  <li><input type="radio" name="radio" data-labelauty="启林区-107"></li>
              </ul>
              <ul class="dowebok">
                  <li><input type="radio" name="radio" data-labelauty="东区-108 "></li>
                  <li><input type="radio" name="radio" data-labelauty="华山区-108"></li>
                  <li><input type="radio" name="radio" data-labelauty="启林区-108"></li>
              </ul>
              <ul class="dowebok">
                  <li><input type="radio" name="radio" data-labelauty="东区-109 "></li>
                  <li><input type="radio" name="radio" data-labelauty="华山区-109"></li>
                  <li><input type="radio" name="radio" data-labelauty="启林区-109"></li>
              </ul>
            </td>
            <td>
              <input type="submit" class="btn btn-primary btn-lg"/>
            </td>
            </table>
            </form>
        </div>
      </div>
    </div>
</body>
