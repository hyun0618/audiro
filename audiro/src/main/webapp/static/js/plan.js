/**
 * /audiro/plan.jsp에 포함
 */

$(document).ready(function() {

	let index = 1;
	const currentPath = window.location.pathname;
	const btnCreateDay = document.querySelector('button#createDay');
	const dayContainer = document.querySelector('div#dayContainer');
	const planContainer = document.querySelector('div#planContainer');
	const deleteAll = document.querySelector('button#deleteAll');
	const btnSave = document.querySelector('#btnSave');
	const deleteModal = new bootstrap.Modal(document.querySelector('div.modal'), { backdrop: true });
	const btnConfirm = document.querySelector('#btnConfirm');
	let startDateValue = document.querySelector('input#startDate').value;
	let endDateValue = document.querySelector('input#endDate').value;
	const modifyUrl = "/audiro/travel/plan/modify";
	
	/*if (signedInUser === null || signedInUser === '') {
		if (confirm("로그인하시겠습니까?")) {
			window.location.href = '/audiro/user/signin';
		}
		return;
	}
*/

	// Datepicker 초기화
	$('#startDate').datepicker({
		format: 'yyyy-mm-dd',
		todayHighlight: true,
		startDate: '0d'
	}).on('changeDate', function() {
		getDateRange(false); // showModal을 false로 전달
	});

	$('#endDate').datepicker({
		format: 'yyyy-mm-dd',
		todayHighlight: true,
		startDate: '0d'
	}).on('changeDate', function() {
		getDateRange(false); // showModal을 false로 전달
	});
	
	

	// 여행계획 수정 시에 eventlistener 초기화
	document.addEventListener('click', function(event) {
		if (event.target.classList.contains('deleteDayImg')) {
			deleteDayAndPlan(event);
		} else if (event.target.classList.contains('deleteFavImg')) {
			deleteList(event);
		}
	});

	// 수정 용
	if (currentPath === modifyUrl) {
		modifyForm();
	} else {
		defaultDay();
	}


	btnSave.addEventListener('click', (event) => {
		event.preventDefault(); // 폼 제출 기본 동작 막기
		if (currentPath === modifyUrl) {
			updateTravelPlan();
		} else {
			createTravelPlan();
		}
	});

	deleteAll.addEventListener('click', (event) => {
		event.preventDefault(); // 폼 제출 기본 동작 막기
		deleteAllDay(true); // showModal을 true로 전달
	});

	btnCreateDay.addEventListener('click', (event) => {
		event.preventDefault(); // 폼 제출 기본 동작 막기
		createAll();
	});

	dayContainer.addEventListener('click', (event) => {
		event.preventDefault(); // 폼 제출 기본 동작 막기
		clickDays(event);

	});
	
	/*planContainer.addEventListener('click', (event) => {
		event.preventDefault(); // 폼 제출 기본 동작 막기
		clickDays(event);

	});
	*/
	function createAll() {
		createDayForm();
		createPlanForm();
		index++;
		console.log(`c=${index}`);
	}

	function updateTravelPlan() {
		const travelPlanId = document.querySelector('#travelPlanIdForModify').value;
		const title = document.querySelector('input#title').value;
		let startDate = document.querySelector('input#startDate').value;
		let endDate = document.querySelector('input#endDate').value;

		const startDateToDate = new Date(startDate);
		const endDateToDate = new Date(endDate);

		const millisecondsInADay = 24 * 60 * 60 * 1000;
		let duration = (endDateToDate - startDateToDate) / millisecondsInADay;

		if (startDate === '') startDate = null;
		if (endDate === '') endDate = null;

		if (startDate == null || endDate == null) {
			const days = document.querySelectorAll('div.days');
			days.forEach((d) => {
				const startDay = 1;
				let endDay = d.getAttribute('day-id');
				duration = endDay - startDay;
			})
		}

		const data = { travelPlanId, title, startDate, duration, endDate };
		const uri = '/audiro/api/plan/modify';
		axios
			.post(uri, data)
			.then((response) => {
				createrDetailedPlan(travelPlanId, startDate, endDate)
				// 계획 저장 후 해당 계획의 상세보기로 이동
				const redirectUrl = `/audiro/travel/plan/details?id=${travelPlanId}`;
				window.location.href = redirectUrl; // 클라이언트 측에서 페이지 이동
			})
			.catch((error) => {
				console.log(error);
			})
	}

	function createTravelPlan() {
		const usersId=document.getElementById('signedInUsersId').value;
		console.log(usersId);
		const title = document.querySelector('input#title').value;
		let startDate = document.querySelector('input#startDate').value;
		let endDate = document.querySelector('input#endDate').value;
		let duration = 0;

		// 날짜 미입력시 일차만 저장하기
		if (startDate === '') startDate = null;
		if (endDate === '') endDate = null;
		let startTime = startDate;
		let endTime = endDate;


		if (startDate == null && endDate == null) {
			const days = document.querySelectorAll('div.days');
			if (days.length > 0) {
				const startDay = 1;
				const endDay = days[days.length - 1].getAttribute('day-id');
				duration = endDay - startDay;
			}
		} else if (startDate == null || endDate == null) {
			btnSave.diabled = true;
			const alert = document.querySelector('div#alert');
			alert.innerHTML = '';
			const htmlStr = `
            <div class="alert alert-primary d-flex align-items-center" role="alert">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
                    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                </svg>
                <div>날짜를 모두 작성해주세요.</div>
            </div>
        `;
			alert.insertAdjacentHTML('beforeend', htmlStr);
			return;
		} else {
			const startDateToDate = new Date(startDate);
			const endDateToDate = new Date(endDate);

			const millisecondsInADay = 24 * 60 * 60 * 1000;
			duration = (endDateToDate - startDateToDate) / millisecondsInADay;
		}


		if (title === '') {
			const alert = document.querySelector('div#alert');
			alert.innerHTML = '';
			btnSave.diabled = true;
			const htmlStr = `
            <div class="alert alert-primary d-flex align-items-center" role="alert">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
                    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                </svg>
                <div>제목을 작성해주세요.</div>
            </div>
        `;
			alert.insertAdjacentHTML('beforeend', htmlStr);
			return;
		}

		const data = { usersId, title, startDate, duration, endDate };
		let travelPlanId = 0;
		const uri = '/audiro/api/plan/create/travelPlan';
		axios
			.post(uri, data)
			.then((response) => {
				travelPlanId = response.data;
				createrDetailedPlan(travelPlanId, startTime, endTime);
				// 페이지 새로고침
				window.location.reload();
			})
			.catch((error) => {
				console.log(error);
			});
	}

	function createrDetailedPlan(travelPlanId, startTime, endTime) {
		let detailedPlans = [];
		const detailedPlanElements = document.querySelectorAll(`div.plans`);

		detailedPlanElements.forEach((d) => {
			const favoriteDestinationElements = d.querySelectorAll('.list');
			favoriteDestinationElements.forEach((list) => {
				const destinationId = list.getAttribute("des-id");
				const day = d.getAttribute('day-id')


				const data = { travelPlanId, destinationId, day, startTime, endTime };
				detailedPlans.push(data);
			});
		});
		const uri = '/audiro/api/plan/create/detailedPlan';
		axios
			.post(uri, detailedPlans)
			.then((response) => {
				console.log(response.data);
			})
			.catch((error) => {
				console.log(error);
			});


	}


	function getDateRange(showModal) {
		const alert = document.querySelector('div#alert');

		alert.innerHTML = '';

		let startDate = document.querySelector('input#startDate').value;
		let endDate = document.querySelector('input#endDate').value;

		// 달력 날짜 입력시 '일차추가' 버튼 사라지게 한다.
		if (startDate !== '' || endDate !== '') {
			btnCreateDay.style.display = 'none';
		}

		// 날짜 지정할 때, 요소가 초기화 되는 것을 막음.
		if (startDate === '' || endDate === '') {
			return;
		}

		if (startDate && endDate) {
			const startDateToDate = new Date(startDate);
			const endDateToDate = new Date(endDate);


			if (startDateToDate > endDateToDate) {
				alert.innerHTML = '';
				btnSave.diabled = true;
				startDate = '';
				endDate = '';
				// TODO: 문제없으면 삭제
				//deleteAllElements();
				const htmlStr = `
				<div class="alert alert-primary d-flex align-items-center" role="alert">
				  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
				    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
				  </svg>
				  <div>
				    시작일과 완료일을 제대로 입력해주세요.
				  </div>
				</div>
			`;
				alert.insertAdjacentHTML('beforeend', htmlStr);
				return;
			}

			const differenceInMillis = endDateToDate - startDateToDate;
			// 밀리초를 일수로 변환
			const differenceInDays = Math.floor(differenceInMillis / (1000 * 60 * 60 * 24)) + 1;
			const duration = document.querySelector('input#duration');
			duration.value = differenceInDays;
			let currentDay = index - 1;

			// 현재 생성된 일차 수와 날짜 차이를 비교하여 일차를 증가 또는 감소시킴
			if (differenceInDays >= 0) {
				if (differenceInDays < currentDay) {
					// 현재 일차 수가 날짜 차이보다 많으면 초과된 일차 삭제
					for (let i = currentDay; i > differenceInDays; i--) {
						deleteExceededIndex(i);
					}
				} else if (differenceInDays === currentDay) {
					return;
				} else {
					// 현재 일차 수가 날짜 차이보다 적으면 일차 추가
					for (let i = currentDay + 1; i <= differenceInDays; i++) {
						createAll();
					}
				}
			}/*else if(differenceInDays<0){
				// 날짜 범위가 없는 경우 모든 일차 삭제
				deleteAllDay(showModal); // showModal 변수를 전달
			}*/
		}


	}

	// 날짜 지정시 초과된 index 삭제
	function deleteExceededIndex(dayIndex) {
		const dayElement = document.querySelector(`#index${dayIndex}`);
		const planElement = document.querySelector(`#dayPlan${dayIndex}`);
		if (dayElement) {
			dayElement.remove();
		}
		if (planElement) {
			planElement.remove();
		}
		index--;
	}

	// day의 deleteImg를 클릭해서 삭제
	// day가 삭제될경우, 해당하는 plan도 삭제
	function deleteDayAndPlan(event) {
		// 이벤트 요소의 조상 중에서 가장 가까운 .days
		const dayElement = event.target.closest('.days');// 가장 가까운 .days 요소 찾기
		// 부모요소의 day-id 속성값 가져오기
		const dayId = dayElement.getAttribute('day-id');
		const planElement = document.querySelector(`#dayPlan${dayId}`);

		// deleteDayAndPlan 함수 내 모달 초기화
		const deleteModal = new bootstrap.Modal(document.querySelector('div.modal'), { backdrop: true });
		deleteModal.show();
		btnConfirm.removeEventListener('click', confirmDeleteDay); // 기존 이벤트 리스너 제거
		btnConfirm.addEventListener('click', confirmDeleteDay); // 새로운 이벤트 리스너 추가

		function confirmDeleteDay() {
			console.log(index);
 
			// 현재 endDate의 값을 가져와서 Date 객체로 변환
			const endDateValue = document.querySelector('#endDate').value;
			if (endDateValue) {
				const endDate = new Date(endDateValue);
				// 날짜에서 하루를 뺀다
				endDate.setDate(endDate.getDate() - 1);
				// endDate를 'yyyy-mm-dd' 형식으로 포맷팅
				const formattedDate = endDate.toISOString().slice(0, 10);

				// endDate에 특정 날짜 설정
				$('#endDate').datepicker('setDate', formattedDate);
			}

			// 요소 삭제 및 초기화
			dayElement.remove();
			planElement.remove();
			resetDay();
			deleteModal.hide();
			//index--;
			console.log(index);

		}

	}
	// .list 요소를 삭제하는 함수
	function deleteList(event) {
		// 부모 요소 중에서 .list 클래스를 가진 요소를 찾음
		const favList = event.target.closest('.list');
		if (favList) {
			favList.remove();
		}
	}


	function clickDays(event) {
		const days = document.querySelectorAll('.days');
		const clickedDay = event.target.closest('.days');
		const plans = document.querySelectorAll('.plans');
		const timeline = document.querySelectorAll('.timeline');
		

		// 모든 요소를 non-click으로 초기화
		days.forEach((d) => {
			d.classList.remove("click");
			d.classList.add("non-click");
		});
		plans.forEach((p) => {
			p.classList.remove("click");
			p.classList.add("non-click");
		});

		timeline.forEach((t) => {
			t.classList.remove("darkColor");
			t.classList.add("brightColor");
		});

		if (clickedDay) {
			const id = clickedDay.getAttribute('day-id');
			const clickedPlan = document.querySelector(`#dayPlan${id}`)
			const clickedTimeline = clickedPlan ? clickedPlan.querySelector('.timeline') : null;
			console.log(clickedPlan);
			console.log(clickedTimeline);
			if (clickedTimeline) {
				// 클릭된 요소의 하위 timeline 요소에 대해 클래스 설정
				clickedTimeline.classList.remove("brightColor");
				clickedTimeline.classList.add("darkColor");
			}
			// 클릭된 요소만 click 클래스로 설정
			clickedDay.classList.remove('non-click');
			clickedDay.classList.add('click');

			clickedPlan.classList.remove('non-click');
			clickedPlan.classList.add('click');
			console.log(`id=${id}`);
			document.querySelector(`#dayPlan${id}`).classList.remove('non-click');
			document.querySelector(`#dayPlan${id}`).classList.add('click');
		}





	}


	function createDayForm() {
		const dayContainer = document.querySelector('div#dayContainer');
		let htmlStr = '';
		htmlStr = `
			<div class="days non-click row g-0 my-1 p-2" id="index${index}" day-id="${index}">
				<div class="col-2">
					<img class="collapseImg" alt="collapseImg" src="/audiro/images/collapse.png" />
				</div>
				<div class="col-7">
					<a href="#dayPlan${index}" class="link">${index}일차</a>
				</div>
				<div id="delete${index}" class="deleteDay col-3">
					<img class="deleteDayImg" src="/audiro/images/delete.png" />
				</div>
			</div>
		`;
		dayContainer.insertAdjacentHTML('beforeend', htmlStr);

		// 모든 일차를 non-click 상태로 설정
		const days = document.querySelectorAll('.days');
		days.forEach((d) => {
			d.classList.remove('click');
			d.classList.add('non-click');
		})


		// 최신 일차를 click 상태로 설정
		const newDay = document.querySelector(`#index${index}`);
		newDay.classList.remove('non-click');
		newDay.classList.add('click');

		addNewEvent();

	}

	function addNewEvent() {
		// 새로운 deleteDayImg 요소에 이벤트 리스너 추가
		// TODO:이거 때매 중복됨. 필요없으면 삭제하자.
	/*	const deleteDayImg = document.querySelectorAll('img.deleteDayImg');
		deleteDayImg.forEach((d) => {
			d.removeEventListener('click', deleteDayAndPlan); // 중복방지
			d.addEventListener('click', deleteDayAndPlan);
		});
*/
		// 새로운 collapseImg 요소에 이벤트 리스너 추가
		const collapseImg = document.querySelectorAll('img.collapseImg');
		collapseImg.forEach((c) => {
			c.removeEventListener('click', collapseDay);
			c.addEventListener('click', collapseDay);
		});
	}

	// collapse 이미지 변경
	function collapseDay(event) {
		const collapseImgPath = '/audiro/images/collapse.png';
		const expandImgPath = '/audiro/images/expand.png';

		// 절대 경로 비교를 위해 new URL 사용
		const currentImgSrc = new URL(event.target.src, window.location.origin).pathname;

		if (currentImgSrc === collapseImgPath) {
			event.target.src = expandImgPath;
		} else {
			event.target.src = collapseImgPath;
		}
	}

	function deleteAllDay(showModal) {
		// modal이 true일 경우 모달 창 띄우기
		if (showModal) {
			deleteModal.show();
			btnConfirm.removeEventListener('click', confirmDeleteAll); // 기존 이벤트 리스너 제거
			btnConfirm.addEventListener('click', confirmDeleteAll); // 새로운 이벤트 리스너 추가

		} else { // modal이 false일 경우 창 안 띄우고 바로 삭제
			deleteAllElements();
			defaultDay();
		}

		function confirmDeleteAll() {
			deleteModal.hide();
			deleteAllElements();
			defaultDay();
		}

	}


	// 해당하는 day의 모든 일차 plan 삭제
	function deleteAllElements() {
		const dayElement = document.querySelectorAll('.days');
		const planElement = document.querySelectorAll('.plans');
		dayElement.forEach((d) => d.remove());
		planElement.forEach((p) => p.remove());
		index = 1;

		// endDate 리셋
		$('#startDate').datepicker('setDate', '');
		// endDate 리셋
		$('#endDate').datepicker('setDate', '');
		// 일차추가 버튼 보이기
		btnCreateDay.style.display = 'block';



	}

	function defaultDay() {
		const days = document.querySelectorAll('div.days');

		if (days.length == 0) {

			index = 1;
			createDayForm();
			createPlanForm();
			index++;
		}
	}


	function createPlanForm() {
		let htmlStr = '';
		htmlStr = `
			<div id="dayPlan${index}" day-id="${index}" class="plans non-click row g-0 m-2">
				<div class="daySize">${index}일차</div>
				<div class="timeline brightColor">
					<ul>
				 	</ul>
				</div>
				<div class="date">
				</div>
			</div>
		`;
		planContainer.insertAdjacentHTML('beforeend', htmlStr);

		// 모든 일차를 non-click 상태로 설정
		const plans = document.querySelectorAll('.plans');
		plans.forEach((p) => {
			p.classList.remove('click');
			p.classList.add('non-click');
		})
		// 모든 일차를 non-click 상태로 설정
		const timeline = document.querySelectorAll('.timeline');
		timeline.forEach((t) => {
			t.classList.remove('darkColor');
			t.classList.add('brightColor');
		})
		// 최신 일차를 click 상태로 설정
		const newDay = document.querySelector(`#dayPlan${index}`);
		newDay.classList.remove('non-click');
		newDay.classList.add('click');
		
		const newTimeLine=newDay.querySelector('.timeline');
		newTimeLine.classList.remove('brightColor');
		newTimeLine.classList.add('darkColor');
		
	}


	// 삭제 시에 day 리셋
	function resetDay() {
		const days = document.querySelectorAll('div.days');
		let indexReset = 1;

		days.forEach((day) => {
			const dayLink = day.querySelector('a');
			const deleteDiv = day.querySelector('div.deleteDay');

			day.id = `index${indexReset}`;
			day.setAttribute('day-id', indexReset);

			dayLink.textContent = `${indexReset}일차`;
			dayLink.setAttribute('href', `#dayPlan${indexReset}`);

			deleteDiv.id = `delete${indexReset}`;

			indexReset++;

		});
		index = indexReset;
		console.log(`reset${index}`);
		// 한 개의 일차만 남은 경우 다시 일차 생성
		defaultDay();
		indexReset = 1;

		const plans = document.querySelectorAll('div.plans');
		plans.forEach((plan) => {
			plan.id = `dayPlan${indexReset}`;
			const planNum = plan.querySelector('.daySize');
			planNum.textContent = `${indexReset}일차`;
			plan.setAttribute('day-id', indexReset);
			indexReset++;
		});

	}


	function modifyForm() {
		const travelPlanIdForModify = document.querySelector('#travelPlanIdForModify').value;
		const uri = `/audiro/api/plan/details/${travelPlanIdForModify}`;
		axios
			.get(uri)
			.then((response) => {
				index = response.data.maxDay + 1;
				getDayAndPlan(response.data);
				getDetailedPlans(response.data);
				// 페이지 로딩 -> axios로 데이터 받아서 요소에 저장 -> 바뀐 요소 다시 초기화
				startDateValue = document.querySelector('input#startDate').value;
				endDateValue = document.querySelector('input#endDate').value;
				// 날짜 존재 시 일차 추가 버튼 숨기기
				if (startDateValue !== '' || endDateValue !== '') {
					btnCreateDay.style.display = 'none';
				}
				/*	else {
						btnCreateDay.style.display = 'block';
					}
	*/
			})
			.catch((error) => {
				console.log(error);
			});

	}

	function getDate(dateArray) {
		// 배열에서 연도, 월, 일 추출
		const year = dateArray[0];
		const month = dateArray[1].toString().padStart(2, '0');  // 월을 2자리로 만들고 부족한 부분은 0으로 채움
		const day = dateArray[2].toString().padStart(2, '0');    // 일을 2자리로 만들고 부족한 부분은 0으로 채움

		// 'yyyy-mm-dd' 형식의 문자열 조합
		const formattedDate = `${year}-${month}-${day}`;
		return formattedDate;

	}
	function getDayAndPlan(data) {
		const travelPlan = data.travelPlan;

		const title = travelPlan.title;
		const duration = travelPlan.duration;
		const startDate = travelPlan.startDate;
		const endDate = travelPlan.endDate
		const startDateElement = document.querySelector('input#startDate');
		const endDateElement = document.querySelector('input#endDate');

		// startDate와 endDate 값이 null이 아닌 경우에만 입력
		if (startDate && endDate) {
			startDateElement.value = getDate(travelPlan.startDate);
			endDateElement.value = getDate(travelPlan.endDate);
		}

		// 각 필드에 travelPlan 객체의 값 설정하기
		document.querySelector('input#title').value = title;
		document.querySelector('input#duration').value = duration;
		/*document.querySelector('input#startDate').value=startDate;
		document.querySelector('input#endDate').value=endDate;*/

		const maxDay = data.maxDay;
		let dayStr = '';
		let planStr = '';

		// 이미 해당 day-id를 가진 요소가 있는지 체크

		for (let i = 1; i <= maxDay; i++) {
			dayStr = `
                        <div class="days non-click row g-0 my-1 p-2" id="index${i}" day-id="${i}">
                            <div class="col-2">
                                <img class="collapseImg" alt="collapseImg" src="/audiro/images/collapse.png" />
                            </div>
                            <div class="col-7">
                                <a href="#dayPlan${i}" class="link">${i}일차</a>
                            </div>
                            <div id="delete${index}" class="deleteDay col-3">
								<img class="deleteDayImg" src="/audiro/images/delete.png" />
							</div>
                        </div>
                    `;
			planStr = `
                	<div id="dayPlan${i}" day-id="${i}" class="plans non-click row g-0 m-2">
						<div class="daySize">${i}일차</div>
						<div class="timeline brightColor">
							<ul>
						 	</ul>
						</div>
						<div class="date">
						</div>
					</div>
                `;
			dayContainer.insertAdjacentHTML('beforeend', dayStr);
			planContainer.insertAdjacentHTML('beforeend', planStr);
		}
	}

	function getDetailedPlans(data) {
		let detailedPlans = data.list;
		detailedPlans.forEach((d) => {
			const li = document.querySelector(`#dayPlan${d.day} ul`);
			let htmlStr = `
                <li id="list${d.favoriteDestinationId}" class="list row g-0 p-2" des-id="${d.destinationId}">
	            	<div class="name col-10">${d.name}</div>
	            	<div class="deleteFav col-2">
						<img class="deleteFavImg" src="/audiro/images/delete.png" />
					</div>
                </li>
		`;

			li.insertAdjacentHTML('beforeend', htmlStr);
		});
	}

});



