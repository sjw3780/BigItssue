<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
$(document).ready(function(){
	getLocList();
})
var curPage = 0;

function getCurPage(a){
	curPage = a
	getLocList();
}


function detailView(a){
	window.location.href="/admin/seller/view?locNo="+a
}


function listDelete(a){
	console.log(a);
	
	$.ajax({
		url :"/admin/seller/sellerInfoDelete"
		,type:"get"
		,data:{
			locNo : a
		}
		,dataType:"json"
		,success : function(){
			console.log('성공')
			getLocList()
		}
		,error : function(e){
			console.log('실패')
			console.log(e)
		}
	})
	
}


function getLocList(){
	
	$.ajax({
		url:"/admin/seller/getSellerInfolist"
		,type:"get"
		,data:{condition : $("#condition").val()
			,searchWord : $("#searchWord").val()
			,curPage : curPage
		}
		,dataType: "json"
		,success : function(res){
			console.log('성공');
			var list = res.sellerLocList;
			var p = res.paging;
			var condition = res.condition;
			var searchWord = res.searchWord;
			var spmpc = p.startPage - p.pageCount
			var cpm1 = p.curPage - 1
			var cpp1 = p.curPage + 1
			var spppc = p.startPage + p.pageCount
			
			console.log("'a'");
			
			console.log(p);
			console.log(condition);
			console.log(searchWord);
			var html =""
				html += '<div>'
				html += '<table class="table table-striped">'
				html += '<tr style="background: gray; text-align: center;">'
				html += '<td><b>No.</b></td>'
				html += '<td><b>호선</b></td>'
				html += '<td><b>판매장소</b></td>'
				html += '<td><b>출구(위치)</b></td>'
				html += '<td><b>카드결제여부</b></td>'
				html += '<td><b>판매시간</b></td>'
				html += '<td><b>판매자</b></td>'
				html += '<td><b> 수정 │ 삭제</b></td>'
				html += '</tr>'
				$.each(list, function(index, value){
					html +='<tr style="text-align: center;">'
					html += '<td>'+value.locNo+'</td>'
					html += '<td>'+value.zone+'</td>'
					html += '<td>'+value.station+'</td>'
					html += '<td>'+value.spot+'</td>'
					html += '<td>'+value.sellerCard+'</td>'
					html += '<td>'+value.sellerTimeS+'~'+value.sellerTimeE+'</td>'
					html += '<td>'+value.sellerId+'</td>'
					html += '<td><input class="btn btn-primary" type="button" value="수정" onclick="detailView('+value.locNo+')">'
					html += '<input class="btn btn-danger" type="button" value="삭제" onclick="listDelete('+value.locNo+')"> </td>'
					html +='</tr>'
					
				})
					html += '</table>'
					html += '</div>'
					
					html += '<div class="text-center">'
					html += '<ul class="pagination pagination-sm">'
					if(p.curPage != 1){
// 					html +=	'<li><a href='+'"/admin/seller/list?curPage=1&condtion='+condition+'&searchWord='+searchWord+'">&larr;처음</a></li>'
					html += '<li><button class="btn btn-default" onclick="getCurPage('+1+')">&larr;처음</button></li>'
					}
					if(p.curPage <= p.pageCount){		
// 					html +=	'<li class="disabled" id="id"><span>&laquo;</span></li>'
					html += '<li class="disabled"><button class="btn btn-default">&laquo;</button></li>'
					}
					if(p.curPage >= p.pageCount){
// 					html +=	'<li><a href='+'"/admin/seller/list?curPage='+spmpc+"&condition="+condition+"&searchWord="+searchWord+'">&laquo;</a></li>'
					html += '<li><button class="btn btn-default" onclick="getCurPage('+spmpc+')">&laquo;</button></li>'
					}
					
					
					if(p.curPage == 1){
// 					html += '<li class="disabled"><span>&lt;</span></li>'
					html += '<li class="disabled"><button class="btn btn-default">&lt;</button></li>'
					}
					if(p.curPage != 1){
					html += '<li><button class="btn btn-default" onclick="getCurPage('+cpm1+')">&lt;</button></li>'	
// 					html += '<li><a href='+'"/admin/seller/list?curPage='+cpm1+"&condition="+condition+"&searchWord="+searchWord+'">&lt;</a></li>'	
					}
					
					for(var i = p.startPage; i <= p.endPage; i++){
						if(p.curPage == i){
							html += '<li class="active"><button class="btn btn-primary" onclick="getCurPage('+i+')">'+i+'</button></li>'
// 							html += '<li class="active"><a href='+'"/admin/seller/list?curPage='+i+'&condition='+condition+'&searchWord='+searchWord+'">'+i+'</a></li>'
// 							html += '<li class="active"><a herf="#">'+i+'</a></li>'
						}
						if(p.curPage != i){
							html += '<li><button class="btn btn-default"'+ 'onclick="getCurPage('+i+')">'+i+'</button></li>'
// 							html += '<li><a href='+'"/admin/seller/list?curPage='+i+'&condition='+condition+'&searchWord='+searchWord+'">'+i+'</a></li>'
						}
					}
					
					if(p.curPage == p.totalPage){
// 						html += '<li class="disabled"><span>&gt;</span></li>'
						html += '<li><button class="btn btn-default">&gt;</button></li>'
					}
					if(p.curPage != p.totalPage){
// 						html += '<li><a href='+'"/admin/seller/list?curPage='+cpp1+"&condition="+condition+"&seachWord="+searchWord+'">&gt;</a></li>'
						html += '<li><button class="btn btn-default" onclick="getCurPage('+cpp1+')">&gt;</button></li>'
					}
					
					
					
					if(p.endPage == p.totalPage){
// 						html += '<li class="disabled"><span>&raquo;</span></li>'
						html += '<li><button class="btn btn-default">&raquo;</button><li>'
					}
					if(p.endPage != p.totalPage){
// 						html += '<li><a href='+'"/admin/seller/list?curPage='+spppc+"&condition="+condition+"&searchWord="+searchWord+'">&raquo;</a></li>'
						html += '<li><button class="btn btn-default" onclick="getCurPage('+spppc+')">&raquo;</button></li>'
					}
					
					
					html += '</div>'
					html += '</ul>'
				
			$("#locListArea").html(html);
			
		}
		,error : function(e){
			console.log('실패')
		}
	})
	
}

</script>    
    
    
<div class="right-block">
	<div class="col-xs-1">
		<select class="form-control" style="width: 80px;" name="condition" id="condition" >
			<option value="zone">호선</option>
			<option value="station">판매장소</option>
			<option value="sellerId">판매자</option>
		</select>
	</div>
	<div class="col-xs-2">
		<input class="form-control form-inline" style="width: 180px;" type="search" name="searchWord" value="${searchWord }" id="searchWord">
	</div>
	<div class="col-xs-1">
		<input class="form-inline btn" type="button" onclick="getLocList()" value="찾기">
	
	</div>
</div>    
<br>

<!-- 스크립트로 html들어가는 영역  -->
<div id="locListArea">



</div>    




