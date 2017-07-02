<%@ page import="java.util.Date" %><%--suppress ALL --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>\
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome to the openLab</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery-labelauty.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
      <script src="js/echarts.min.js"></script>
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

</h1>
    <div class="jumbotron page-header">
      <h1>Open Laboratory<small>At your service</small></h1>
      <nav class="navbar navbar-default navbar-fixed-bottom">
        <div class="container">
          <ul id="myTab1" class="nav nav-tabs">
          	<li class="active"><a href="#home" data-toggle="tab">Home</a></li>
          	<li><a href="#appointment" data-toggle="tab">Appointment</a></li>
            <li><a href="#management" data-toggle="tab">Management</a></li>
              <li><a href="#stat" data-toggle="tab">Statistic</a></li>

              <li><a href="#intro" data-toggle="tab">Introduction</a></li>
              <c:if test="${user.privilege.equals('manager')}">
                  <li><a href="#management1" data-toggle="tab">User Management</a></li>
              </c:if>
          </ul>
        </div>
      </nav>
    </div>
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane fade in active" id="home">
          <p style="color:#ffffff; font-size:35px">

              <c:if test="${!msg.equals('')||msg!=null}">
                 &nbsp; ${msg}<br>

              </c:if>
              Hello! ${user.nickname} ,Welcome to OpenLab! <br>&nbsp;Your privilege: ${user.privilege}<br>
              &nbsp;  <a href="LogoutServlet">Click here to Logout</a>
          </p>
      </div>
      <div class="tab-pane fade" id="appointment">
          <div class="panel panel-default">
        <form id="formAdd" action="AddAppointmentServlet" method="post">
            <table  style="border-collapse:separate;border-spacing:20px 20px;">
                <tr>

                    <td style="color:black">日期：</td>
                    <td>
                        <input type="date" name="day" />
                    </td>
                    <c:if test="${user.privilege.equals('manager')}">
                    <td style="color:black">预约人：</td>
                    <td>
                        <input type="text" id="user1" name="user"/>
                    </td>
                    </c:if>

                    <td style="color:#ffffff">实验室：</td>
                    <td>
                        <ul class="dowebok">
                            <li><input type="radio" name="location" value="东区-106" data-labelauty="东区-106"></li>
                            <li><input type="radio" name="location" value="华山区-106"data-labelauty="华山区-106"></li>
                            <li><input type="radio" name="location" value="启林区-106" data-labelauty="启林区-106"></li>
                        </ul>
                        <ul class="dowebok">
                            <li><input type="radio" name="location" value="东区-107" data-labelauty="东区-107"></li>
                            <li><input type="radio" name="location" value="华山区-107" data-labelauty="华山区-107"></li>
                            <li><input type="radio" name="location" value="启林区-107" data-labelauty="启林区-107"></li>
                        </ul>
                        <ul class="dowebok">
                            <li><input type="radio" name="location" value="东区-108" data-labelauty="东区-108"></li>
                            <li><input type="radio" name="location" value="华山区-108" data-labelauty="华山区-108"></li>
                            <li><input type="radio" name="location" value="启林区-108" data-labelauty="启林区-108"></li>
                        </ul>

                        <ul class="dowebok">
                            <c:if test="${user.privilege.equals('teacher')||user.privilege.equals('manager')}">
                            <li><input type="radio" name="location" value="东区-109" data-labelauty="东区-109"></li>
                            <li><input type="radio" name="location" value="华山区-109" data-labelauty="华山区-109"></li>
                            <li><input type="radio" name="location" value="启林区-109" data-labelauty="启林区-109"></li>
                            </c:if>
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

                        <div class="dropdown">
                            <select name="period" id="period2">
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <li><option value="第一节课">第一节课</option></li>
                                    <li><option value="第二节课">第二节课</option></li>
                                    <li><option value="第三节课">第三节课</option></li>
                                    <li><option value="第四节课">第四节课</option></li>
                                    <li><option value="第五节课">第五节课</option></li>
                                    <li><option value="第六节课">第六节课</option></li>
                                </ul>
                            </select>
                        </div>
                    </td>
                    <td>
                        <input type="submit" class="btn btn-primary"/>
                    </td>
                </tr>
            </table>
        </form>
          </div>
      </div>
        <div class="tab-pane fade" id="management">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <table>
                        <tr>
                            <td>
                                <c:if test="${user.privilege.equals('manager')}"><h3>所有预约记录</h3></c:if>
                                <c:if test="${!user.privilege.equals('manager')}"><h3>${user.nickname}的预约记录</h3></c:if>

                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>
                                <button type="button" class="btn btn-default btn-lg">
                                    <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                    <a href="ListAppointmentServlet" >Refresh</a>
                                </button>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

                            <td>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal4">
                                    按实验室以及时间查询空余实验室
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myModalLabel4">查询条件</h4>
                                            </div>
                                            <form name="SearchForm2" id="SearchForm2" action="SearchbyLocationServlet" method="post">
                                                <div class="modal-body">
                                                    <table>
                                                        <tr>
                                                            <td>日期</td>
                                                            <td><input type="date" name="day" id="day_Search2" ></td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>实验室</td>
                                                            <td>
                                                                <div class="dropdown">
                                                                    <select name="location" id="location2">
                                                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                                            <li><option value="东区-106">东区-106</option></li>
                                                                            <li><option value="华山区-106">华山区-106</option></li>
                                                                            <li><option value="启林区-106">启林区-106</option></li>
                                                                            <li><option value="东区-107">东区-107</option></li>
                                                                            <li><option value="华山区-107">华山区-107</option></li>
                                                                            <li><option value="启林区-107">启林区-107</option></li>
                                                                            <li><option value="东区-108">东区-108</option></li>
                                                                            <li><option value="华山区-108">华山区-108</option></li>
                                                                            <li><option value="启林区-108">启林区-108</option></li>
                                                                            <li><option value="东区-109">东区-109</option></li>
                                                                            <li><option value="华山区-109">华山区-109</option></li>
                                                                            <li><option value="启林区-109">启林区-109</option></li>
                                                                        </ul>
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary">Continue</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal3">
                                    按日期以及时间查询空余实验室
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myModalLabel1">按下列信息添加用户</h4>
                                            </div>
                                            <form name="AddUserForm1" id="SearchForm1" action="SearchbyDayServlet" method="post">
                                                <div class="modal-body">
                                                    <table>
                                                        <tr>
                                                            <td>日期</td>
                                                            <td><input type="date" name="day" id="day_Search1" ></td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>时间段</td>
                                                            <td>
                                                                <div class="dropdown">
                                                                    <select name="period" id="period1">
                                                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                                            <li><option value="第一节课">第一节课</option></li>
                                                                            <li><option value="第二节课">第二节课</option></li>
                                                                            <li><option value="第三节课">第三节课</option></li>
                                                                            <li><option value="第四节课">第四节课</option></li>
                                                                            <li><option value="第五节课">第五节课</option></li>
                                                                            <li><option value="第六节课">第六节课</option></li>
                                                                        </ul>
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>


                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary">Continue</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </td>

                            </td>
                        </tr>
                    </table>
                </div>
                <div class="panel-body">
                    <table class="table">
                        <th>日期</th><th>时间段</th><th>实验室</th><th>预约人</th><th>操作</th>

                        <c:forEach var="c" items="${sessionScope.list}">
                            <tr>
                                <td>${c.day}</td>
                                <td>${c.period}</td>
                                <td>${c.location}</td>
                                <td>${c.user}</td>

                                <td>
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModa2${c.id}">
                                        取消预约
                                    </button>

                                    <!-- Modal -->
                                    <div class="modal fade" id="myModa2${c.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="myModalLabel2${c.id}">以下为将取消的预约</h4>
                                                </div>
                                                <form id="UserCancelAppointmentForm${c.id}" name="UserCancelAppointmentForm" action="UserCancelApServlet" method="post">
                                                <input name="id" type="hidden" value="${c.id}">
                                                    <div class="modal-body">
                                                       <table>
                                                        <tr>
                                                            <td>日期</td>
                                                            <td>&nbsp;</td>
                                                            <td>${c.day}</td>
                                                        </tr>
                                                           <tr>
                                                               <td>时间段</td>
                                                               <td>&nbsp;</td>
                                                               <td>${c.period}</td>
                                                           </tr>
                                                           <tr>
                                                               <td>实验室</td>
                                                               <td>&nbsp;</td>
                                                               <td>${c.location}</td>
                                                           </tr>

                                                           <tr>
                                                               <td>预约人</td>
                                                               <td>&nbsp;</td>
                                                               <td>${c.user}</td>
                                                           </tr>

                                                       </table>


                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-primary">Continue</button>
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    &nbsp;&nbsp;
                                    <!-- Button trigger modal -->
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal${c.id}">
                                            更改预约
                                        </button>

                                        <!-- Modal -->
                                        <div class="modal fade" id="myModal${c.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title" id="myModalLabel${c.id}">更改表单</h4>
                                                    </div>
                                                    <form name=ModifyAppointmentForm" id="ModifyAppointmentForm${c.id}" action="UserModifyApServlet" method="post">
                                                        <div class="modal-body">
                                                            <table>
                                                                <input name="id" type="hidden" value="${c.id}">
                                                                <tr>
                                                                    <td>修改日期</td>
                                                                    <td><input type="date" name="day" id="day" value="${c.day}"></td>
                                                                </tr>
                                                                <tr><td>&nbsp;</td></tr>
                                                                <tr>
                                                                    <td>时间段</td>
                                                                    <td>
                                                                        <div class="dropdown">
                                                                            <select name="period" id="period">
                                                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                                                    <li><option value="第一节课">第一节课</option></li>
                                                                                    <li><option value="第二节课">第二节课</option></li>
                                                                                    <li><option value="第三节课">第三节课</option></li>
                                                                                    <li><option value="第四节课">第四节课</option></li>
                                                                                    <li><option value="第五节课">第五节课</option></li>
                                                                                    <li><option value="第六节课">第六节课</option></li>
                                                                                </ul>
                                                                            </select>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr><td>&nbsp;</td></tr>
                                                                <tr>
                                                                    <td>实验室</td>
                                                                    <td>
                                                                        <select name="location" id="location1">
                                                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                                                <li><option value="东区-106">东区-106</option></li>
                                                                                <li><option value="华山区-106">华山区-106</option></li>
                                                                                <li><option value="启林区-106">启林区-106</option></li>
                                                                                <li><option value="东区-107">东区-107</option></li>
                                                                                <li><option value="华山区-107">华山区-107</option></li>
                                                                                <li><option value="启林区-107">启林区-107</option></li>
                                                                                <li><option value="东区-108">东区-108</option></li>
                                                                                <li><option value="华山区-108">华山区-108</option></li>
                                                                                <li><option value="启林区-108">启林区-108</option></li>
                                                                                <li><option value="东区-109">东区-109</option></li>
                                                                                <li><option value="华山区-109">华山区-109</option></li>
                                                                                <li><option value="启林区-109">启林区-109</option></li>
                                                                            </ul>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                                <tr><td>&nbsp;</td></tr>
                                                                <c:if test="${sessionScope.user.privilege eq 'manager' }">
                                                                <tr>
                                                                    <td>预约人</td>
                                                                    <td><input name="user" id="user" type="text" value="${c.user}" size="6"></td>
                                                                </tr>
                                                                </c:if>
                                                            </table>


                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">Continue</button>
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                    </div>
                                </td>
                            </tr>

                        </c:forEach>

                    </table>
                    <hr>
                    <br/>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="stat">
            <div class="panel panel-default" >
                <div class="row" >
                    <div class="col-md-2"></div>
                <div class="col-md-6" id="main" style="width: 1500px;height:600px; align:center"></div>
                    <div class="col-md-2"></div>
                <script type="text/javascript">
                    // 基于准备好的dom，初始化echarts实例
                    var myChart = echarts.init(document.getElementById('main'));
                    // 指定图表的配置项和数据
                    var option = {
                        title: {
                            text: '实验室预约次数可视化'
                        },
                        tooltip: {},
                        legend: {
                            data:['预约数']
                        },
                        xAxis: {
                            data: [
                                <c:forEach var="c" items="${sessionScope.locations}">"${c}",</c:forEach>
                                ]
                        },
                        yAxis: {},
                        series: [{
                            name: '预约数',
                            type: 'bar',
                            data: [<c:forEach var="d" items="${sessionScope.AppointmentByLocation}">"${d}",</c:forEach>]
                        }]
                    };
                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
                </script>
                </div>
                </div></div>
        <c:if test="${user.privilege.equals('manager')}">
            <div class="tab-pane fade" id="management1">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <table>
                            <tr>
                                <td>
                                    <h3>所有注册用户信息</h3>
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <button type="button" class="btn btn-default btn-lg">
                                        <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                        <a href="ListUserServlet" >Refresh</a>
                                    </button>
                                </td>

                                <td>

                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

                                <td>
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-primary  btn-lg" data-toggle="modal" data-target="#AddUser">
                                        添加用户
                                    </button>

                                    <!-- Modal -->
                                    <div class="modal fade" id="AddUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="myModalLabel3">按下列信息添加用户</h4>
                                                </div>
                                                <form name="AddUserForm1" id="AddUserForm" action="AddUserServlet" method="post">
                                                    <div class="modal-body">
                                                        <table>
                                                            <tr>
                                                                <td>用户姓名</td>
                                                                <td><input type="text" name="nickname" id="nickname"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>用户密码</td>
                                                                <td><input type="password" name="passwd1" id="passwd1"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>确认用户密码</td>
                                                                <td><input type="password" name="passwd2" id="passwd2"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>用户权限</td>
                                                                <td>
                                                                    <select name="privilege" id="privilege">
                                                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                                            <li><option value="student">student</option></li>
                                                                            <li><option value="teacher">teacher</option></li>
                                                                            <li><option value="manager">manager</option></li>
                                                                        </ul>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-primary">Continue</button>
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </td>

                                </td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <th>用户ID</th><th>用户名</th><th>用户权限</th><th>操作</th>

                            <c:forEach var="d" items="${sessionScope.UserList}">
                                <tr>
                                    <td>${d.id}</td>
                                    <td>${d.nickname}</td>
                                    <td>${d.privilege}</td>

                                    <td><a href="UserDeleteServlet?id=${d.id}">删除</a></td>
                                </tr>

                            </c:forEach>

                        </table>
                        <hr>
                        <br/>
                    </div>
                </div>
            </div>

        </c:if>


        <div class="tab-pane fade" id="intro">
            <nav class="navbar navbar-default">
                <div class="container">
                    <ul id="myTab" class="nav nav-tabs">
                        <li class="active"><a href="#dq" data-toggle="tab">东区实验楼</a></li>
                        <li><a href="#ql" data-toggle="tab">启林实验楼</a></li>
                        <li><a  href="#dy" data-toggle="tab">主校区实验楼</a></li>
                        <li><a href="#hs" data-toggle="tab">华山实验楼</a></li>
                    </ul>
                </div>
            </nav>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="dq">
                    <table>
                        <td><img src="image/1.jpg" alt="东区" height="400" width="600"></td>
                        <td><p style="color:#ffffff; font-size:35px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp本校最新的实验楼，<br/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp拥有齐全的设备、崭新的硬件，<br/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp为您提供更舒适的实验体验。</p ></td>
                    </table>
                </div>
                <div class="tab-pane fade" id="ql">
                    <table>
                        <td><img src="image/2.jpg" alt="启林" height="400" width="600"></td>
                        <td><p style="color:#ffffff; font-size:35px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp本校第二新的实验楼，<br/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp拥有齐全的设备、崭新的硬件，<br/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp为您提供更舒适的实验体验。</p ></td>
                    </table>
                </div>
                <div class="tab-pane fade" id="dy">
                    <table>
                        <td><img src="image/3.jpg" alt="主校区" height="400" width="600"></td>
                        <td><p style="color:#ffffff; font-size:35px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp本校最拥有历史的实验楼，<br/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp拥有齐全的设备、传统的硬件，<br/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp为您提供更有历史感的实验体验。</p ></td>
                    </table>
                </div>
                <div class="tab-pane fade" id="hs">
                    <table>
                        <td><img src="image/4.jpg" alt="华山" height="400" width="600"></td>
                        <td><p style="color:#ffffff; font-size:35px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp本校唯一的野生动物研究实验楼，<br/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp拥有齐全的设备、传统的硬件以及精彩的生物多样性，<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp为您提供更痒的实验体验。</p ></td>
                    </table>
                </div>
            </div>
        </div>
    </div>
  <!--
  <script>
      var obj = new Object();
      obj.abc = 'abc';
      obj.abcd = 'ebj';

      var jsonobj = {"abc": "abc", abcd: "ebj"};
      alert(jsonobj.abc)

      var jsonarray = [{abc2:1},{bac:2}];

      $.ajax({
          type:"POST",
          url:"/login.action",
          data:$('#formAdd').serialize(),
          error:function (XMLHttpRequest, textStatus, errorThrown) {
              alert("error");
          },
          success:function (data, textStatus, jqXHR) {
                data[0].abc2
          }
      });
  </script>-->
</body>
