/**
 *  productDetail.jsp qna 부분 
 */

// ajax 모듈
let qnaService = (function() {

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

	function qnaGetAllList(param, callback) {
		let bno = $('#bno').val();
		let page = param.page;
		console.log('qnaGetAllList 메소드 실행 ' + bno + " " + page);

		$.getJSON({
			url: '/board/auth/' + bno + '/' + page,
			success: function(result) {
				if (callback) {
					console.log(result)
					callback(result.qnaCnt, result.list);
				}
			}
		})
	};// qnaGetAllList 종료

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

	function qnaSecretRegister(param, callback) {
		console.log('qnaSecretRegister 메소드 실행');
		$.ajax({
			url: '/board/qnaSecretRegister',
			type: 'post',
			contentType: 'application/json',
			data: JSON.stringify(param),
			success: function(result) {
				if (callback) {
					callback(result);
				}
			}
		})
	}; // qnaSecretRegister 종료

	function qnaGetSecret(param, callback) {
		console.log('qnaGetSecret 메소드 실행');
		let qno = param.qno;
		let user_id = param.user_id;

		$.getJSON({
			url: '/board/qnaGetSecret/' + qno + '/' + user_id,
			success: function(result) {
				if (callback) {
					callback(result);
				}
			}
		})
	}; // qnaGetSecret 종료

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
			url: '/board/qnaChange/' + param.qno,
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
			url: '/board/qnaModify/' + param.qno,
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
			url: '/board/qnaSecretOpen/' + param.qno,
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
		qnaGetList: qnaGetList,
		qnaRegister: qnaRegister,
		displayTime: displayTime,
		qnaAnswer: qnaAnswer,
		qnaDelete: qnaDelete,
		qnaModify: qnaModify,
		qnaSecretRegister: qnaSecretRegister,
		qnaGetAllList: qnaGetAllList,
		qnaGetSecret: qnaGetSecret,
		qnaChange: qnaChange,
		qnaSecretOpen: qnaSecretOpen,
	}

})();

function empty(element) {
	element.textContent = "";
};

function append(element, value) {
	element.innerHTML += value;
};

// 상품문의글 모달 띄우기
function fn_Qna() {

	if (user_id.value == "") {
		alert('로그인 한 후에 이용 가능합니다.');
		return;
	};

	$(".modal-body2").show();
	$("#modalQnaInsertBtn").show();
	$("#modalQnaInsertBtn").show();
	$("#modalQnaInsertSecretBtn").show();

	$(".q_answer").hide();
	$("#modalQnaAnswerBtn").hide();
	$("#modalQnaModifyBtn").hide();
	$("#modalQnaChangeBtn").hide();

	$("#q_title").val("");
	$("#q_content").val("");
	$("#q_answer").val("");

	$("#qnaModal").fadeIn();
};

// 답변달기
function fn_QnaAnswer() {

	if (user_id.value == "") {
		alert('로그인 한 후에 이용 가능합니다.');
		return;
	};

	$(".modal-body2").hide();
	$("#modalQnaInsertBtn").hide();
	$("#modalQnaModifyBtn").hide();
	$("#modalQnaInsertSecretBtn").hide();
	$("#modalQnaChangeBtn").hide();

	$(".q_answer").show();
	$("#modalQnaAnswerBtn").show();

	$("#qnaModal").fadeIn();
};

function fn_QnaChange() {
	
	let fnQno = $("#hiddenqno2").val();
	let q_user = $("#hiddenq_user2").val();
	let q_title = $("#hiddentitle2").val();
	let q_content = $("#hiddencontent2").val();
	
	if (user_id == "") {
		alert('로그인 한 후에 이용 가능합니다.');
		return;
	};
	
	if (user_id != q_user) {
		alert('문의글 작성자만 문의 수정이 가능합니다.');
		return;
	};
	
	$("#hiddenuser").val(q_user);
	$("#qno").val(fnQno);
	$("#q_title").val(q_title);
	$("#q_content").val(q_content);
	

	$(".modal-body2").show();
	$("#modalQnaChangeBtn").show();

	$("#modalQnaAnswerBtn").hide();
	$("#modalQnaModifyBtn").hide();
	$("#modalQnaInsertBtn").hide();
	$("#modalQnaInsertSecretBtn").hide();

	$(".q_answer").hide();
	$("#qnaModal").fadeIn();
};

