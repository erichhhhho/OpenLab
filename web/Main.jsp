<%--
  Created by IntelliJ IDEA.
  User: liam
  Date: 2017/6/9
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>方正开放式实验室管理平台</title>
    <link rel="stylesheet" href="style0.css" type="text/css" />
    <script type="text/javascript">
        window.onload=function(){
            function $(id){return document.getElementById(id)}
            var menu=$("topTags").getElementsByTagName("ul")[0];//顶部菜单容器
            var tags=menu.getElementsByTagName("li");//顶部菜单
            var ck=$("leftMenu").getElementsByTagName("ul")[0].getElementsByTagName("li");//左侧菜单
            var j;
            //点击左侧菜单增加新标签
            for(i=0;i<ck.length;i++){
                ck[i].onclick=function(){
                    $("welcome").style.display="none"//欢迎内容隐藏
                    clearMenu();
                    this.style.background='url(image/f1_03.gif)'
                    //循环取得当前索引
                    for(j=0;j<4;j++){
                        if(this==ck[j]){
                            if($("p"+j)==null){
                                openNew(j,this.innerHTML);//设置标签显示文字
                            }
                            clearStyle();
                            $("p"+j).style.background='url(image/tabbg1.gif)';
                            $("p"+j).style.color ='#000000';
                            clearContent();
                            $("c"+j).style.display="block";
                        }
                    }
                    return false;
                }
            }
//增加或删除标签
            function openNew(id,name){
                var tagMenu=document.createElement("li");
                tagMenu.id="p"+id;
                tagMenu.innerHTML=name+""+"<img src='image/off.gif' style='vertical-align:middle'/>";
//标签点击事件
                tagMenu.onclick=function(evt){
                    clearMenu();
                    ck[id].style.background='url(image/f1_03.gif)'
                    clearStyle();
                    tagMenu.style.background='url(image/tabbg1.gif)';
                    tagMenu.style.color ='#000000';
                    clearContent();
                    $("c"+id).style.display="block";
                }
//标签内关闭图片点击事件
                tagMenu.getElementsByTagName("img")[0].onclick=function(evt){
                    evt=(evt)?evt:((window.event)?window.event:null);
                    if(evt.stopPropagation){evt.stopPropagation()} //取消opera和Safari冒泡行为;
                    this.parentNode.parentNode.removeChild(tagMenu);//删除当前标签
                    var color=tagMenu.style.backgroundColor;
//设置如果关闭一个标签时，让最后一个标签得到焦点
                    if(color=="#ffff00"||color=="yellow"){//区别浏览器对颜色解释
                        if(tags.length-1>=0){
                            clearStyle();
                            tags[tags.length-1].style.background='url(image/tabbg1.gif)';
                            clearContent();
                            var cc=tags[tags.length-1].id.split("p");
                            $("c"+cc[1]).style.display="block";
                            clearMenu();
                            ck[cc[1]].style.background='url(image/tabbg1.gif)';
                        }
                        else{
                            clearContent();
                            clearMenu();
                            $("welcome").style.display="block"
                        }
                    }
                }
                menu.appendChild(tagMenu);
            }
//清除菜单样式
            function clearMenu(){
                for(i=0;i<ck.length;i++){
                    ck[i].style.background='url(image/tabbg01.gif)';
                }
            }
//清除标签样式
            function clearStyle(){
                for(i=0;i<tags.length;i++){
                    var dTag = menu.getElementsByTagName("li")[i];
                    dTag.style.background='url(image/tabbg2.gif)';
                    dTag.style.color ='#59814C';
                    //alert(dTag.outerHTML);
                }
            }
//清除内容
            function clearContent(){
                for(i=0;i<3;i++){
                    $("c"+i).style.display="none";
                }
            }
        }
    </script>
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
    <link rel="stylesheet" href="css/jquery-labelauty.css">
    <style>
        input.labelauty + label { font: 12px "Microsoft Yahei";}
    </style>
</head>

<body>

<div id=top>
    <div id=logo></div>
    <div id=xx>
        <div id=hy>您好，liam</div><!--这里改为用户名 -->
        <div id=topTags>
            <ul></ul> <!-- js代码会自动添加li项 -->
        </div>
    </div>
