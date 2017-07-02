<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>\

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome to the openLab</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery-labelauty.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </head>
  <body style="background-image: url(/image/nature1.jpg)">
    <div class="jumbotron page-header">
      <h1>Open Laboratory<small>At your service</small></h1>

    </div>
    <div id="myTabContent" class="tab-content">
      <div class="panel panel-default">
        <div class="panel-heading"><h3>按日期搜索结果</h3><a href="/Menu.jsp">
          返回主菜单</a></div>

          <div class="panel-body">
            <table class="table">
              <th>实验室</th><th>时间段</th><th>日期</th><th>状态</th><th>操作</th>
              <c:forEach var="c" items="${requestScope.AvaliableList}">
              <tr>
                <td>${c.location}</td>
                <td>${c.period}</td>
                <td><fmt:formatDate value="${c.day}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                <td>空闲</td>
                <td>
                  <!-- Button trigger modal -->
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal${c.location}${c.period}<fmt:formatDate value="${c.day}" pattern="yyyy-MM-dd"></fmt:formatDate>">
                    预约
                  </button>

                  <!-- Modal -->
                  <div class="modal fade" id="myModal${c.location}${c.period}<fmt:formatDate value="${c.day}" pattern="yyyy-MM-dd"></fmt:formatDate>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                          <h4 class="modal-title" id="myModalLabel${c.location}${c.period}<fmt:formatDate value="${c.day}" pattern="yyyy-MM-dd"></fmt:formatDate>">请确认预约信息</h4>
                        </div>
                        <form name="Searchform" id="Searchform${c.location}${c.period}<fmt:formatDate value="${c.day}" pattern="yyyy-MM-dd"></fmt:formatDate>" action="AddAppointmentServlet" method="post">
                          <div class="modal-body">

                          <!--  <table>
                              <tr>
                                <td>日期</td>
                                <td><input type="date" name="day" id="day" value="<fmt:formatDate value="${c.day}" pattern="yyyy-MM-dd"></fmt:formatDate>"  disabled="disabled"></td>
                              </tr>
                              <tr><td>&nbsp;</td></tr>
                              <tr>
                                <td>时间段</td>
                                <td>
                                  <input type="text" name="period" id="period" value="${c.period}"  disabled="disabled">
                                </td>
                              </tr>
                              <tr><td>&nbsp;</td></tr>
                              <tr>
                                <td>实验室</td>
                                <td>
                                  <input type="text" name="location" id="location" value="${c.location}"  disabled="disabled">
                                </td>
                              </tr>
                              <tr>
                              <tr><td>&nbsp;</td></tr>

                                <td>预约人</td>
                                <td>
                                  ${user.nickname}
                                </td>
                              </tr>
                            </table>
                          -->
                            <table  style="border-collapse:separate;border-spacing:20px 20px;">
                              <tr>
                                <td style="color:black">日期：</td>
                                <td>
                                  <input type="date" name="day" value="<fmt:formatDate value="${c.day}" pattern="yyyy-MM-dd"></fmt:formatDate>"/>
                                </td>
                                <td style="color:black">实验室：</td>
                                <td>
                                  <input type="text" name="location" id="location" value="${c.location}">
                                </td>

                              </tr>
                              <tr>

                                <td style="color:black">时间段：</td>
                                <td>
                                  <input type="text" name="period" id="period2" value="${c.period}">
                                </td>
                                <c:if test="${user.privilege.equals('manager')}">
                                  <td style="color:black">预约人：</td>
                                  <td>
                                    <input type="text" id="user1" name="user"/>
                                  </td>
                                </c:if>
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
              </tr>
              </c:forEach>
               </table>

          </div>
        </div>
      </div>
    </div>
</body>
