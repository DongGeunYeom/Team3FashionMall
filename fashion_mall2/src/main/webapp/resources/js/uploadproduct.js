/**
 * productregsiter.jsp
 */
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

let productService = (function(){
	
	function addOption(productOption, callback){
		console.log('addOption 메소드 실행');
		
		$.ajax({
			url:'/product/uploadOptProduct',
			type:'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			contentType : "application/json",
			data : JSON.stringify(productOption),
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})
		
	}// addOption 종료
	
	function add(product,callback){
		console.log('add 메소드 실행');
		
		$.ajax({
			url:'/product/uploadProduct',
			type:'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			contentType : "application/json",
			data : JSON.stringify(product),
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})
		
	}// add 종료
	
	function get(param, callback){
		
		let name1 = param.pName
		$.getJSON({
			url:'/product/getCode',
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})
	}// get종료
	
	
	function getList(param, callback){
		
		let bno = param.bno;
		let page = param.page;
		$.getJSON({
			url:'/replies/pages/'+bno+'/'+page,
			success:function(result){
				if(callback){
					callback(result.replyCnt, result.list);
				}
			}
		})
	}// getList 종료
	
	
	function update(reply,callback){
		
		$.ajax({
			url:'/replies/'+reply.rno,
			type:'put',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			contentType:'application/json',
			data:JSON.stringify(reply),
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})
	} // update 종료
	
		function remove(rno,replyer,callback){
		
		$.ajax({
			url:'/replies/'+rno,
			type:'delete',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			contentType:'application/json',
			data:JSON.stringify({
				replyer:replyer
			}),
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})
	} // remove 종료
	
	function displayTime(timeValue){
		// ms ==> 변환
		// 댓글 단 날짜가 오늘이라면 시분초, 오늘이 아니라면 년월일
		let today = new Date();
		
		let gap = today.getTime() - timeValue;
		let dateObj = new Date(timeValue);
		
		if(gap<(1000*60*60*24)){
			let hh = dateObj.getHours();
			let mi = dateObj.getMinutes();
			let ss = dateObj.getSeconds();
			
			return [(hh>9?'':'0')+hh,':',(mi>9?'':'0')+mi,':',(ss>9?'':'0')+ss].join('');	
		
		}else{
			let yy = dateObj.getFullYear();
			let mm = dateObj.getMonth()+1;
			let dd = dateObj.getDate();
			
			return [yy,'/',(mm>9?'':'0')+mm, '/',(dd>9?'':'0')+dd].join('');	
		}	
	}// displayTime 종료
	
	
	return {
		add:add,
		addOption:addOption,
		getList:getList,
		get:get,
		update:update,
		remove:remove,
		displayTime:displayTime,
	}
	
})();

$(function(){
	
	$(".btn-warning").click(function(){
		
		let name = $("#pName").val();
		let price = $("#price").val();
		let ptype = $("#pType").val();
		let pcontent = $("#pContent").val();
			
		let product = {
			pname : name,
			price : price, 
			ptype : ptype,
			pcontent : pcontent
		};
		
		console.log(product);
		
		productService.add(product,function(result){
				if(result){
					console.log("성공 확인", product);
					name = "";
					price = "";
					ptype = "";
					pcontent = "";
				}
			});
	}) // 상품 등록 버튼 종료
	
	
	$(".btn-danger").click(function(){
		
		let psize = $("#pSize").val();
		let pcolor = $("#pColor").val();
		let pamount = $("#pAmount").val();
			
		let productOption = {
			psize : psize,
			pamount : pamount,
			pcolor : pcolor
		};
		
		console.log(productOption);
		
		productService.addOption(productOption,function(result){
				if(result){
					console.log("성공 확인", productOption);
					psize = "";
					pamount = "";
					pcolor = "";
				}
			});
	}) // 상품 옵션 등록 버튼 종료
	
	$(".btn-success").click(function(){
		
		productService.get(function(data){
			console.log("상품 코드 확인",data);
			
			// 상품코드를 화면에 보여주기
			$(".panel-heading").append("<div class='form-group'><input placeholder='상품코드' "
        			+"class='form-control input-lg' type='text' style='float:left;' name='item_option"
         			+ "' id='item_option'>"
                    + "<input type='number' name='chk_code' id='chk_code' placeholder='상품코드 '"
                    + " value="+data.pcode+" readonly>"
                    + "<button type='button' style='float:right;' id='optionDelBtn' class='btn-btn dark'>"
                    + "삭제" + "</button></div>");
		});
		
		$(document).on("click", "#optionDelBtn", function() {
       		$(this).parent().remove();
    	});
    	
	}) // 상품 코드 확인 버튼 종료
	
	
})