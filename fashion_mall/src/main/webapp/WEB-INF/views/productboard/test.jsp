<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/master/itemInsert" method="post" name="itemInsertForm" id="itemInsertForm"
enctype="multipart/form-data">
<div class="tab-content">
    <!-- 상품등록 -->
    <div class="tab-pane active" id="itemInsert_1">
        <div class="form-group" style="">

            <h3>대분류</h3>
            <select class="form-control" name="item_catemain"
                id="item_catemain" title="상품 대분류">
                <option value="item">일반상품</option>
                <option value="mainpage">메인페이지</option>
                <option value="popularitem">인기상품</option>
            </select>
            <h3>소분류</h3>
            <select class="form-control" name="item_catesub"
                id="item_catesub" title="상품 소분류">
                <option value="jumper">Jumper</option>
                <option value="coat">Coat</option>
                <option value="jacket">Jacket</option>
                <option value="padding">Padding</option>
                <option value="shirts">Shirts</option>

            </select>
        </div>
        <hr class="divider-w mt-10 mb-20">
        <div class="form-group">
            <h3>상품명</h3>
            <input class="form-control input-lg" type="text"
                placeholder="상품명" name="item_name" id="item_name" />
        </div>
        <hr class="divider-w mt-10 mb-20">
        <div class="form-group">
            <h3>판매가</h3>
            <input class="form-control input-lg" type="number"
                placeholder="판매가 / 단위 : 원" name="item_price" id="item_price" />
        </div>
        <hr class="divider-w mt-10 mb-20">

        <div class="form-group">
            <h3>사이즈</h3>
            <input class="form-control input-lg" type="text"
                placeholder="사이즈" name="item_size" id="item_size" />
        </div>
        <hr class="divider-w mt-10 mb-20">
        <div class="form-group">
            <h3>색상</h3>
            <input class="form-control input-lg" type="text"
                placeholder="색상" name="item_color" id="item_color" />
        </div>
        <hr class="divider-w mt-10 mb-20">

        <div class="form-group">
            <h3>상품설명</h3>
            <input class="form-control input-lg" type="text"
                placeholder="상품설명" name="item_subcontent"
                id="item_subcontent" />
        </div>
        <hr class="divider-w mt-10 mb-20">

        <div class="form-group">
            <h3>모델정보</h3>
            <input class="form-control input-lg" type="text"
                placeholder="모델정보" name="item_model" id="item_model" />
        </div>
        <hr class="divider-w mt-10 mb-20">

        <!-- 상품내용 에디터 -->

        <div class="form-group">
            <h3>상품내용</h3>
            <textarea class="form-control input-lg"
                placeholder="내용을 입력하세요" name="item_content" id="item_content">
                </textarea>


    </div>

    <!-- 상품등록 끝-->


    <!--  상품옵션 -->
    <div class="tab-pane" id="itemInsert_2">


        <button id="optionAdd_btn" class="btn btn-primary mb-3"
            type="button">옵션추가</button>

        <div id="optionIndex"></div>
        <br />
        <div class="form-group mt-3">
            <input class="form-control input-lg " type="text"
                placeholder="최소 1개의 옵션이 필요합니다. ex) 100 , red /// 95 , blue "
                readonly />
        </div>

    </div>
    <!--  상품옵션 끝 -->



    <!--  상품이미지 -->
    <div class="tab-pane" id="itemInsert_3">

        <div class="form-group">
            <h3>메인이미지 ( 썸네일 )</h3>
            <input class="form-control input-lg" type="file"
                name="itemMainImg" id="itemMainImg" />
        </div>
        
        <div class="form-group">
            <h3>서브이미지 ( 썸네일에 마우스 올릴시 )</h3>
            <input class="form-control input-lg" type="file"
                name="itemSubImg" id="itemSubImg" />
        </div>
        
    
        <button class="btn btn-d btn-circle" type="button"
            onclick="fnSubmit(); return false;">상품등록</button>


    </div>
</form>


<!--  상품이미지 끝 -->






</div>
<script src="/resources/js/test.js"></script> 
<%@include file="../include/footer.jsp" %>