function fn_QnaModify() {

	if (user_id.value == "") {
		alert('로그인 한 후에 이용 가능합니다.');
		return;
	};
	let q_user = $("#hiddenq_user2").val();
	let q_answer = $("#hiddenanswer2").val();
	
	$("#q_answer").val(q_answer);
	$("#hiddenuser").val(q_user);
	
	$(".modal-body2").hide();
	$("#modalQnaInsertBtn").hide();
	$("#modalQnaInsertSecretBtn").hide();
	$("#modalQnaChangeBtn").hide();
	$("#modalQnaAnswerBtn").hide();

	$(".q_answer").show();
	$("#q_answer").show();
	$("#modalQnaModifyBtn").show();

	$("#qnaModal").fadeIn();
};

function fn_QnaDelete() {

	if (user_id.value == "") {
		alert('로그인 한 후에 이용 가능합니다.');
		return;
	};
	let q_user = $("#hiddenq_user2").val();
	$("#hiddenuser").val(q_user);
	
	$("#modalChkCancleBtn").show();
	$("#modalDeleteBtn").show();
	$("#modalCloseBtn").hide();

	str1 = "<h3 id='checkmsg2'>문의글 삭제를 하시겠습니까?</h3>";
	$("#chkModalBody").html(str1);
	$("#chkModal").show();
};
// 상품 문의글 관련 모달 종료

function fn_checkReply() {
	let fn_qno = $("#hiddenqno2").val();
	let q_user = $("#hiddenq_user2").val();
	let q_title = $("#hiddentitle2").val();
	let q_content = $("#hiddencontent2").val();
	$("#hiddenuser").val(q_user);
	$("#qno").val(fn_qno);
	$("#q_title").val(q_title);
	$("#q_content").val(q_content);
	$("#hiddenuser9").val(q_user);
	
	$("#secret2").hide();
	$("#secret3").show();
	$("#qnaModal2").fadeIn();
};

function fn_checkReply2() {
	let fn_qno = $("#hiddenqno2").val();
	let q_user = $("#hiddenq_user2").val();
	let q_title = $("#hiddentitle2").val();
	let q_content = $("#hiddencontent2").val();
	console.log("qno 추적"+fn_qno);
	
	$("#hiddenuser9").val(q_user);
	$("#hiddenuser").val(q_user);
	$("#hiddenqno").val(fn_qno);
	$("#q_title").val(q_title);
	$("#q_content").val(q_content);
	
	$("#secret3").hide();
	$("#secret2").show();
	$("#qnaModal2").fadeIn();
	// $("#q_answer9").hide();
	// $("#answerLabel9").hide();
};

function openPopUp() {
	let bno = $("#bno").val(); 
	openWin = window.open("/board/get_secret?bno="+bno, "get_secret", "width=1000, height=700, top=150, left=200");
};

