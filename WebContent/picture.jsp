<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>picture</title>
<link href="//cdn.bootcss.com/bootstrap/4.0.0-alpha.3/css/bootstrap.min.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">
<!-- 导入jquery -->
<script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/2.0.3/jquery-2.0.3.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/4.0.0-alpha.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function getQueryString(key){
        var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
        var result = window.location.search.substr(1).match(reg);
        return result?decodeURIComponent(result[2]):null;
      }
	$(function() {
		var base = '${base}';
		path=getQueryString("href");
		var baseurl=window.location.host;
		var fileUrl="http://"+baseurl.split(":")[0]+":8080";
		var filelistobj={};
		$.ajax({
			url : base + "/user/serch",
			type: "POST",
			data:{path:path},
			dataType:"json",
			success: function(data) {
				filelistobj=data;
				$.each(data,function(index){
					var length=this.name.split(".").length;
					var houzhui="."+this.name.split(".")[length-1];
					if(this.name==getQueryString("fileName")){
						$(".pictureRooms img").attr("src",fileUrl+this.path);
						$(".pictureRooms img").attr("index",index);
						$(".prevPage").attr("index",index-1);
						$(".nextPage").attr("index",parseInt(index)+1);
					}
				})
				if($(".pictureRooms img").height()<10){
					$(".prevPage,.nextPage").height(window.screen.height);
				}
				else{
					$(".prevPage,.nextPage").height($(".pictureRooms img").height());
				}
			}
		});
		$(".prevPage").bind("click",function(){
			var index=$(this).attr("index");
			if(index=="-1"){
				alert("没有上一页了");
			}
			else{
				$(".pictureRooms img").attr("src",fileUrl+filelistobj[index].path);
				$(".pictureRooms img").attr("index",index);
				$(".prevPage").attr("index",index-1);
				$(".nextPage").attr("index",parseInt(index)+1);
			}
		});
		$(".nextPage").bind("click",function(){
			var index=$(this).attr("index");
			if(!!filelistobj[index]==0){
				alert("最后一页了");
			}
			else{
				$(".pictureRooms img").attr("src",fileUrl+filelistobj[index].path);
				$(".pictureRooms img").attr("index",index);
				$(".prevPage").attr("index",index-1);
				$(".nextPage").attr("index",parseInt(index)+1);
			}
		});
	});
</script>
<style>
.pictureRooms{
  text-align:center;
  padding:0;
}
.pictureRooms img{
	width:100%;
	height: 100%;
}
.prevPage,.nextPage{
	top:0;
	opacity: 0;
	position: fixed;
}
.prevPage{
	left:0;
	background-color:red;
}
.nextPage{
	right:0;
	background-color:blue;
}
</style>
</head>
<body>
<div id="main">
<div class="container-fluid">
  <div class="row">
	<div class="col-xs-12 col-md-12 pictureRooms">
		<div class="col-xs-6 col-md-6 prevPage"></div>
		<img src="">
		<div class="col-xs-6 col-md-6 nextPage"></div>
	</div>
  </div>
</div>
</div>
</body>
