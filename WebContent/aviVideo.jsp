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
		var href="";
		href=encodeURI(getQueryString("href"));
		var rooms='<object id="MediaPlayer" classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" width="800" height="600" standby="Loading Windows Media Player components…" type="application/x-oleobject" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,7,1112">'
		    +'<param name="FileName" value="test.avi">'
	    	+'<param name="AutoStart" value="true">'
	    	+'<param name="ShowControls" value="true">'
	    	+'<param name="BufferingTime" value="2">'
	    	+'<param name="ShowStatusBar" value="true">'
	    	+'<param name="AutoSize" value="true">'
	    	+'<param name="InvokeURLs" value="false">'
	    	+'<param name="AnimationatStart" value="1">'
	    	+'<param name="TransparentatStart" value="1">'
	    	+'<param name="Loop" value="1">'
	    	+'<embed type="application/x-mplayer2" src="'+href+'" name="MediaPlayer" autostart="1" showstatusbar="1" showdisplay="1" showcontrols="1" loop="0" videoborder3d="0" pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" width="800" height="600"></embed>'
	    	+'</object>'
		$(".videoRoom").append(rooms);
	});
</script>
<style>
.videoRoom{
  text-align:center;
  margin-top:8rem
}
.video-js{
	margin: 0 auto;
}
</style>
</head>
<body>
<div id="main">
<div class="container-fluid">
  <div class="row">
  	<div class="col-xs-12 col-md-12 header"><h1>Hellow Word</h1></div>
	<div class="col-xs-12 col-md-12 videoRoom">
	<!-- http://localhost:8080/ace.avi -->
	</div>
  </div>
</div>
</div>
</body>
