<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file = "../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
	<div class="container center-contents">
		<div class="row">
			<form method="" class="form-signin">
				<h1 class="h2 mb-3 font-weight-normal">상품등록</h1>
				
				<div class="panel-heading"></div>
				
				<div class="form-group">
					<label for="pName" class="sr-only">상품명</label>
					<input type="text" id="pName" name="pName" class="form-control" placeholder="상품명" required autofocus/>
				</div>
				
				<div class="form-group">
					<label for="price" class="sr-only">상품가격</label>
					<input type="text" id="price" name="price" class="form-control" placeholder="상품가격" required/>
				</div>
				
				<div class="form-group">
					<label class="sr-only">상품옵션</label>
					<select name="select1" id="pType" class="form-control">
						<option value="upper">상의</option>
						<option value="pants">하의</option>
						<option value="outer">아우터</option>
						<option value="shoes">신발</option>
						<option value="accessory">악세사리</option>
					</select> 
					<select name ="select2" id="pSize" class="form-control">
						<option value="S">S</option>
						<option value="M">M</option>
						<option value="L">L</option>
					</select>
					<select name ="select3" id="pColor" class="form-control">
						<option value="black">black</option>
						<option value="red">red</option>
						<option value="blue">blue</option>
						<option value="green">green</option>
						<option value="yellow">yellow</option>
						<option value="white">white</option>
					</select>
				</div>
				
				<div class="form-group">
					<label for="pContent" class="sr-only">상품내용</label>
					<textarea class="form-control" rows="4" name="pContent" id="pContent"></textarea> 
				</div>

				<div class="form-group">
					<label for="pAmount" class="sr-only">상품재고</label>
					<input type="text" id="pAmount" name="pAmount" class="form-control" placeholder="상품재고" required/>
				</div>
				
				<button class="btn btn-warning" type="button">상품등록</button>
				<button class="btn btn-danger" type="button">상품옵션등록</button>
				<button class="btn btn-success" type="button">상품코드확인</button>
				<button class="btn btn-lg btn-primary btn-block" type="submit">글등록</button>
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
				</form>
		</div>
	</div>
<script>
$(function(){
	
	$("[name='select1']").change(function(){
		var uppers = ["S","M","L"];
		var pantss = ["30","32","34","36"];
		var outers = ["free","winter","summer"];
		var shoeses = ["230", "240", "250", "260", "270"];
		var accessories = ["bracelet","necklace","ring","earrings"];
		
		var upperC = ["black", "red", "blue", "green", "yellow"];
		var pantsC = ["black", "white", "beige", "charcoal", "blue"];
		var outerC = ["black","white","blue", "red", "pink"];
		var shoesC = ["black", "white", "blue", "red"];
		var accessoryC = ["gold","sliver","platinum","iron"];
		
		var selectItem = $("[name='select1']").val();
		
		var changeItem;
		var changeColor;
		if(selectItem == "upper"){  
			changeItem = uppers;
			changeColor = upperC;
		}else if(selectItem == "pants"){ 
			changeItem = pantss;
			changeColor = pantsC;
		}else if(selectItem == "outer"){
			changeItem = outers;
			changeColor = outerC;
		}else if(selectItem == "shoes"){
			changeItem = shoeses;
			changeColor = shoesC;
		}else if(selectItem == "accessory"){
			changeItem = accessories;
			changeColor = accessoryC;
		}
		
		$("[name='select2']").empty();
		
		for(var count = 0; count < changeItem.length; count++){
			var option = $("<option value="+changeItem[count]+">"+changeItem[count]+"</option>");
			$("[name='select2']").append(option);
			}
		
		$("[name='select3']").empty();
		
		for(var count = 0; count < changeColor.length; count++){
			var option2 = $("<option value="+changeColor[count]+">"+changeColor[count]+"</option>");
			$("[name='select3']").append(option2);
			}
	})
})
</script>
<script src="/resources/js/uploadproduct.js"></script> 
<script src="/resources/js/registerboard.js"></script> 
<%@include file="../include/footer.jsp" %>