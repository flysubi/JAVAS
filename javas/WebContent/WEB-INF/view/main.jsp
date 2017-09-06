<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<span style="FONT-SIZE: 10pt; FONT-FAMILY: Arial">

<style>
    .slide, .slidectrl {
        list-style:none;
        padding:0;
        margin:0;
    }
     
    .slidebox {
        width:1600;
        overflow:hidden;
        position:relative;
        height:600px;
    }
     
    .slide {
        width:4800px;
        height:150px;
        position:absolute;
        left:0;
    }
     
    .slide li {
        display:inline-block;
        width:1600px;
        height:600px;  
        text-align:center;
        color:white;
        font-size:30px;
        line-height:150px;
        margin-right:-4px;
    }
     
    .slidectrl {
        width:300px;
        text-align:center;
        margin-top:10px;
    }
     
    .slidectrl li {
        display:inline-block;
    }
</style>
 
<div class="slidebox">
    <ul class="slide">
       <li><img alt="main" src="/style/새메인.png" ></li>
       <li><img alt="good" src="/style/좋은점.png"></li>
       <li><img alt="pluse" src="/style/추가혜택.png"></li>
    </ul>
</div> 

<div>
 <img alt="javas" src="/style/javas1.png">
 <img alt="join" src="/style/가입문1.png">
</div>
 
<script>
    var idx = 0;
    var slidemax = 2;
    var pos = 1600;
 
    function sliding(add) {
        idx = idx + add;
        if(idx < 0) idx = slidemax;
        else if(idx > slidemax) idx = 0;
        $('.slide').stop().animate({'left' : -(idx*pos)+"px"}, "slow");
    }
     
    autoslide = setInterval(function() { sliding(1) }, 5000);
     
    function after() {
        setTimeout(function() {
            clearInterval(autoslide);  
            autoslide = setInterval(function() { sliding(1) }, 3000);
        }, 2000);
    }
     
    $('#leftbtn, #rightbtn').click(function() {
        clearInterval(autoslide);  
        if($(this).attr('id') == "leftbtn") sliding(-1);
        else sliding(1);
        after();
    });
     
    $('.slidepos > button').click(function() {
        clearInterval(autoslide);  
        idx = $(this).index(); 
        sliding(0);
        after();
    });
</script>
</span>


