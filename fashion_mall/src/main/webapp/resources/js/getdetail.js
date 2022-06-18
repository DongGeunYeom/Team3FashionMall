
/**
 *  productDetail.jsp 상품 디테일 부분
 */ 
 

// 이미지 보여주기
function showImage2(fileCallPath){
	$(".bigPictureWrapper2").css("display","flex").show();
	
	$(".bigPicture2").html("<img src='/display?fileName="+fileCallPath+"'style='height:100%;' >")
					.animate({width:'100%',height:'100%'},1000);
}

// ajax 모듈
let productService = (function(){
	
	function checkSize(param, callback){
	
		let color = param.pcolor;
		let code = param.pcode;
		$.getJSON({
			url:'/board/'+color+'/'+code,
			success:function(result){
				if(callback){
					console.log(result)
					callback(result);
					}
			}
		})
	} // checkSize 종료
	
	function checkAmount(param, callback){
		
		let color = param.pcolor;
		let code = param.pcode;
		let size = param.psize;
		$.getJSON({
			url:'/board/'+color+'/'+code+'/'+size,
			success:function(result){
				if(callback){
					console.log(result)
					callback(result);
				}
			}
		})
	} // checkAmount 종료
	
	function addCart(param, callback){
		console.log('addCart 메소드 실행');
		
		$.ajax({
			url:'/board/addCart',
			type:'post',
			contentType:'application/json',
			data:JSON.stringify(param),
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})
	} // addCart 종료
	
	function checkCart(param, callback){
		console.log('checkCart 메소드 실행');
		$.ajax({
			url:'/board/checkCart',
			type:'post',
			contentType:'application/json',
			data:JSON.stringify(param),
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})
	} // checkCart 종료
	
	return {
		checkSize:checkSize,
		checkAmount:checkAmount,
		addCart:addCart,
		checkCart:checkCart,
	}
	
})();


// 모든 썸네일 
const galleryThumbnail = document.querySelectorAll(".thumbnails-list li a");

// 선택된 썸네일
const galleryFeatured = document.querySelector(".product-gallery-featured a img");

function move_thumbnails(){
	// 상품사진 스크립트
	galleryThumbnail.forEach((item) => {
	  item.addEventListener("mouseover", function() {
	    let image = item.children[0].src;

	    galleryFeatured.src = image;
	  });
	});
};

