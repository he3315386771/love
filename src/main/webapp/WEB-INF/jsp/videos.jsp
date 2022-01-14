<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>回忆</title>
    <script type="text/javascript" src="love/index_files/jquery.min.js"></script>
    <style>
        div {
            width: 100%;
        }
        video {
            width: 100%;
        }
    </style>
    <script>
        $(function (){
            var vs = document.getElementsByTagName("video");
            $.each(vs,function (i,v){
                v.addEventListener('play',function () {
                    $.each(vs,function (i,v1){
                        if(v!=v1){
                            v1.pause()
                        }
                    })
                    var i = window.setInterval(function () {
                        if(v.paused || v.ended){
                            clearInterval(i);
                        }
                    }, 20)
                },false);
              /*  //监听播放时间,具体到毫秒
                var vkey1 = true;
                var vkey2 = true;
                v.addEventListener("timeupdate",function() {
                    var timeDisplay;
                    //用秒数来显示当前播放进度
                    timeDisplay = v.currentTime;
                    if (timeDisplay > 62.5 && vkey1) {
                        v.pause();
                        $(".vbox .one").show();
                        vkey1= false;
                    }
                    if (timeDisplay > 79.7 && vkey2) {
                        v.pause();
                        $(".vbox .two").show();
                        vkey2 = false;
                    }
                },false)*/
            })
        })
    </script>
</head>
<body>

<c:forEach items="${list}" var="next">
    <div>
        <video controls="controls">
            <source src="${pageContext.request.contextPath.concat(next)}" type="video/mp4">
            <source src="${pageContext.request.contextPath.concat(next)}" type="video/ogg">
            <source src="${pageContext.request.contextPath.concat(next)}" type="video/webm">
            <object data="${pageContext.request.contextPath.concat(next)}">
                <embed src="${pageContext.request.contextPath.concat(next)}">
            </object>
        </video>
    </div>
</c:forEach>

<%--<c:forEach items="${list}" var="next">
    <div>
        <video controls="controls">
            <source src="${next}" type="video/mp4">
            <source src="${next}" type="video/ogg">
            <source src="${next}" type="video/webm">
            <object data="${next}">
                <embed src="${next}">
            </object>
        </video>
    </div>
</c:forEach>--%>
</body>
</html>
