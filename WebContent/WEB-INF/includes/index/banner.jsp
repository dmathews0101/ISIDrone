<%@page import="util.Const"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="row carousel-holder">

    <div class="col-md-12">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <a href="items?category=2"><img class="slide-image" src="<%=Const.PATH_IMG + "/ban1.jpg"%>" alt=""></a>
                </div>
                <div class="item">
                    <a href="items?category=3"><img class="slide-image" src="<%=Const.PATH_IMG + "/ban2.jpg"%>" alt=""></a>
                </div>
                <div class="item">
                    <a href="items?category=2"><img class="slide-image" src="<%=Const.PATH_IMG + "/ban3.jpg"%>" alt=""></a>
                </div>
            </div>
            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
        </div>
    </div>

</div>