<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>video</title>
<link href="//cdn.bootcss.com/bootstrap/4.0.0-alpha.3/css/bootstrap.min.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">
<link href="./css/video-js.min.css" rel="stylesheet">
<!-- 导入jquery -->
<script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/2.0.3/jquery-2.0.3.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/4.0.0-alpha.3/js/bootstrap.min.js"></script>
<script src="./js/video.min.js"></script>
<script type="text/javascript">
	function getQueryString(key){
        var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
        var result = window.location.search.substr(1).match(reg);
        return result?decodeURIComponent(result[2]):null;
      }
	$(function() {
		var href="";
		href=encodeURI(getQueryString("href"));
		$("video").attr("src",href);
		videojs("videoHome", {}, function(){
		  // Player (this) is initialized and ready.
		});
	});
</script>
<style>
.videoRoom{
  text-align:center;
  margin-top:8rem
}
.video-js{
	margin: 0 auto;
	width:45rem;
	height:30rem;
}
</style>
</head>
<body>
<div id="main">
<div class="container-fluid">
  <div class="row">
  	<div class="col-xs-12 col-md-12 header"><h1>Hello Word</h1></div>
	<div class="col-xs-12 col-md-12 videoRoom"><video id="videoHome" class="video-js vjs-default-skin" src="" autoplay="autoplay" controls='controls'></video></div>
  </div>
</div>
</div>
</body>