</div>
<!---->
<div id=zhong>
    <div id=zb>
        <div id=shb>
            <ul>
                <li class="aa" onmouseover="this.className='bb'" onmouseout="this.className='aa'"><a href="#">修改密码</a></li>
                <li class="cc" onmouseover="this.className='dd'" onmouseout="this.className='cc'"><a href="#">退出登录</a></li>
            </ul>
        </div>
        <div id=sys><img src="image/icon01.gif" width="11" height="6" /> 功能</div>
        <div id=leftMenu>
            <div id="leftMenuPic"></div>
            <ul>
                <li>实验室预约</li>
                <li>个人预约管理</li>
                <li>查询</li>
            </ul>
        </div>
        <div id=sys2><img src="image/icon01.gif" width="11" height="6" /> 系统通知</div>
        <div id=ot>明天凌晨一点半到三点系统停机维护</div>
    </div>



    <div id=content>
        <div id=sm>晚上好 Liam </div>
        <div id=welcome class=content style="display:block;">
            <div align=center1>
                <p>&nbsp;</p>
                <p><strong>欢迎使用开放实验室预约管理系统！</strong></p>
                <p>&nbsp;</p>
            </div>
        </div>

        <div id="c0" class="content">
            <form>
                <table>
                    <tr>
                        <td>日期：</td>
                        <td>
                            <input type="date" name="reservation_date" />
                        </td>
                    </tr>
                    <tr>
                        <td>时间段：</td>
                        <td>
                            <input onclick="hide('HMF-1')" type="text" value="请选择时间段" id="am" class="am" name="time"/>
                            <div id="HMF-1" style="display: none " class="bm">
                                <span id="a1" onclick="pick('第一节课')" onMouseOver="bgcolor('a1')" onMouseOut="nocolor('a1')" class="cur">第一节课</span>
                                <span id="a2" onclick="pick('第二节课')" onMouseOver="bgcolor('a2')" onMouseOut="nocolor('a2')" class="cur">第二节课</span>
                                <span id="a3" onclick="pick('第三节课')" onMouseOver="bgcolor('a3')" onMouseOut="nocolor('a3')" class="cur">第三节课</span>
                                <span id="a4" onclick="pick('第四节课')" onMouseOver="bgcolor('a4')" onMouseOut="nocolor('a4')" class="cur">第四节课</span>
                                <span id="a5" onclick="pick('第五节课')" onMouseOver="bgcolor('a5')" onMouseOut="nocolor('a5')" class="cur">第五节课</span>
                                <span id="a6" onclick="pick('第六节课')" onMouseOver="bgcolor('a6')" onMouseOut="nocolor('a6')" class="cur">第六节课</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>实验室：</td>
                        <td>
                            <table>
                            <tr class="dowebok">
                                <td><input type="radio" name="radio" data-labelauty="东区-106 "></td>
                                <td><input type="radio" name="radio" data-labelauty="华山区-106"></td>
                                <td><input type="radio" name="radio" data-labelauty="启林区-106"></td>
                            </tr>
                            <tr class="dowebok">
                                <td><input type="radio" name="radio" data-labelauty="东区-107 "></td>
                                <td><input type="radio" name="radio" data-labelauty="华山区-107"></td>
                                <td><input type="radio" name="radio" data-labelauty="启林区-107"></td>
                            </tr>
                            <tr class="dowebok">
                                <td><input type="radio" name="radio" data-labelauty="东区-108 "></td>
                                <td><input type="radio" name="radio" data-labelauty="华山区-108"></td>
                                <td><input type="radio" name="radio" data-labelauty="启林区-108"></td>

                            </tr>
                                <tr class="dowebok">
                                    <td><input type="radio" name="radio" data-labelauty="东区-109 "></td>
                                    <td><input type="radio" name="radio" data-labelauty="华山区-109"></td>
                                    <td><input type="radio" name="radio" data-labelauty="启林区-109"></td>

                                </tr>
                            </table>
                            <script src="js/jquery-1.8.3.min.js"></script>
                            <script src="js/jquery-labelauty.js"></script>
                            <script>
                                $(function(){
                                    $(':input').labelauty();
                                });
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div id="c1" class="content">个人预约管理</div>
        <div id="c2" class="content">
            <div style="margin:30px auto; width:300px; height:300px; background:#fff;">
                <h2 style="text-align:center; margin-top:20px;"></h2>
                <div class="style_1">
                    <form method="get" id="searchform" action="http://www.quickui.net/">
                        <fieldset>
                            <input id="s" name="s" type="text" value="Enter Keyword" class="text_input" onblur="if(this.value==''){this.value='Enter Keyword';}" onfocus="if(this.value =='Enter Keyword') {this.value=''; }" />
                            <input name="submit" type="submit" value /> </fieldset>
                    </form>
                </div>
                <div class="style_2">
                    <form method="get" id="searchform" action="http://www.quickui.net/">
                        <fieldset>
                            <input id="s" name="s" type="text" value="Enter Keyword" class="text_input" onblur="if(this.value==''){this.value='Enter Keyword';}" onfocus="if(this.value =='Enter Keyword') {this.value=''; }" />
                            <input name="submit" type="submit" value /> </fieldset>
                    </form>
                </div>
                <div class="style_3">
                    <form method="get" id="searchform" action="http://www.quickui.net/">
                        <fieldset>
                            <input id="s" name="s" type="text" value="Enter Keyword" class="text_input" onblur="if(this.value==''){this.value='Enter Keyword';}" onfocus="if(this.value =='Enter Keyword') {this.value=''; }" />
                            <input name="submit" type="submit" value /> </fieldset>
                    </form>
                </div>
                <div class="style_4">
                    <form method="get" id="searchform" action="http://www.quickui.net/">
                        <fieldset>
                            <input id="s" name="s" type="text" value="Enter Keyword" class="text_input" onblur="if(this.value==''){this.value='Enter Keyword';}" onfocus="if(this.value =='Enter Keyword') {this.value=''; }" />
                            <input name="submit" type="submit" value /> </fieldset>
                    </form>
                </div>
                <div class="style_5">
                    <form method="get" id="searchform" action="http://www.quickui.net/">
                        <fieldset>
                            <input id="s" name="s" type="text" value="Enter Keyword" class="text_input" onblur="if(this.value==''){this.value='Enter Keyword';}" onfocus="if(this.value =='Enter Keyword') {this.value=''; }" />
                            <input name="submit" type="submit" value /> </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
