<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header1.jsp" %>
<link rel="stylesheet" href="/resources/css/main2.css" />
<link rel="stylesheet" href="/resources/css/search.css" />

   
 <%-- 옛날에 썼던 search창
 
  <div class="container">
    <div>상품검색</div>
   <fieldset style="padding-top:30px; padding-bottom:0px; border: 2px solid #d3d3d3;">
   
   <p style="border-bottom:1px solid black; text-align:center; padding-bottom:40px;">
   <span style="border-bottom:1px solid black;"><i class="bi bi-search"></i>검색하신단어 : ${cri.keyword}</span>
   </p>
      <table style="margin: 5px;">
      
         <tr>
            <th style="text-align:center; height:30px;">
               <div>상품유형</div>
            </th>
            <td style="width:15%;">
               
                        <select name="cate" id="search" style="width:200px;">
                           <option value="all"  <c:out value="${cri.cate == '' ? 'selected':'' }"/>>통합검색</option> 
                           <option value="top" <c:out value="${cri.cate == 'top' ? 'selected':'' }"/>>상의</option>
                           <option value="pants" <c:out value="${cri.cate == 'pants' ? 'selected':'' }"/>>하의</option>
                           <option value="outer" <c:out value="${cri.cate == 'outer' ? 'selected':'' }"/>>아우터</option>
                           <option value="shoes" <c:out value="${cri.cate == 'shoes' ? 'selected':'' }"/>>신발</option>
                           <option value="stuff" <c:out value="${cri.cate == 'stuff' ? 'selected':'' }"/>>잡화</option>
                        </select>
               
            </td>
            <th style="text-align:center; width:15%;">      
               <div style="">제품명/키워드</div>   
            </th>
            <td style="width:15%;">
               <div>
                  <ul style="list-style:none; padding-left:0;">
                     <li style="width:100px"><input type="text" name="keyword" id="" placeholder="검색어를 입력하세요" style="text-align:center; width:500px;" value="${cri.keyword}"/></li>
                  </ul>   
               </div>
            </td>
             <td style="width:15%">
               <div class="aaa">
                  <a class="bbb" href="">
                     <span >search</span>
                     <button type="submit">search</button>
                  </a>
               </div>
            </td>  
         </tr>
         <tr style="">
         <th style="text-align:center; width:15%; height:30px;">
               <div>상품정렬</div>
            </th>
            <td style="width:15%;">
               <div>
                        <select name="sort" id="search" style="width:200px;">
                           <option value="" <c:out value="${cri.sort == '' ? 'selected':'' }"/>>-------- </option>
                           <option value="N" <c:out value="${cri.sort == 'N' ? 'selected':'' }"/>>최신순</option>
                           <option value="S" <c:out value="${cri.sort == 'S' ? 'selected':'' }"/>>판매량</option>
                           <option value="H" <c:out value="${cri.sort == 'H' ? 'selected':'' }"/>>높은가격순</option>
                           <option value="L" <c:out value="${cri.sort == 'L' ? 'selected':'' }"/>>낮은가격순</option>
                           <option value="T" <c:out value="${cri.sort == 'T' ? 'selected':'' }"/>>이름순</option>
                        </select>
               </div>
            </td>
            <th style="text-align:center; width:15%;">      
               <div style="">상세 내용</div>   
            </th>
            <td style="width:15%;">
               <div>
                  <ul style="list-style:none; padding-left:0;">
                     <li style="width:100px"><input type="text" name="content" id="" placeholder="검색어를 입력하세요" style="text-align:center;" value="${cri.content}" /></li>
                  </ul>   
               </div>
            </td>
         </tr>
         
      </table>
   
   </fieldset>  --%>

<!-- ---  검색 창 다시 한번 만들어보기  --- -->

<div class="container">
   <form action="" method="get" id="searchForm">
      <table>
         <tr>
            <td colspan="5" id="keyword" >
               <div>
                  <span style="border-bottom:1px solid black;"  ><i class="bi bi-search"></i>검색하신 단어 : ${cri.keyword}</span>
               </div>
            </td>
         </tr>
         <tr>
            <td>상품 유형 </td>
            <td>
            
                  <select name="cate" class="input" style="width:200px;">
                     <option value="all"  <c:out value="${cri.cate == '' ? 'selected':'' }"/>>통합검색</option> 
                     <option value="top" <c:out value="${cri.cate == 'top' ? 'selected':'' }"/>>상의</option>
                     <option value="pants" <c:out value="${cri.cate == 'pants' ? 'selected':'' }"/>>하의</option>
                     <option value="outer" <c:out value="${cri.cate == 'outer' ? 'selected':'' }"/>>아우터</option>
                     <option value="shoes" <c:out value="${cri.cate == 'shoes' ? 'selected':'' }"/>>신발</option>
                     <option value="stuff" <c:out value="${cri.cate == 'stuff' ? 'selected':'' }"/>>잡화</option>
                  </select>
            </td>
            <td>제품명/키워드</td>
            <td><input type="text" name="keyword" id="" class="input" placeholder="검색어를 입력하세요" style="text-align:center; width:500px;" value="${cri.keyword}"/></td>
            <td rowspan="2"><button type="submit" id="searchBtn">검색하기</button></td>
         </tr>
         <tr>
            <td>상품 정렬</td>
            <td>
               <select name="sort" id="search" class="input" style="width:200px;">
                  <option value="" <c:out value="${cri.sort == '' ? 'selected':'' }"/>>-------- </option>
                  <option value="N" <c:out value="${cri.sort == 'N' ? 'selected':'' }"/>>최신순</option>
                  <option value="S" <c:out value="${cri.sort == 'S' ? 'selected':'' }"/>>판매량</option>
                  <option value="H" <c:out value="${cri.sort == 'H' ? 'selected':'' }"/>>높은가격순</option>
                  <option value="L" <c:out value="${cri.sort == 'L' ? 'selected':'' }"/>>낮은가격순</option>
                  <option value="T" <c:out value="${cri.sort == 'T' ? 'selected':'' }"/>>이름순</option>
               </select>
            </td>
            <td>상세 내용</td>
            <td>
               <input type="text" name="content" class="input"  id="" placeholder="검색어를 입력하세요" style="text-align:center; width:500px;" value="${cri.content}" />
            </td>
         </tr>
      </table>
   </form>




