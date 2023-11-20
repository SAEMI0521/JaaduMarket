<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/used/menu_head.jsp"%>

<style>
.content {
	min-height: 1500px;
	width: 1100px;
	margin-left: 300px;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	margin-top: 10px;
	margin-botton: 10px;
}

.used-list-rest {
	display: flex;
	flex-direction: column;
}

.button {
	width: 500px;
	height:50px;
	display: flex;
	align-self: flex-end;
	justify-content: flex-end;
}

.button input {
	width: 200px;
	height: 50px;
}

.paging {
	display: flex;
	align-content: center;
	justify-content: center;
	margin: 30px;
}

.content div, h3 {
	margin: 10px;
}

.content a {
	flex-basis: calc(30% - 20px);
	margin: 10px;
	text-decoration: none;
}

.content img {
	width: 300px;
	height: 300px;
	box-sizing: border-box;
	border-radius: 12px;
	border: 1px solid lightgray;
}

.listnulltext {
	margin-top: 300px;
	margin-left: 400px;
	height: 30px;
}
</style>

<div class="used-list-rest">
	<div class="button">
		<c:if test="${login !=null }">
			<input type="button" value="중고거래 올리기" onclick="location.href='${cpath}/used/insertform'"> 
		</c:if> 
	</div>
<div class="list">
	<div class="content">
		<c:if test="${list != null }">
			<c:forEach var="vo" items="${list }" varStatus="loop">
				<a href="${cpath }/used/content?u_seq=${vo.u_seq }">
					<div>
						<c:if test="${vo.u_img_name == null }">
							<img src="${cpath }/resources/used/no-image.png">
						</c:if>
						<c:if test="${vo.u_img_name != null }">
							<img src="${cpath }/resources/used/${vo.u_seq}/${vo.u_img_name }">
						</c:if>
					</div>
							<h3>${vo.u_title }</h3>
							<div>${vo.addr1_name }&nbsp;${vo.addr2_name }&nbsp;${vo.addr3_name }</div>
						
						<div>
							<c:if test="${vo.u_trade_status=='1' }">
								<span style="color: #f00;" align="center"><b>거래완료!</b></span>
							</c:if>
							<c:if test="${vo.u_trade_status=='2' }">
								<span style="color: #00f;" align="center"><b>☆예약중☆</span>
							</c:if>
								<c:if test="${vo.u_share == '1' }">
									<span style="color: #D25A5A;">♥나눔♥</span>
								</c:if>
								<c:if test="${vo.u_share != '1' }">
									<span><fmt:formatNumber value="${vo.u_price}" pattern="#,##0" />원</span>
								</c:if>
					</div>
									<div class="card-counts">
						<span>관심&nbsp;${vo.fav_count}&nbsp;</span>&nbsp;∙&nbsp;<span>채팅&nbsp;${vo.chat}&nbsp</span>
					</div> 
					<div>
						<c:if test="${vo.u_boost_count != 0}">
							끌올 ${vo.u_boost_count }회 / ${vo.u_boost }
						</c:if>
						<c:if test="${vo.u_boost_count == 0}">
							${vo.u_date }
						</c:if>	
					</div>
				</a>
			</c:forEach>
		</c:if>
		<c:if test="${list == null }">
			<h2 class="listnulltext">게시물이 존재하지 않습니다.</h2>
		</c:if>
	</div> 
<c:if test="${u_cate_seq != 0 && list !=null}">
	<div align="center" class="paging">
		<c:if test="${paging.prev }">
			<a href="${cpath }${url }?page=${paging.begin - 1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }"
			step="1">
			<c:choose>
				<c:when test="${i == paging.page }">
					<strong>[${i}]</strong>
				</c:when>
				<c:otherwise>
					<a href="${cpath }${url }?page=${i}">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next }">
			<a href="${cpath }${url }?page=${paging.end + 1}">[다음]</a>
		</c:if>
	</div>
	</c:if>
	</div>
<%@ include file="/WEB-INF/views/used/menu_foot.jsp"%>