// 페이지 로딩 시 스크립트 
$(function(){

	move_thumbnails()
	
	// 가격 포매팅
	let truePrice = $("#pprice").val();
	let showPrice = new Intl.NumberFormat().format(truePrice);
	str = "";
	str += "<h3 class='pprice'>가격 : "+showPrice+" 원</h3>"
	$(".showprice").append(str);
	
	let p_code = $("#pcode").val();
	
	// 첨부파일 가져오기 - 무조건 실행
	$.getJSON({
		url:'getProductAttachList',
		data:{
			p_code:p_code,
		},
		success:function(data){
			showProductUploadFile(data);
		}	
	}) // 가져오기 종료
	
	function showProductUploadFile(result){
		let uploadResult = $(".thumbnails-list.list-unstyled");
		let str ="";
		
		let uploadTop = $(".product-gallery-featured");
		let str2 ="";
		
		let uploadBody = $(".recommended-items.card-deck");
		let str3 = "";	
		$(result).each(function(idx, obj){
			// 썸네일 이미지 보여주기
			// 썸네일 이미지 경로
			let fileCallPath = encodeURIComponent(obj.uploadpath+"\\s_"+obj.uuid+"_"+obj.filename);
			// 원본파일 이미지 경로
			let oriPath = obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename;
			oriPath = oriPath.replace(new RegExp(/\\/g),"/");
				
			str += "<li data-path='"+obj.uploadpath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.filename+"'>";
			str += 	"<a href=\"javascript:showImage2(\'"+oriPath+"\')\">";
			str += "<img src='/display?fileName="+fileCallPath+"' class='imageEvent' ></a>";
			str += "</li>";
		})
		
		$(result).each(function(idx, obj){
			if(idx == 0){
				// 원본파일 이미지 경로
				let oriPath = obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename;
				oriPath = oriPath.replace(new RegExp(/\\/g),"/");
					
				str2 += "<a href=\"javascript:showImage2(\'"+oriPath+"\')\" style='width:100%; height:100%; padding-top:5% 0 5% 0;' >";
				str2 += "<img src='/display?fileName="+oriPath+"' style='width:100%; height:100%; padding:5% 0 5% 0;' class='largeImage'></a>";
			} else {	
				return false;
			}
		})
		
		$(result).each(function(idx, obj){
			// 썸네일 이미지 보여주기
			// 썸네일 이미지 경로
			let fileCallPath = encodeURIComponent(obj.uploadpath+"\\s_"+obj.uuid+"_"+obj.filename);
			// 원본파일 이미지 경로
			let oriPath = obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename;
			oriPath = oriPath.replace(new RegExp(/\\/g),"/");
			str3 += "<div class='card'><div class='card-body'>";
			str3 += "<a href=\"javascript:showImage2(\'"+oriPath+"\')\">";
			str3 += "<img src='/display?fileName="+oriPath+"' style='width:100%; height:100%;' ></a>";
			str3 += "</div></div>"
		})
		
		uploadResult.append(str);
		uploadTop.append(str2);
		uploadBody.append(str3);
	} // showProductUploadFile 종료
	
	//이미지 종료 메소드
	$(".bigPictureWrapper2").on("click",function(){
		$(".bigPicture2").animate({width:'0',height:'0'},1000);
		
		setTimeout(function(){
			$(".bigPictureWrapper2").hide();
		},1000);
	}) // 메소드 종료
	
	
	// 버튼으로 스크롤 이동
	$(".scroll_move").click(function(event){         
	    event.preventDefault();
	    $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
    });
	
	$("#btn1").click(function () {
      var offset = $("#div1").offset();
      $("html").animate({ scrollTop: offset.top }, 400);
    });
    
    $("#btn2").click(function () {
      var offset = $("#div2").offset();
      $("html").animate({ scrollTop: offset.top }, 400);
    });
    
    $("#btn3").click(function () {
      var offset = $("#div3").offset();
      $("html").animate({ scrollTop: offset.top }, 400);
    });
    // 스크롤 이동 끝
    
	// 색상 변경시 재고 추적
	$('#pcolor').change(function(){
	
		// 색상 변경시 수량 값 0으로
		$("#psize").val("");
		$("#pamount").val("");
		
		// 선택한 색상값과 숨겨진 상품코드 값
		let color = $('#pcolor option:selected').val();
		let pcode = $('#pcode').val();
		
		let param = {
			pcolor : color,
			pcode : pcode,
		};
		
		productService.checkSize(param, function(result){
			if(result){
				console.log("성공 확인"+result);
					
				let str = "<option value=''>---사이즈선택---</option>";
				$(result).each(function(idx, item){
					str += "<option value='";    
					str += item+"'>"+item;
					str += "</option>";
				})
				$("#psize").html(str);	
			}
		}); // checkSize 끝
	}); // 색상 변경시 스크립트 끝
	
	$('#psize').change(function() {

		// 선택한 색상,	사이즈 값과 숨겨진 상품코드 값
		let color = $('#pcolor option:selected').val();
		let size = $('#psize').val();
		let pcode = $('#pcode').val();
		
		let param = {
			pcolor : color,
			pcode : pcode,
			psize : size,
		};
		
		productService.checkAmount(param, function(result){
			if(result){
				console.log("성공 확인"+result);
				$("#pamount").attr('max', result);
				$("#addcart").show();
				$("#buyproduct").show();
				$("#pamount").show();
				$(".totalprice").show();
				$("#pamountlabel").show();
				$("#hiddenstock").hide();
				
			}else{
				console.log("수량 0 반환시"+result);
				$("#pamount").attr('max', result);
				$("#addcart").hide();
				$("#buyproduct").hide();
				$("#pamountlabel").hide();
				$("#pamount").hide();
				$(".totalprice").hide();
				$("#hiddenstock").show();
			}
		}); // checkAmount 끝							
	}); // 사이즈 변경시 스크립트 끝
	
	$('#pamount').change(function() {
		
		$('.totalprice').remove();
		
		let amount = $("#pamount").val();
		let limit = $("#pamount").attr('max');
		console.log("맥스 속성 값 "+limit+" < "+amount);
		let price = $('#pprice').val();
		let validprice = (price * amount);
		
		let totalprice = new Intl.NumberFormat().format(validprice);
		
		console.log("수량변경 감지 "+validprice);

		str = "<h3 class='totalprice' value='"+validprice+"'> 총 가격 : ";
		str += totalprice+" 원</h3>";
		
		if( Number(amount) > limit){
			alert("수량을 초과하여 구매하실 수 없습니다.");
			console.log(amount);
			totalprice = (validprice / Number(amount) * limit);
			console.log(validprice);
			
			$("#pamount").val(limit);
			str = "<h3 class='totalprice' value='"+validprice+"'> 총 가격 : ";
			str += totalprice+" 원</h3>"; 
		}
	
		$('.showtotalprice').html(str);
		
		}); // 사이즈 변경시 스크립트 끝
	
	// 장바구니 추가
	$('#addcart').click(function(){
		
		console.log(user_id.value);
		
		if(user_id.value == ""){
			alert('로그인 한 후에 이용 가능합니다.');
			return;
		};
		
		$("#modalContinueBtn").hide();
		let color = $('#pcolor option:selected').val();
		let size = $('#psize').val();
		let pcode = $('#pcode').val();
		let amount  = $('#pamount').val();
		let price = $('#pprice').val();
		let name = $('#pname').val();
		let validprice = (price * amount);
		
		console.log("장바구니 담기 로직 밸류추적 "+user_id);
		
		let param = {
			user_id : user_id, 
			po_color : color,
			p_code : pcode,
			po_size : size,
			p_price : price,
			p_amount : amount,
			p_name: name,
			valid_price: validprice,
		};
		
		productService.checkCart(param, function(result){
			let str1 = "";
			if(result >= 1){
				$("#checkmsg").remove();
				str1 = "<h3 id='checkmsg'>장바구니에 이미 상품이 존재합니다.</h3>";
				$(".modal-body").html(str1);
				$("#modal").fadeIn();
			} else {
				console.log("result 값 확인 "+result);
				productService.addCart(param, function(result){
					if(result){
						$("#checkmsg").remove();
						str1 = "<h3 id='checkmsg'>장바구니에 상품을 담았습니다.</h3>";
						$(".modal-body").html(str1);
						$("#modal").fadeIn();
					} else {
						alert("장바구니 담기에 실패했습니다.");
					}
				}) // addCart 끝
			}
		}) // checkCart 끝

	}); // 장바구니 담기 클릭시 스크립트 끝
	
		// 구매하기 추가
	$('#buyproduct').click(function(){
		
		if(user_id.value == ""){
			alert('로그인 한 후에 이용 가능합니다.');
			return;
		};
		
		let color = $('#pcolor option:selected').val();
		let size = $('#psize').val();
		let pcode = $('#pcode').val();
		let amount  = $('#pamount').val();
		let price = $('#pprice').val();
		let name = $('#pname').val();
		let validprice = (price * amount);
		
		
		console.log("구매하기 로직 밸류추적 "+user_id);
		
		let param = {
			user_id : user_id, 
			po_color : color,
			p_code : pcode,
			po_size : size,
			p_price : price,
			p_amount : amount,
			p_name: name,
			valid_price: validprice,
		};
		
		productService.checkCart(param, function(result){
			let str1 = "";
			if(result >= 1){
				$("#checkmsg").remove();
				str1 = "<h3 id='checkmsg'>이전에 이 상품을 이미 담으셨습니다.</h3>";
				$(".modal-body").html(str1);
				$("#modal").fadeIn();
			} else {
				console.log("result 값 확인 "+result);
				
				productService.addCart(param, function(result){
					if(result){
						$("#checkmsg").remove();
						str1 = "<h3 id='checkmsg'>구매하기 창으로 이동합니다.</h3>";
						$(".modal-body").html(str1);
						$("#modalShopBtn").hide();
						$("#modalCartBtn").hide();
						$("#modalContinueBtn").show();
						$("#modal").fadeIn();
					} else {
						alert("구매하기에 실패했습니다.");
					}
				}) // addCart 끝
			}
		}) // checkCart 끝

	}); // 장바구니 담기 클릭시 스크립트 끝

	
	// 장바구니 확인창 모달
	$("#modalShopBtn").click(function(){
		$("#modal").fadeOut();
	}) 
	
})
