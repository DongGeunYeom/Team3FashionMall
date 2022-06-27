/**
 * register.jsp 스크립트
 */
$(function(){
	$(":submit").click(function(e){
		e.preventDefault();
		
		
		let str = "";
		
		//첨부파일 li 태그 정보 수집하기
		$(".uploadResult ul li").each(function(idx,obj){
			var job = $(obj);
			
			str += "<input type='hidden' name='attachList["+idx+"].uuid' value='"+job.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+idx+"].uploadpath' value='"+job.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+idx+"].filename' value='"+job.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+idx+"].filetype' value='"+job.data("type")+"'>";
		})
		
		console.log("form 태그 삽입 전");
		console.log(str);
		
		//폼 보내기
		$("form").append(str).submit();
	})
	
	// x 버튼 클릭시 첨부 파일 삭제
	$(".uploadResult").on("click","button",function(){
		//button 태그의 data-속성 가져오기
		let targetFile = $(this).data("file");
		let type = $(this).data("type");
		
		//span 태그가 속해있는 li 태그 가져오기
		let targetLi = $(this).closest("li");
		
		
		$.ajax({
			url:'/deleteFile',
			data:{
				fileName:targetFile,
				type:type
			},
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			type:'post',
			success:function(result){
				console.log(result);
				$(":file").val("");
				//li 태그 제거
				targetLi.remove();
			}
		})
	})
	
	
	// 옵션 추가하면 밑에 어떤 어떤 옵션 추가했는지 보여주는 div
	
	 function append_to_div(div_name, data){
            document.getElementById(div_name).innerHTML += data;
        }
          
        document.getElementById("my_button")
                .addEventListener('click', function() {
              
			var radio=$(":radio:checked").val();
			
			
			if(radio=="cloth"){
				var user_size = document.getElementById("C_size");
			}
			else if(radio=="shoes"){
				var user_size = document.getElementById("S_size");
			}	
            var value1 = user_size.value.trim();
            var user_color = document.getElementById("color");
            var value2 = user_color.value.trim();
            var user_amount = document.getElementById("amount");
            var value3 = user_amount.value.trim();
              

			let str2="";
			var n = $('#my_div li').length;
			str2+="<li><input type='text' class='form-control' name='optList["+n+"].po_size' style='width: 200px;' value='"+value1;
			str2+="'><input type='text' class='form-control' name='optList["+n+"].po_color' style='width: 200px;' value='" +value2;
			str2+="'><input type='text' class='form-control' name='optList["+n+"].p_amount' style='width: 200px;' value='"+value3+"'></li>\n";
			
            if(!value1)
                alert("사이즈를 입력해주세요.");
            else if(!value2)
            	alert("색상을 입력해주세요.");
            else if(!value3)
            	alert("수량을 입력해주세요.");
            else{
	/*append_to_div("my_div","<li>"+value1+"\t,\t"+value2+"\t,\t"+value3+"</li>");*/
            	append_to_div("my_div",str2);
}
			
            user_size.value = "";
            user_color.value = "";
            user_amount.value = "";
          
        });
        
	//여기서부터 display none 
	$(":radio").click(function(){
		var radio=$(this).val();		

		if(radio=="cloth"){
			document.getElementById("S_size").style.display = "none";
			document.getElementById("C_size").style.display = "";
		}
		else if(radio=="shoes"){
			document.getElementById("S_size").style.display = "";
			document.getElementById("C_size").style.display = "none";
		}		
	})
	
	
	
	
})













