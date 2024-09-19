<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>CourseDetails</title>
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link href="https://webfontworld.github.io/Cafe24SsurroundAir/Cafe24SsurroundAir.css" rel="stylesheet">
	
	<c:url var="planCSS" value="/css/plan.css" />
	<link rel="stylesheet" href="${planCSS}">
	
	<c:url var="timelineCSS" value="/css/plan_timeline.css" />
	<link rel="stylesheet" href="${timelineCSS}">
</head>
<body>
	<div class="container-fluid">
		<%@ include file="../fragments/header.jspf"%>
	</div>
	<div class="container-fluid text-center" id="allDiv">
		<div class="row"> 
			<div class="col-1"></div>
			<div class="col-10" id="cardContainer">
				<c:url var="modifyPlan" value="/travel/plan/modify"></c:url>
				<form method="post" action="${modifyPlan}">
					<div class="row g-0">
						<div class="col-3 p-2 ">
							<div class="row g-0">
								<div id="btnContainer" class="btn-group text-start ms-3"
									role="group" aria-label="Basic example">
									<button class="btn btn-secondary" type="submit" id="btnSave">수정</button>
								</div>
							</div>
							<div id="dayContainer" plan-id="${travelPlan.travelPlanId}">
							</div>
						</div>

						<div class="col-9">
							<div id="planContainer">
								<div class="row g-0 m-2">
									<div class="col-sm-6 col-12 mb-2">
										<div id="title" class="mb-2">
											<input type="text" id="title" maxlength="40"
												value="${travelPlan.title}" class="form-control" />
										</div>
									</div>
									<div class="date col-sm-3 col-6 mb-2">
										<input type="text" id="startDate" class="form-control"
											value="${travelPlan.startDate}" readonly /> <input
											type="hidden" id="duration" />
									</div>
									<div class="date col-sm-3 col-6 mb-2">
										<input type="text" id="endDate" class="form-control"
											value="${travelPlan.endDate}" readonly />
									</div>
									<!-- hidden input for travelPlanId -->
									<input type="hidden" id="travelPlanId" name="travelPlanId"
										value="${travelPlan.travelPlanId}" />


								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		<div class="col-1"></div>
		</div>
	</div>
	<div class="container-fluid">
		<%@ include file="../fragments/footer.jspf"%>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<!-- Axios JS 라이브러리 -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<script>
		//const signedInUser='${signedInUser}';
	</script>

	<c:url var="detailsJS" value="/js/plan_details.js" />
	<script src="${detailsJS}">
		
	</script>


</body>
</html>