<!-- <script>
   let urlArr = [];
</script> -->
   
<!-- 게시판 리스트 반복문 -->
<%--  <c:forEach var="dto" items="${sList}" varStatus="status">
    <script>
       var uploadpath = '${attach[status.index].uploadpath}'; 
        var uuid = '${attach[status.index].uuid}';
        var filename = '${attach[status.index].filename}';       
        
        if(uploadpath!=''){
            var result = encodeURIComponent(uploadpath+"/"+uuid+"_"+filename);          
           urlArr.push(result);
        }
        
   </script>
      <div class="search">
          <div class="search-1">
            <div class="search-2">
              <div class="search-img">
               <a href="/board/productDetail?bno=${dto.bno}">
                <img class="imgSrc" src="#" alt="쇼핑몰사진" style="width: 195px; height: 250px;">
              </a> 
             </div>
              <div class="search-text">
                <div class="">
                 <a href="/board/productDetail?bno=${dto.bno}"> <h5 class="">${dto.p_name}</h5></a>
                  <p class="container">${dto.p_content}</p>
                  <p class=""><small class="">Last updated 3 mins ago ${attach[status.index].filename}</small></p>
                </div>
              </div>
              <div class="search-price">
              <h5>price : ${dto.p_price}</h5>
              </div>
            </div>
          </div>
       </div>
       
</c:forEach>
             --%>
             
      <div style="display:none;" id="testList">
         ${sList}
      </div>       
<c:forEach var="dto" items="${sList}" varStatus="status">



     <div class="container section" style="border:0;">
     
     <div >
             <input type="hidden" value="${dto.p_code}" class="pcode"/>
         <a href="/board/productDetail?bno=${dto.bno}">
             <div id="productImg${dto.p_code}"></div>
             </a>
            
             </div>
 <table style="border:0;">      
        <tr style="border:0;">
           <td style="border:0;">
              <div style="border:0;">
                      <a href="/board/productDetail?bno=${dto.bno}">
                      <div>
                         <div class="text1 left">${dto.p_name}</div></a>
                         <div class="text2 left">&nbsp&nbsp&nbsp ${dto.p_price}</div>
                         <c:if test="${dto.p_disprice == 0}">
                            <div class="text3 left">\ ${dto.p_price}</div>
                         </c:if>
                         <c:if test="${dto.p_disprice > 0}">
                            <div class="text3 left">\ ${dto.p_price-dto.p_price*dto.p_disprice*0.01}</div>
                         </c:if>
                      
                      </div>
              </div>
           </td>
        </tr>
     </table>

</div>
   <%-- 여기까지가 section 나누기 부분 --%>   

</c:forEach>   





      <div class="text-center">
                <ul class="pagination">
                  <c:if test="${pageDto.prev}">
                       <li class="paginate_button previous"><a href="${pageDto.startPage-1}">Previous</a></li>
                              </c:if>
                              <c:forEach var="idx" begin="${pageDto.startPage}" end="${pageDto.endPage}">
                                 <li class="paginate_button  ${pageDto.cri.pageNum==idx?'active':''}"><a href="${idx}">${idx}</a></li>
                              </c:forEach>
                              <c:if test="${pageDto.next}">
                        <li class="paginate_button next"><a href="${pageDto.endPage+1}">Next</a></li>
                     </c:if>
                </ul>
              </div>
      <!-- criteria 공유 폼 -->
      

</div>      
   <!-- pageNum, amount, type, keyword 값을 부를 때 
        ① pageDto(pageDto.cri.pageNum) 
         ② cri(criteria.pageNum(ModelAttribute 가 사용 안된 경우), cri.pageNum)         
     -->
   <form action="" id="actionForm">
    <input type="hidden" name="pageNum" value="${cri.pageNum}" />
   <input type="hidden" name="amount" value="${cri.amount}" /> 
    <input type="hidden" name="cate" value="${cri.cate}" />
   <input type="hidden" name="keyword" value="${cri.keyword}" />
   <input type="hidden" name="sort" value="${cri.sort}" />
   <input type="hidden" name="content" value="${cri.content}" /> 
</form>

<script>
$(function(){
   
   

   $(".imgSrc").each(function(idx,item){
      
      console.log("url "+item);      
      
      $(this).attr("src","/display?fileName="+urlArr[idx]);
   })
   
   
   
   
   
   
})
</script>      
<script src="/resources/js/searchList.js"></script>
      
<!--  <script>
      $(function(){
         let pcodeAll = document.querySelectorAll(".pcode");
         console.log("매번 p_code를 보내냐?222222"+pcodeAll);
         
          pcodeAll.forEach(element => {
                 console.log(element);
           });
         
      })
   
   </script> -->
   
   </div>
   
<%@include file="../includes/footer.jsp" %>