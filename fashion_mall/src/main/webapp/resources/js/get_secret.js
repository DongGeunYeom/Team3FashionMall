/**
 *  get_secret.jsp 
 */
 
 // ajax 모듈
let secretService = (function() {

	function qnaGetList(param, callback) {
		let bno = $('#bno').val();
		let page = param.page;
		console.log('qnaGetList 메소드 실행 ' + bno + " " + page);

		$.getJSON({
			url: '/board/pages/' + bno + '/' + page,
			success: function(result) {
				if (callback) {
					callback(result.qnaCnt, result.list);
				}
			}
		})
	};// qnaGetList 종료

	function qnaRegister(param, callback) {
		console.log('qnaRegister 메소드 실행');
		$.ajax({
			url: '/board/qnaRegister',
			type: 'post',
			contentType: 'application/json',
			data: JSON.stringify(param),
			success: function(result) {
				if (callback) {
					callback(result);
				}
			}
		})
	}; // qnaRegister 종료

	function qnaAnswer(param, callback) {
		console.log('qnaAnswer 메소드 실행');
		$.ajax({
			url: '/board/' + param.qno,
			type: 'put',
			contentType: 'application/json',
			data: JSON.stringify(param),
			success: function(result) {
				if (callback) {
					callback(result);
				}
			}
		})
	}; // qnaAnswer 종료

	function qnaChange(param, callback) {
		console.log('문의 수정 메소드 실행');
		$.ajax({
			url: '/board/qnaAdminChange/' + param.qno,
			type: 'put',
			contentType: 'application/json',
			data: JSON.stringify(param),
			success: function(result) {
				if (callback) {
					callback(result);
				}
			}
		})
	}; // qnaChange 종료

	function qnaModify(param, callback) {
		console.log('답변 수정 메소드 실행');
		$.ajax({
			url: '/board/qnaAdminModify/' + param.qno,
			type: 'put',
			contentType: 'application/json',
			data: JSON.stringify(param),
			success: function(result) {
				if (callback) {
					callback(result);
				}
			}
		})
	}; // qnaModify 종료

	function qnaSecretOpen(param, callback) {
		console.log('비밀글 공개 메소드 실행');
		$.ajax({
			url: '/board/qnaAdminSecretOpen/' + param.qno,
			type: 'put',
			contentType: 'application/json',
			data: JSON.stringify(param),
			success: function(result) {
				if (callback) {
					callback(result);
				}
			}
		})
	}; // qnaSecretOpen 종료

	function qnaDelete(param, callback) {
		console.log('qnaDelete 메소드 실행');
		$.ajax({
			url: '/board/qnaDelete/' + param.qno,
			type: 'delete',
			contentType: 'application/json',
			data: JSON.stringify(param),
			success: function(result) {
				if (callback) {
					callback(result);
				}
			}
		})
	}; // qnaDelete 종료

	function displayTime(timeValue) {
		// ms ==> 변환
		// 댓글 단 날짜가 오늘이라면 시분초, 오늘이 아니라면 년월일
		let today = new Date();

		let gap = today.getTime() - timeValue;
		let dateObj = new Date(timeValue);

		if (gap < (1000 * 60 * 60 * 24)) {
			let hh = dateObj.getHours();
			let mi = dateObj.getMinutes();
			let ss = dateObj.getSeconds();

			return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');

		} else {
			let yy = dateObj.getFullYear();
			let mm = dateObj.getMonth() + 1;
			let dd = dateObj.getDate();

			return [yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
		}
	};// displayTime 종료

	return {
		qnaRegister: qnaRegister,
		displayTime: displayTime,
		qnaAnswer: qnaAnswer,
		qnaDelete: qnaDelete,
		qnaModify: qnaModify,
		qnaGetList: qnaGetList,
		qnaChange: qnaChange,
		qnaSecretOpen: qnaSecretOpen,
	}

})();

/*function getParentText(){
	let child_id = document.getElementById("user_id").value;
	let parent_id = opener.user_id;
	child_id = parent_id;
	console.log(child_id+"확인"+parent_id);
}*/

// 답변달기
function fn_QnaAnswer() {
	$(".modal-body4").show();
	$("#modalQnaInsertBtn").hide();
	$("#modalQnaModifyBtn").hide();
	$("#modalQnaInsertSecretBtn").hide();
	$("#modalQnaChangeBtn").hide();

	$(".q_answer9").show();
	$("#modalQnaAnswerBtn").show();

	$("#qnaModal2").fadeIn();
};

function fn_QnaChange() {
	let fnQno = $("#qno").val();
	let q_title = $("#q_title").val();
	let q_content = $("#q_content").val();
	console.log("문의글 변수 확인"+q_title+" "+q_content)
	
	$("#qno9").val(fnQno);
	$("#q_title9").val(q_title);
	$("#q_content9").val(q_content);
	
	// console.log("비밀글 버튼을 누른 시점의 qno"+fnQno);

	$(".modal-body4").show();
	$("#modalQnaChangeBtn").show();

	$("#modalQnaAnswerBtn").hide();
	$("#modalQnaModifyBtn").hide();
	$("#modalQnaInsertBtn").hide();
	$("#modalQnaInsertSecretBtn").hide();

	$(".q_answer9").hide();
	$("#qnaModal2").fadeIn();
};

function fn_QnaModify() {
	let q_title = $("#q_title").val();
	let q_content = $("#q_content").val();
	let q_answer = $("#q_answer").val();
	let secret = $("#secret").val();
	
	$("#q_content9").val(q_content);
	$("#q_title9").val(q_title);
	$("#q_answer9").val(q_answer);
	$("#secret9").val(secret);
	
	$("#modalQnaInsertBtn").hide();
	$("#modalQnaInsertSecretBtn").hide();
	$("#modalQnaChangeBtn").hide();
	$("#modalQnaAnswerBtn").hide();

	$(".q_answer9").show();
	$("#q_answer9").show();
	$("#modalQnaModifyBtn").show();

	$("#qnaModal2").fadeIn();
};

function fn_QnaDelete() {
	$("#modalChkCancleBtn").show();
	$("#modalDeleteBtn").show();
	$("#modalCloseBtn").hide();

	str1 = "<h3 id='checkmsg2'>문의글 삭제를 하시겠습니까?</h3>";
	$("#chkModalBody").html(str1);
	$("#chkModal").show();
};
// 상품 문의글 관련 모달 종료


$(function(){
	
	// 토크나이저
	var token = $("input[name='_csrf']").val();
    var header = "X-CSRF-TOKEN";
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
    
	// 상품문의 페이지 영역
	let pageFooter = $("#qnaPage");

	// 현재 페이지 정보
	let pageNum = 1;

	// 댓글 전체 가져오기 호출
	qnaShowList(1);

	function qnaShowList(page) {

		// page : page||1 => page 변수값이 들어오면 사용하고 안들어오면 1
		secretService.qnaGetList({ bno: bno, page: page || 1 }, function(total, list) {
			if (list) {
				let body = $("#board_list1");
				let str = "";
				let cnt1 = 1;

				body.empty();

				// 새 문의글 등록 시
				if (page == -1) {
					console.log("새 문의 등록 확인" + page);
					pageNum = Math.ceil(total / 10.0);
					qnaShowList(pageNum);
					return;
				}
				
				$(list).each(function(idx, item) {
					let date = secretService.displayTime(item.reg_date);
					// 1 답변 달림
					let Level = item.qna_level;
					// 1 비밀글
					let sc = item.qna_secret;
					let Q = "<span class='bi bi-question-circle-fill'></span>"
					let A = "<i class='bi bi-chat-right-dots-fill'></i>"
					if (Level == 1) { // 답변 달림
						if (sc == 1) { // 비공개 글
								str += "  "
									+ " <tr id='show" + cnt1 + "' data-qno='" + item.qno + "' data-user_id='" + item.user_id 
									+ "' data-sc='" + sc + "' data-cnt='hide" + cnt1 + "' data-q_title='"
									+ item.q_title+"'data-q_content='"+item.q_content+"' data-q_answer='"+item.q_answer+"'>"
									+ " <td align='center' > " + item.qno + "</td>"
									+ " <td class='align_left'> " + item.q_title + "</td>"
									+ " <td align='left'> " + item.user_id + "</td>"
									+ " <td align='center' > " + date + "</td>"
									+ " <td align='center'> <i class='bi bi-check-circle-fill'></i></td>"
									+ " </tr> "
									+ " <div> "
									+ " <tr id='hide" + cnt1 + "' width='100%' align='center' bgcolor='#f1f3f5' data-qno='" + item.qno + "' style='display:none;'>"
									+ " <td class='qnadata' colspan='5' style='padding:50px;' align='left'>" + Q + "</br>질문내용:" + item.q_content
									+ " </br>" + A + "<p>답변내용:" + item.q_answer + "</p>"
									+ " <div><button type='button' class='btn btn-danger' onclick='fn_QnaDelete()' data-qno='" + item.qno + "' data-user_id='" + item.user_id + "'>문의삭제</button>"
									+ " <button type='button' class='btn btn-primary' onclick='fn_QnaChange()'  data-user_id='" + item.user_id + "' data-qno='"
									+ item.qno +"' data-q_content='"+item.q_content+"' data-q_title='"+item.q_title+"'>문의수정</button>"
									+ " <button type='button' class='btn btn-info' onclick='fn_QnaModify()' data-qno='" + item.qno + "' data-user_id='"+ item.user_id 
									+ "' data-q_title='"+item.q_title+"' data-q_content='"+item.q_content+"' data-q_answer='"+item.q_answer+"'>답변수정</button></div>"
									+ "<h4 style='color:blue;'> 이 글은 비공개 글입니다. </h4>"
									+ " </td>"
									+ " </tr>"
									+ " </div> ";
								cnt1++;
							} else {
								str += "  "
									+ " <tr id='show" + cnt1 + "' data-qno='" + item.qno + "' data-user_id='" + item.user_id 
									+ "' data-sc='" + sc + "' data-cnt='hide" + cnt1 + "' data-q_title='"
									+ item.q_title+"'data-q_content='"+item.q_content+"' data-q_answer='"+item.q_answer+"'>"
									+ " <td align='center' > " + item.qno + "</td>"
									+ " <td class='align_left'> " + item.q_title + "</td>"
									+ " <td align='left'> " + item.user_id + "</td>"
									+ " <td align='center' > " + date + "</td>"
									+ " <td align='center'> <i class='bi bi-check-circle-fill'></i></td>"
									+ " </tr> "
									+ " <div> "
									+ " <tr id='hide" + cnt1 + "' width='100%' align='center' bgcolor='#f1f3f5' data-qno='" + item.qno + "' style='display:none;'>"
									+ " <td class='qnadata' colspan='5' style='padding:50px;' align='left'>" + Q + "</br>질문내용:" + item.q_content
									+ " </br>" + A + "<p>답변내용:" + item.q_answer + "</p>"
									+ " <div><button type='button' class='btn btn-danger' onclick='fn_QnaDelete()' data-qno='" + item.qno + "' data-user_id='" + item.user_id + "'>문의삭제</button>"
									+ " <button type='button' class='btn btn-primary' onclick='fn_QnaChange()'  data-user_id='" + item.user_id + "' data-qno='"
									+ item.qno +"' data-q_content='"+item.q_content+"' data-q_title='"+item.q_title+"'>문의수정</button>"
									+ " <button type='button' class='btn btn-info' onclick='fn_QnaModify()' data-qno='" + item.qno + "' data-user_id='"+ item.user_id 
									+ "' data-q_title='"+item.q_title+"' data-q_content='"+item.q_content+"' data-q_answer='"+item.q_answer+"'>답변수정</button></div>"
									+ " </td>"
									+ " </tr>"
									+ " </div> ";
								cnt1++;	
							}
							
					} else { // 답변 없음
						if (sc == 1) { // 비공개 글
								str += "  "
									+ " <tr id='show" + cnt1 + "' data-qno='" + item.qno + "' data-user_id='" + item.user_id 
									+ "' data-sc='" + sc + "' data-cnt='hide" + cnt1 + "' data-q_title='"
									+ item.q_title+"'data-q_content='"+item.q_content+"'>"
									+ " <td align='center' > " + item.qno + "</td>"
									+ " <td class='align_left'> " + item.q_title + "</td>"
									+ " <td align='left'> " + item.user_id + "</td>"
									+ " <td align='center' > " + date + "</td>"
									+ " <td align='center'></td>"
									+ " </tr> "
									+ " <div> "
									+ " <tr id='hide" + cnt1 + "' width='100%' align='center' bgcolor='#f1f3f5' data-qno='" + item.qno + "' data-user_id='" + item.user_id + "' style='display:none;'>"
									+ " <td class='qnadata' colspan='5' style='padding:50px;' align='left'>" + Q + "</br>질문내용:" + item.q_content
									+ " <div><button type='button' class='btn btn-danger' onclick='fn_QnaDelete()' data-qno='" + item.qno + "' data-user_id='" + item.user_id + "'>문의삭제</button>"
									+ " <button type='button' class='btn btn-primary' onclick='fn_QnaChange()'  data-user_id='" + item.user_id + "' data-qno='"
									+ item.qno +"' data-q_content='"+item.q_content+"' data-q_title='"+item.q_title+"'>문의수정</button>"
									+ " <button type='button' class='btn btn-info' onclick='fn_QnaModify()' data-qno='" + item.qno + "' data-user_id='"+ item.user_id 
									+ "' data-q_title='"+item.q_title+"' data-q_content='"+item.q_content+"' data-q_answer='"+item.q_answer+"'>답변수정</button></div>"
									+ "<h4 style='color:blue;'> 이 글은 비공개 글입니다. </h4>"
									+ " </td>"
									+ " </tr>"
									+ " </div> ";
								cnt1++;
							} else {
								// 공개
								str += "  "
									+ " <tr id='show" + cnt1 + "' data-qno='" + item.qno + "' data-user_id='" + item.user_id 
									+ "' data-sc='" + sc + "' data-cnt='hide" + cnt1 + "' data-q_title='"
									+ item.q_title+"'data-q_content='"+item.q_content+"'>"
									+ " <td align='center' > " + item.qno + "</td>"
									+ " <td class='align_left'> " + item.q_title + "</td>"
									+ " <td align='left'> " + item.user_id + "</td>"
									+ " <td align='center' > " + date + "</td>"
									+ " <td align='center'></td>"
									+ " </tr> "
									+ " <div> "
									+ " <tr id='hide" + cnt1 + "' width='100%' align='center' bgcolor='#f1f3f5' data-qno='" + item.qno + "' data-user_id='" + item.user_id + "' style='display:none;'>"
									+ " <td class='qnadata' colspan='5' style='padding:50px;' align='left'>" + Q + "</br>질문내용:" + item.q_content
									+ " <div><button type='button' class='btn btn-danger' onclick='fn_QnaDelete()' data-qno='" + item.qno + "' data-user_id='" + item.user_id + "'>문의삭제</button>"
									+ " <button type='button' class='btn btn-primary' onclick='fn_QnaChange()'  data-user_id='" + item.user_id + "' data-qno='"
									+ item.qno +"' data-q_content='"+item.q_content+"' data-q_title='"+item.q_title+"'>문의수정</button>"
									+ " <button type='button' class='btn btn-info' onclick='fn_QnaModify()' data-qno='" + item.qno + "' data-user_id='"+ item.user_id 
									+ "' data-q_title='"+item.q_title+"' data-q_content='"+item.q_content+"' data-q_answer='"+item.q_answer+"'>답변수정</button></div>"
									+ " </td>"
									+ " </tr>"
									+ " </div> ";
								cnt1++;
							}
					} 		
				})
				body.append(str);
				showQnaPage(total);
			} else {
				str = "<tr>"
					+ "<td colspan='5' align='center'>조회된 결과가 없습니다.</td>"
					+ "</tr>";
				body.append(str);
			}
			// 상품문의 토글
			$('tr#show1').click(function() {
				$('tr#hide1').toggle('slow');
			});

			$('tr#show2').click(function() {
				$('tr#hide2').toggle('slow');
			});

			$('tr#show3').click(function() {
				$('tr#hide3').toggle('slow');
			});

			$('tr#show4').click(function() {
				$('tr#hide4').toggle('slow');
			});

			$('tr#show5').click(function() {
				$('tr#hide5').toggle('slow');
			});

			$('tr#show6').click(function() {
				$('tr#hide6').toggle('slow');
			});

			$('tr#show7').click(function() {
				$('tr#hide7').toggle('slow');
			});

			$('tr#show8').click(function() {
				$('tr#hide8').toggle('slow');
			});

			$('tr#show9').click(function() {
				$('tr#hide9').toggle('slow');
			});

			$('tr#show10').click(function() {
				$('tr#hide10').toggle('slow');
			});

		})
	} // qnaGetList 종료
	
	// 문의글 페이지 나누기
	// 제일 처음 쓴 문의글이 먼저 보이는 상황
	function showQnaPage(total) {
		let endPage = Math.ceil(pageNum / 10.0) * 10;
		let startPage = endPage - 9;
		let prev = (startPage != 1);
		let next = false;

		if (endPage * 10 >= total) {
			endPage = Math.ceil(total / 10.0);
		}

		if (endPage * 10 < total) {
			next = true;
		}

		let str = '<ul class="pagination pull-right">';
		if (prev) {
			str += '<li class="paginate_button previous">';
			str += '<a href="' + (startPage - 1) + '">Previous</a></li>';
		}

		for (let i = startPage; i <= endPage; i++) {
			let active = pageNum == i ? 'active' : '';
			str += '<li class="paginate_button ' + active + '">';
			str += '<a href="' + i + '">' + i + '</a></li>';

		}
		if (next) {
			str += '<li class="paginate_button next">';
			str += '<a href="' + (endPage + 1) + '">Next</a></li>';
		}
		str += '</ul>';

		pageFooter.html(str);
	} // 문의글 페이지 나누기 종료

	// 댓글 페이지 나누기 클릭 시
	pageFooter.on("click", "li a", function(e) {
		e.preventDefault();

		pageNum = $(this).attr("href");
		qnaShowList(pageNum);
	}) // 페이지 나누기 종료
	
	// 상품 문의 페이지 qno 넘기기
	$("#board_list1").on("click", "tr", function() {
		let qno = $(this).data("qno");
		let get_id = $(this).data("user_id");
		let get_title = $(this).data("q_title");
		let get_content = $(this).data("q_content");
		let get_answer = $(this).data("q_answer");
		let get_secret = $(this).data("sc")

		$("#qno").val(qno);
		$("#hiddenuser").val(get_id);
		$("#hiddenqno").val(qno);
		
		$("#q_title").val(get_title);
		$("#q_content").val(get_content);
		$("#q_answer").val(get_answer);
		$("#secret").val(get_secret);
		
	}) // qno 넘기기 끝
	
	// 모달 답변작성 버튼 누를 때
	$('#modalQnaAnswerBtn').click(function() {
		let q_answer = $('#q_answer9').val();
		let qno = $('#hiddenqno').val();

		let param = {
			qno: qno,
			q_answer: q_answer,
		};


		secretService.qnaAnswer(param, function(result) {
			if (result) {
				console.log("답변 작성 성공 확인" + result);
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>답변글 등록을 성공했습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#q_answer9").val("");
			} else {
				console.log("실패 확인" + result);
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>답변글 등록을 실패했습니다.</h3>";
				$("#chkModalBody").html(str1);
			}
		})
		$("#qnaModal").fadeOut();
		qnaShowList(1);
		setTimeout(function() {
			qnaShowList(1);
		}, 500);
	}); // 모달 답변 등록 종료

	$('#modalQnaChangeBtn').click(function() {
		let qno = $('#hiddenqno').val();
		let q_title = $('#q_title9').val();
		let q_content = $('#q_content9').val();

		let param = {
			qno: qno,
			q_title: q_title,
			q_content: q_content,
		};

		secretService.qnaChange(param, function(result) {
			if (result) {
				console.log("문의 수정 확인" + result);
				$("#q_title9").val("");
				$("#q_content9").val("");
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>문의 글 수정이 완료되었습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#chkModal").fadeIn();
			} else {
				$("#q_title9").val("");
				$("#q_content9").val("");
				$("#checkmsg2").remove();
				$("#modalCloseBtn").show();
				$("#modalDeleteBtn").hide();
				str1 = "<h3 id='checkmsg2'>문의 글 수정이 실패하였습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#chkModal").fadeIn();
			}

		})
		$("#qnaModal").fadeOut();
		$("#modalQnaAnswerBtn").show();
		$("#modalQnaModifyBtn").show();
		$("#modalQnaInsertBtn").show();
		$("#modalQnaInsertSecretBtn").show();

		$("#q_answer").attr("readonly", false);
		qnaShowList(1);
		setTimeout(function() {
			qnaShowList(1);
		}, 500);
	}); // 문의 수정 종료

	// 모달 답변 수정 버튼
	$('#modalQnaModifyBtn').click(function() {
		let q_answer = $('#q_answer').val();
		$("#modalDeleteBtn").hide();

		let param = {
			qno: $('#hiddenqno').val(),
			q_answer: q_answer,
		};


		secretService.qnaModify(param, function(result) {
			if (result) {
				console.log("답변 수정 확인" + result);

				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>답변글 수정을 성공했습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#q_answer9").val("");
			} else {
				console.log("실패 확인" + result);
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>답변글수정을 실패했습니다.</h3>";
				$("#chkModalBody").html(str1);
			}
		})
		$("#qnaModal").fadeOut();
		qnaShowList(1);
		setTimeout(function() {
			qnaShowList(1);
		}, 500);
	}); // 모달 답변 수정 종료

	// 모달 답변 삭제 버튼 
	$('#modalDeleteBtn').click(function() {

		let hiddenuser = $("#hiddenuser").val();

		let param = {
			qno: $("#hiddenqno").val(),
		};


		secretService.qnaDelete(param, function(result) {
			if (result) {
				console.log("성공 확인" + result);
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>문의글 삭제를 성공했습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#q_answer9").val("");
			} else {
				console.log("실패 확인" + result);
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>문의글 삭제를 실패했습니다.</h3>";
				$("#chkModalBody").html(str1);
			}
		})
		$('#modalDeleteBtn').hide();
		$("#modalChkCancleBtn").hide();
		$("#modalCloseBtn").show();
		$("#qnaModal").fadeOut();
		qnaShowList(1);
		setTimeout(function() {
			qnaShowList(1);
		}, 500);
	}); // 상품문의 삭제 종료
	
	$("#secret1").click(function() {
		// 비밀 수정
		let secretQno = $("#qno").val();

		let q_title = $('#q_title9').val();
		let q_content = $('#q_content9').val();
		console.log("변수 확인"+secretQno+" "+q_title+" "+q_content)
		
		let param = {
			qno: secretQno,
			q_title: q_title,
			q_content: q_content,
		};
		
		secretService.qnaChange(param, function(result) {
			if (result) {
				console.log("문의 수정 확인" + result);
				$("#q_title9").val("");
				$("#q_content9").val("");
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>문의 글 수정이 완료되었습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#chkModal").fadeIn();
			} else {
				$("#q_title9").val("");
				$("#q_content9").val("");
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>문의 글 수정이 실패하였습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#chkModal").fadeIn();
			}

		})

		$("#qnaModal2").fadeOut();
		qnaShowList(1);
	}) // 비밀글 문의 수정 종료

	$("#secret4").click(function() {
		// 비밀글확인 닫기
		$("#qnaModal2").fadeOut();
	})

	$("#secret2").click(function() {
		// $("#q_answer9").show();
		// $("#answerLabel9").show();
		let secretQno = $("#qno").val();
	
		let q_answer = $('#q_answer9').val();

		param = {
			qno: secretQno,
			q_answer: q_answer,
		};

		secretService.qnaAnswer(param, function(result) {
			if (result) {
				console.log("답변 작성 성공 확인" + result);
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>답변글 등록을 성공했습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#q_answer9").val("");
			} else {
				console.log("실패 확인" + result);
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>답변글 등록을 실패했습니다.</h3>";
				$("#chkModalBody").html(str1);
			}
		})
		$("#qnaModal2").fadeOut();
		qnaShowList(1);
	}) //비밀글 답변 등록 종료

	$("#secret3").click(function() {
		let secretQno = $("#qno").val();
		let q_answer = $('#q_answer9').val();

		let param = {
			qno: secretQno,
			q_answer: q_answer,
		};

		secretService.qnaModify(param, function(result) {
			if (result) {
				console.log("답변 수정 확인" + result);

				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>답변글 수정을 성공했습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#q_answer9").val("");
			} else {
				console.log("실패 확인" + result);
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>답변글 수정을 실패했습니다.</h3>";
				$("#chkModalBody").html(str1);
			}
		})
		$("#qnaModal2").fadeOut();
		qnaShowList(1);
	}); // 비밀글 답변 수정 종료

	$("#secretopen").click(function() {
		// 비밀글 공개	
		let qno = $("#qno").val();
		let secret = $("#secret9").val();
		
		console.log(secret+"변수존재확인") 
		
		if (secret == "false"){
			$("#chkModal").fadeIn();
			$("#checkmsg2").remove();
			str1 = "<h3 id='checkmsg2'>이 글은 비밀글이 아닙니다.</h3>";
			$("#chkModalBody").html(str1);
			return;
		}
		
		let param = {
			qno: qno,
		};

		secretService.qnaSecretOpen(param, function(result) {
			if (result) {
				console.log("비밀글 공개 완료");
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>문의글 비밀해제를 성공했습니다.</h3>";
				$("#chkModalBody").html(str1);				
			}
		})
		$("#qnaModal2").fadeOut();
		qnaShowList(1);
	}); // 비밀글 공개 성공

	$("#secretdelete").click(function() {
		let secretQno = $("#qno").val();

		let param = {
			qno: secretQno,
		};

		secretService.qnaDelete(param, function(result) {
			if (result) {
				console.log("성공 확인" + result);
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>문의글 삭제를 성공했습니다.</h3>";
				$("#chkModalBody").html(str1);
			} else {
				console.log("비밀 문의글 삭제 실패 확인" + result);
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>문의글 삭제를 실패했습니다.</h3>";
				$("#chkModalBody").html(str1);
			}
		})
		$("#qnaModal2").fadeOut();
		qnaShowList(1);
	});  // 비밀글 삭제 성공
	
	$("#modalCloseBtn").click(function() {
		$("#chkModal").fadeOut();
	}); // 확인창 모달 종료

	$('#modalChkCancleBtn').click(function() {
		$("#chkModal").fadeOut();
	}); // 확인창 모달 종료
	
})