// 페이지 로딩 시 스크립트 
$(function() {

	// 상품문의 페이지 영역
	let pageFooter = $("#qnaPage");

	// 현재 페이지 정보
	let pageNum = 1;

	// 댓글 전체 가져오기 호출
	qnaShowList(1);

	function qnaShowList(page) {

		// page : page||1 => page 변수값이 들어오면 사용하고 안들어오면 1
		qnaService.qnaGetList({ bno: bno, page: page || 1 }, function(total, list) {
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
					let date = qnaService.displayTime(item.reg_date);
					// 1 답변 달림
					let Level = item.qna_level;
					// 1 비밀글
					let sc = item.qna_secret;
					let Q = "<span class='bi bi-question-circle-fill'></span>"
					let A = "<i class='bi bi-chat-right-dots-fill'></i>"
					if (Level == 1) { // 답변 달림
						if (sc == 0) { // 공개 글
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
								// + " <button type='button' class='btn btn-info' onclick='fn_QnaModify()' data-qno='" + item.qno + "' data-user_id='"+ item.user_id +"'>답변수정</button>
								+ "</div>"
								+ " </td>"
								+ " </tr>"
								+ " </div> ";
							cnt1++;
						} else { // 비공개
							str += "  "
								+ " <tr id='show" + cnt1 + "' data-qno='" + item.qno + "' data-user_id='" + item.user_id 
								+ "' data-sc='" + sc + "' data-cnt='hide" + cnt1 + "'>"
								+ " <td align='center' > " + item.qno + "</td>"
								+ " <td class='align_left'> " + item.q_title + "</td>"
								+ " <td align='left'> " + item.user_id + "</td>"
								+ " <td align='center' > " + date + "</td>"
								+ " <td align='center'> <i class='bi bi-check-circle-fill'></i></td>"
								+ " </tr> "
								+ " <div> "
								+ " <tr id='hide" + cnt1 + "' width='100%' align='center' bgcolor='#f1f3f5' style='display:none;'> "
								+ " <td class='qnadata' colspan='5' style='padding:50px;' align='left'> "
								+ " " + Q + " 비공개로 설정되었습니다."
								+ " <br><br><br> "
								+ " " + A + " 비공개로 설정되었습니다. </td>"
								+ " </tr>"
								+ " </div> ";
							cnt1++;
						}

					} else { // 답변 없음
						if (sc == 0) { // 공개
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
								// + " <button type='button' class='btn btn-info' onclick='fn_QnaAnswer()' data-qno='" + item.qno + "' data-user_id='" + item.user_id + "'>답변달기</button>
								+ "</div>"
								+ " </td>"
								+ " </tr>"
								+ " </div> ";
							cnt1++;
						} else { // 비공개
							str += "  "
								+ " <tr id='show" + cnt1 + "' data-qno='" + item.qno + "' data-user_id='" + item.user_id 
								+ "' data-sc='" + sc + "' data-cnt='hide" + cnt1 + "'>"
								+ " <td align='center' > " + item.qno + "</td>"
								+ " <td class='align_left'> " + item.q_title + "</td>"
								+ " <td align='left'> " + item.user_id + "</td>"
								+ " <td align='center' > " + date + "</td>"
								+ " <td align='center' width='90px' height='38px'></td>"
								+ " </tr> "
								+ " <div> "
								+ " <tr id='hide" + cnt1 + "' width='100%' align='center' bgcolor='#f1f3f5' style='display:none;'> "
								+ " <td class='qnadata' colspan='5' style='padding:50px;' align='left'> "
								+ " " + Q + " 비공개로 설정되었습니다. </td>"
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
		let get_sc = $(this).data("sc");
		let get_id = $(this).data("user_id");
		let get_cnt = $(this).data("cnt");
		let get_title = $(this).data("q_title");
		let get_content = $(this).data("q_content");
		let get_answer = $(this).data("q_answer");

		$("#qno").val(qno);
		$("#hiddenqno").val(qno);
		$("#hiddenqno2").val(qno);

		$("#hiddenq_user2").val(get_id);
		
		$("#hiddentitle2").val(get_title);
		$("#hiddencontent2").val(get_content);
		$("#hiddenanswer2").val(get_answer);
		
		let chkHiddenUser = $("#hiddenq_user2").val();

		let viewSecret = document.getElementById(get_cnt);
		console.log("비밀글작성자/" + chkHiddenUser + "/로그인아이디/" + user_id);
		console.log("qno 확인 및 아이디 확인 qno/" + qno + "/비밀글작성자/" + chkHiddenUser + "/비밀여부/" + get_sc);


		// 비밀글이라면
		if (get_sc == 1) {

			let param = {
				qno: qno,
				user_id: user_id,
			};
			
			console.log(param);
			qnaService.qnaGetSecret(param, function(result) {
				if (result) {
					empty(viewSecret);
					let Level = result.qna_level;

					str2 = "";
					if (Level == 1) { // 답변 달렸을 때
						str2 += " "
							+ " <td class='qnadata' colspan='5' style='padding:50px;' align='left'>"
							+ " <span class='bi bi-question-circle-fill'></span>"
							+ " </br> 질문내용:" + result.q_content + " </br>"
							+ " <i class='bi bi-chat-right-dots-fill'></i>"
							+ " <p> 답변내용:" + result.q_answer + "</p>"
							+ " <div><button type='button' class='btn btn-danger secretDelete' onclick='fn_checkReply()' data-qno='" + result.qno
							+ "' data-user_id='" + result.user_id + "' data-q_title='" + result.q_title
							+ "' data-q_content='" + result.q_content + "' data-q_answer='" + result.q_answer + "' >비밀글 확인</button>"
							+ " </div>"
							+ " </td>";
					} else {
						str2 += " "
							+ " <td class='qnadata' colspan='5' style='padding:50px;' align='left'>"
							+ " <span class='bi bi-question-circle-fill'></span>"
							+ " </br> 질문내용:" + result.q_content + " </br>"
							+ " <div><button type='button' class='btn btn-danger secretDelete' onclick='fn_checkReply2()' data-qno='" + result.qno
							+ "' data-user_id='" + result.user_id + "' data-q_title='" + result.q_title
							+ "' data-q_content='" + result.q_content + "' data-q_answer='" + result.q_answer + "' >비밀글 확인</button>"
							+ " </div>"
							+ " </td>";
					}
					// console.log(str2);
					append(viewSecret, str2);
				}
			})

		} else {
			return;
		}// 비밀글 관련 기능 끝

	}) // qno 넘기기 끝

	// 모달 답변작성 버튼 누를 때
	$('#modalQnaAnswerBtn').click(function() {
		if (user_id.value == "") {
			alert('로그인 한 후에 이용 가능합니다.');
			return;
		};

		let q_answer = $('#q_answer').val();
		let qno = $('#hiddenqno2').val();

		let param = {
			qno: qno,
			q_answer: q_answer,
		};

		qnaService.qnaAnswer(param, function(result) {
			if (result) {
				console.log("답변 작성 성공 확인" + result);
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>답변글 등록을 성공했습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#q_answer").val("");
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
		}, 100);
	}); // 모달 답변 등록 종료

	$('#modalQnaChangeBtn').click(function() {
		let qno = $('#hiddenqno2').val();
		let q_title = $('#q_title').val();
		let q_content = $('#q_content').val();
		let quser_id = $("#hiddenuser").val();
		
		console.log("글 작성자"+quser_id+"로그인 아이디"+user_id)
		if (user_id.value == "") {
			alert('로그인 한 후에 이용 가능합니다.');
			return;
		};
		
		if (user_id != quser_id) {
			alert('문의 수정은 글 작성자만 가능합니다.');
			return;
		};

		let param = {
			qno: qno,
			q_title: q_title,
			q_content: q_content,
			user_id: user_id,
		};

		qnaService.qnaChange(param, function(result) {
			if (result) {
				console.log("문의 수정 확인" + result);
				$("#q_title").val("");
				$("#q_content").val("");
				$("#checkmsg2").remove();
				$("#modalDeleteBtn").hide();
				$("#modalCloseBtn").show()
				str1 = "<h3 id='checkmsg2'>문의 글 수정이 완료되었습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#chkModal").fadeIn();
			} else {
				$("#q_title").val("");
				$("#q_content").val("");
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
		}, 100);
	}); // 문의 수정 종료

	// 모달 답변 수정 버튼
	$('#modalQnaModifyBtn').click(function() {
		let q_answer = $('#q_answer').val();
		$("#modalDeleteBtn").hide();

		if (user_id.value == "") {
			alert('로그인 한 후에 이용 가능합니다.');
			return;
		};

		let param = {
			qno: $('#hiddenqno2').val(),
			q_answer: q_answer,
		};

		qnaService.qnaModify(param, function(result) {
			if (result) {
				console.log("답변 수정 확인" + result);

				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>답변글 수정을 성공했습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#q_answer").val("");
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
		}, 100);
	}); // 모달 답변 수정 종료

	// 모달 답변 삭제 버튼 
	$('#modalDeleteBtn').click(function() {

		let quser_id = $("#hiddenuser").val();
	
		if (user_id.value == "") {
			alert('로그인 한 후에 이용 가능합니다.');
			return;
		};

		console.log("작성자 비교 로그인아이디/" + user_id + "/숨겨진아이디/" + quser_id);
		if (user_id != quser_id) {
			alert('문의글 삭제는 작성자만 가능합니다.');
			return;
		};

		let param = {
			qno: $("#hiddenqno2").val(),
		};

		qnaService.qnaDelete(param, function(result) {
			if (result) {
				console.log("성공 확인" + result);
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>문의글 삭제를 성공했습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#q_answer").val("");
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
		}, 100);
	}); // 상품문의 삭제 종료

	// 상품문의 모달
	$("#modalQnaInsertBtn").click(function() {
		let bno = $("#bno").val();
		let q_title = $('#q_title').val();
		let q_content = $('#q_content').val();

		if (user_id.value == "") {
			alert('로그인 한 후에 이용 가능합니다.');
			return;
		};

		if (q_title == "") {
			alert('문의글 제목을 적어주세요.');
			return;
		};

		if (q_content == "") {
			alert('문의글 내용을 적어주세요.');
			return;
		};

		console.log("문의 글 등록 전 밸류 추적 등록제목/" + q_title + "/등록내용/" + q_content);

		let param = {
			bno: bno,
			user_id: user_id,
			q_title: q_title,
			q_content: q_content,
		};

		qnaService.qnaRegister(param, function(result) {
			if (result) {
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				$("#modalDeleteBtn").hide();
				$("#modalChkCancleBtn").hide();
				$("#modalCloseBtn").show();
				str1 = "<h3 id='checkmsg2'>문의 글 등록이 완료되었습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#q_title").val("");
				$("#q_content").val("");
			} else {
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>문의 글 등록을 실패하였습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#q_title").val("");
				$("#q_content").val("");
			}
		})
		$("#qnaModal").fadeOut();
		$("#modalDeleteBtn").show();
		$("#modalChkCancleBtn").show();
		qnaShowList(1);
		setTimeout(function() {
			qnaShowList(1);
		}, 100);
	}); // 등록 종료

	$("#modalQnaInsertSecretBtn").click(function() {
		let bno = $("#bno").val();
		let q_title = $('#q_title').val();
		let q_content = $('#q_content').val();

		if (user_id.value == "") {
			alert('로그인 한 후에 이용 가능합니다.');
			return;
		};

		if (q_title == "") {
			alert('문의글 제목을 적어주세요.');
			return;
		};

		if (q_content == "") {
			alert('문의글 내용을 적어주세요.');
			return;
		};

		console.log("문의 글 등록 전 밸류 추적 " + q_title + " " + q_content);

		let param = {
			bno: bno,
			user_id: user_id,
			q_title: q_title,
			q_content: q_content,
		};

		qnaService.qnaSecretRegister(param, function(result) {
			if (result) {
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>비밀 글 등록이 완료되었습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#q_title").val("");
				$("#q_content").val("");
			} else {
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>비밀 글 등록을 실패하였습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#q_title").val("");
				$("#q_content").val("");
			}
		})
		$("#qnaModal").fadeOut();
		qnaShowList(1);
		setTimeout(function() {
			qnaShowList(1);
		}, 100);
	}); // 비밀글 등록 종료


	$("#modalQnaCancleBtn").click(function() {
		$("#qnaModal").fadeOut();
	}); // 문의글 모달 종료

	$("#modalCloseBtn").click(function() {
		$("#chkModal").fadeOut();
	}); // 확인창 모달 종료

	$('#modalChkCancleBtn').click(function() {
		$("#chkModal").fadeOut();
	}); // 확인창 모달 종료


	$("#board_list1").on("click", "button", function() {
		let qno = $(this).data("qno");
		let get_id = $(this).data("user_id");
		let get_qtitle = $(this).data("q_title");
		let get_qcontent = $(this).data("q_content");
		let get_qanswer = $(this).data("q_answer");

		$("#qno9").val(qno);
		$('#q_title9').val(get_qtitle);
		$('#q_content9').val(get_qcontent);
		$('#q_answer9').val(get_qanswer);
		$("#hiddenq_user2").val(get_id);
		
		let quser_id = $("#hiddenq_user2").val();
		console.log("아이디 추적"+quser_id+" 기존 밸류 "+get_id);
	})// qno 넘기기를 여기서 받는다면~ 어떻게 될까요~? 

	$("#secret1").click(function() {
		// 비밀 수정
		
		let secretQno = $("#qno9").val();
		let secretUser = $("#hiddenuser").val();
		let current_user_id = user_id;

		let q_title = $('#q_title9').val();
		let q_content = $('#q_content9').val();

		let param = {
			qno: secretQno,
			q_title: q_title,
			q_content: q_content,
			user_id: secretUser,
		};
		console.log("지금 니 아이디가 모여" + current_user_id + "/글작성자/" + secretUser);
		console.log("비밀 수정글 변수 추적 답변글번호/"  + secretQno + "/문의아이디/" + secretUser + "/문의내용/" + q_title+"/"+q_content);

		if (current_user_id.value == "") {
			alert('로그인 한 후에 이용 가능합니다.');
			return;
		};

		if (current_user_id != secretUser) {
			alert('비밀글 수정은 작성자만 가능합니다.');
			return;
		};

		qnaService.qnaChange(param, function(result) {
			if (result) {
				console.log("문의 수정 확인" + result);
				$("#q_title9").val("");
				$("#q_content9").val("");
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>비밀 글 수정이 완료되었습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#chkModal").fadeIn();
			} else {
				$("#q_title9").val("");
				$("#q_content9").val("");
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>비밀 글 수정이 실패하였습니다.</h3>";
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
		let secretQno = $("#qno9").val();
		let current_user_id = user_id;

		if (current_user_id == "") {
			alert('로그인 한 후에 이용 가능합니다.');
			return;
		};

		let q_answer = $('#q_answer9').val();

		param = {
			qno: secretQno,
			q_answer: q_answer,
		};

		qnaService.qnaAnswer(param, function(result) {
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
		let secretQno = $("#qno9").val();
		let current_user_id = user_id;
		let q_answer = $('#q_answer9').val();

		if (current_user_id == "") {
			alert('로그인 한 후에 이용 가능합니다.');
			return;
		};


		let param = {
			qno: secretQno,
			q_answer: q_answer,
		};

		qnaService.qnaModify(param, function(result) {
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
		let current_user_id = user_id;
		let secretQno = $("#qno9").val();
		let secretUser = $("#hiddenuser").val();

		if (current_user_id == "") {
			alert('로그인 한 후에 이용 가능합니다.');
			return;
		};

		if (current_user_id != secretUser) {
			alert('비밀글 공개는 작성자만 가능합니다.');
			return;
		};

		let param = {
			qno: secretQno,
			user_id: secretUser,
		};

		qnaService.qnaSecretOpen(param, function(result) {
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
		let secretQno = $("#qno9").val();
		let secretUser = $("#hiddenuser9").val();
		let current_user_id = user_id;

		if (current_user_id == "") {
			alert('로그인 한 후에 이용 가능합니다.');
			return;
		};

		if (current_user_id != secretUser) {
			alert('문의글 삭제는 작성자만 가능합니다.');
			return;
		};

		let param = {
			qno: secretQno,
		};

		console.log("문의 글 삭제 변수 추적 문의글번호/" + param.qno + "/답변자아이디/" + param.user_id);

		qnaService.qnaDelete(param, function(result) {
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

})




