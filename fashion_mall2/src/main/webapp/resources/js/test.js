/**
 * 
 */
 
 $(document).ready(function() {
    console.log('ready');

    optionAdd();
});

function optionAdd() {
    console.log('optionadd');
    var optionIndex = 1;
    //$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
    $("#optionAdd_btn").on("click",function() {
		console.log('옵션추가');
        $("#optionIndex").append("<div class='form-group'><input placeholder='옵션' "
        			+"class='form-control input-lg' type='text' style='float:left;' name='item_option"
         			+ "' id='item_option'>"
                    + "<input type='number' name='item_vol' id='item_vol' placeholder='수량'>"
                    + "<button type='button' style='float:right;' id='optionDelBtn' class='btn-btn dark'>"
                    + "삭제" + "</button></div>");

    });

    $(document).on("click", "#optionDelBtn", function() {
        $(this).parent().remove();

    });

};

function fnSubmit() {

    var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    // var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/; 전화번호용

    if ($("#item_name").val() == null || $("#item_name").val() == "") {
        alert("상품명을 입력해주세요.");
        $("#item_name").focus();

        return false;
    }

    if ($("#item_price").val() == null || $("#item_price").val() == "") {
        alert("상품가격를 입력해주세요.");
        $("#item_price").focus();

        return false;
    }

    if ($("#item_size").val() == null || $("#item_size").val() == "") {
        alert("상품사이즈를 입력해주세요.");
        $("#item_size").focus();

        return false;
    }

    if ($("#item_color").val() == null || $("#item_color").val() == "") {
        alert("상품색상을 입력해주세요.");
        $("#item_color").focus();

        return false;
    }

    if ($("#item_vol").val() == null || $("#item_vol").val() == "") {
        alert("상품수량을 입력해주세요.");
        $("#item_vol").focus();

        return false;
    }

    if ($("#item_content").val() == null || $("#item_content").val() == "") {
        alert("상품내용을 입력해주세요.");
        $("#item_content").focus();

        return false;
    }

    if ($("#item_subcontent").val() == null
            || $("#item_subcontent").val() == "") {
        alert("상품설명을 입력해주세요.");
        $("#item_subcontent").focus();

        return false;
    }

    if ($("#item_model").val() == null || $("#item_model").val() == "") {
        alert("모델정보를 입력해주세요.");
        $("#item_model").focus();

        return false;
    }

    if ($("#item_option").val() == null || $("#item_option").val() == "") {
        alert("상품옵션을 입력해주세요.");
        $("#item_option").focus();

        return false;
    }

    if ($("#itemMainImg").val() == null || $("#itemMainImg").val() == "") {
        alert("상품썸네일사진 등록해주세요.");
        $("#itemMainImg").focus();

        return false;
    }
    
    if ($("#itemSubImg").val() == null || $("#itemSubImg").val() == "") {
        alert("상품썸네일보조사진 등록해주세요.");
        $("#itemSubImg").focus();

        return false;
    }

    if (confirm("등록하시겠습니까?")) {

        $("#itemInsertForm").submit();

        return false;
    }
}