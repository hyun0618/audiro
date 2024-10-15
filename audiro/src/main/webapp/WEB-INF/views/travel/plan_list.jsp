<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>audiro</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
		crossorigin="anonymous">
	<link href="https://webfontworld.github.io/Cafe24SsurroundAir/Cafe24SsurroundAir.css" rel="stylesheet">	
		
	<c:url var="listCSS" value="/css/plan_list.css" />
	<link rel="stylesheet" href="${listCSS}">
</head>
<body>
	<div class="container-fluid">
		<%@ include file="../fragments/header.jspf"%>
		<main>
			<div class="row" id="allDiv">
				<div class="col-2"></div>
				<div class="col-8">
				
					<div class="card">
						<div class="card-header">
							<c:url var="planSearchPage" value="/travel/plan/search" />
							<form method="get" action="${planSearchPage}">
						
								<div class="row align-items-center justify-content-between">
								    <div class="col text-center">
								        <p style="font-size: 20px; margin-top:10px;">여행코스</p>
								    </div>
									<div class="col-auto">
								        <select class="form-control" name="category" onchange="this.form.submit()">
								            <option value="c" ${empty param.category or param.category == 'c' ? 'selected' : ''}>작성순</option>
								            <option value="t" ${param.category == 't' ? 'selected' : ''}>제목순</option>
								        </select>
								    </div>
								</div>
							</form>
						</div>
						
						<div class="tableList card-body m-5">
							<table class="table mb-0">
								<thead>
									<tr>
										<th>제목</th>
										<th>기간</th>
										<th></th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${travelPlan}" var="t">
										<tr>
											<td><c:url var="planDetailsPage"
													value="/travel/plan/details">
													<c:param name="id" value="${t.travelPlanId}"></c:param>
												</c:url> <a href="${planDetailsPage}" class="link">${t.title}</a></td>
											<c:set var="days" value="${t.duration+1}"></c:set>
											<td>${t.startDate}-${t.endDate}</td>
											<td>${t.duration}박${days}일</td>
											
											<td class="img" plan-id="${t.travelPlanId}">
											<img class="deletePlanImg" src="/audiro/images/delete.png" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
				<div class="col-2"></div>
			</div>
		</main>
	</div>
	</div>
	<div class="container-fluid">
		<%@ include file="../fragments/footer.jspf"%>
	</div>
	<%@ include file="../fragments/modal_delete_plan.jspf"%>

	<script>
		const signedInUser = `${signedInUser}`;
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<c:url var="listJS" value="/js/plan_list.js" />
	<script src="${listJS}"></script>

	<c:url var="dataJS" value="/js/data.js" />
	<script src="${dataJS}"></script>
</body>