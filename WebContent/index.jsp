<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Hello World</title>
<link href="//cdn.bootcss.com/bootstrap/4.0.0-alpha.3/css/bootstrap.min.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">
<!-- 瀵煎叆jquery -->
<script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/2.0.3/jquery-2.0.3.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/4.0.0-alpha.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function serch(path){
		var base = '${base}';
		var baseurl=window.location.host;
		var fileUrl="http://"+baseurl.split(":")[0]+":8080";
		$.ajax({
			url : base + "/user/serch",
			type: "POST",
			data:{path:path},
			dataType:"json",
			success:function(data){
				$.each(data,function(){
					var length=this.name.split(".").length;
					var houzhui="."+this.name.split(".")[length-1];
					var fileName=this.name.split(houzhui)[0];					
						if(this.type=="0")
						{
							if(houzhui==".jpg"||houzhui==".jpeg"||houzhui==".gif"||houzhui==".bmp"||houzhui==".png")
							{
								$("#video_list").append("<div class='col-xs-6 col-sm-4 col-md-3 col-lg-2'>"
										+"<div class='pictureRoom' pictureHref='"+this.absolutepath+"'><img src='"+fileUrl+this.path+"' title='"+this.name+"'></div></div>");
							}
							else{
								if(houzhui!=".rmvb"&&houzhui!=".rm"){
									$("#video_list").append("<div class='col-xs-6 col-sm-4 col-md-3 col-lg-2'>"
											+"<div class='listRoom' videoHref='"+fileUrl+this.path+"'><img src=''><p title='"+this.name+"("+(this.size/1073741824).toFixed(2)+")'>"
											+(fileName.length>6?fileName.substr(0, 6)+".."+houzhui:this.name)+"</p></div></div>");
								}
							}
						}
						else if(this.type=="1"){
							$("#video_list").append("<div class='col-xs-6 col-sm-4 col-md-3 col-lg-2'>"
									+"<div class='fileRoom' fileHref='"+this.absolutepath+"'><img src=''><p title='"+this.name+"("+(this.size/1073741824).toFixed(2)+")'>"
									+(fileName.length>6?fileName.substr(0, 6)+"..":this.name)+"</p></div></div>");
						}
					})
				$(".listRoom").bind("click",function(){
	 				var href=$(this).attr("videoHref");
	 				var length=href.split(".").length;
					var houzhui=href.split(".")[length-1];
	 				if(houzhui=="avi"||houzhui=="wmv")
 					{
	 					window.open("./aviVideo.jsp?href="+href);
 					}
	 				else{
	 					window.open("./video.jsp?href="+href);
	 				}
	 			})
	 			$(".pictureRoom").bind("click",function(){
	 				var href=$(this).attr("pictureHref");
					var fileName=$(this).find("img").attr("title");
					var pictureFileSrc=href.substr(0,href.length-fileName.length);
	 				window.open("./picture.jsp?href="+pictureFileSrc+"&fileName="+fileName);
	 			})
	 			$(".fileRoom").bind("click",function(){
	 				$("#video_list").empty();
	 				serch($(this).attr("fileHref"));
	 			})
			}
		});
	}
	$(function() {
			serch("");
	});
</script>
</head>
<body>
<div id="main">
<div class="container-fluid">
  <div class="row">
	<div class="col-xs-12 col-md-12 header"><h1>Hello Word</h1></div>
    <div class="col-xs-12 col-md-12" id="video_list"></div>
  </div>
</div>
</div>
</body>
</html>