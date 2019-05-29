<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/krry_page.js"></script>

<script type="text/javascript">
         
         var krryAdminBlog = {
             initPage:function(itemCount){
                $("#krryPage").tzPage(itemCount, {
                   num_display_entries : 5, //主体页数
                    num_edge_entries : 4,//边缘页数
                    current_page : 0,//指明选中页码
                  items_per_page : 10, //每页显示多少条
                     prev_text : "上一页",
                     next_text : "下一页",
                     showGo:true,//显示
                     showSelect:false,
                     callback : function(pageNo, psize) {//会回传两个参数，第一个是当前页数，第二个是每页要显示的数量
                        krryAdminBlog.loadData(pageNo,psize);
                    }
                });
             },
            //设置data参数：pageNo（下一页）：就是当前页数 * 下一页要显示的数量
            //            pageSize（下一页）：已经查询出来的数量（pageNo）  + 每页要显示的数量
            //在数据库中是  WN <= pageSize and WN > pageNo 来查询分页数据
            loadData:function(pageNo,pageSize){
                pageNo = pageNo * pageSize;
                pageSize = pageNo + 10;
                $.ajax({
                    type:"post",
                    url:basePath+"/loadData",
                   data:{pageNo:pageNo,pageSize:pageSize},
                     success:function(data){
                         if(data){
                             var html = "";
                             var blogArr = data.blogs;
                             for(var i=0,len=blogArr.length;i < len;i++){
                                 var json = blogArr[i];
                                 html+= "<tr>"+
                                 "    <td><a class='t_avbiaoq' title='"+json.TITLE+"'>"+json.TITLE+"</a></td>"+
                                 "    <td><a class='t_avbiaoq' title='"+json.NAME+"'>"+json.MUSICTOR+"</a></td>"+
                                 "    <td><a class='t_avbiaoq' title='"+json.MUSICTITLE+"'>"+json.MUSICTITLE+"</a></td>"+
                                "    <td>"+json.CREATETIME+"</td>"+
                                 "</tr>";
                            }
                             $("#tbody").html(html);
                         }
                     }
                 });
             }
         };
        
         krryAdminBlog.initPage($("#tbody").data("itemcount"));
    </script>

</head>
<body>

<div id="krryPage"></div>
</body>

</html>
