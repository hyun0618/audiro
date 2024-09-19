/**
 * /audiro/plan_details.jsp에 포함
 */
document.addEventListener('DOMContentLoaded', () => {

	const dayContainer = document.querySelector('div#dayContainer');
	const planContainer = document.querySelector('div#planContainer');
	const travelPlanId = dayContainer.getAttribute('plan-id');
	let detailedPlans = [];
	let maxDay = 0;

	const uri = `/audiro/api/plan/details/${travelPlanId}`;
	axios
		.get(uri)
		.then((response) => {
			getDayAndPlan(response.data);
			getDetailedPlans(response.data);

		})
		.catch((error) => {
			console.log(error);
		});

	function getDayAndPlan(data) {
		maxDay = data.maxDay;
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
                                ${i}일차
                            </div>
                        </div>
                    `;
			planStr = `
                	<div id="dayPlan${i}" day-id="${i}" class="plans row g-0 m-2">
						<h5>${i}일차</h5>
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
		detailedPlans = data.list;
		maxDay = data.maxDay;
		detailedPlans.forEach((d) => {
			const li=document.querySelector(`#dayPlan${d.day} ul`);
			let htmlStr = `
                <li id="list${d.favoriteDestinationId}" class="list row g-0 my-1 p-2" des-id="${d.destinationId}">
	            	<div class="name col-10">${d.name}</div>
                </li>
		`;
			
			li.insertAdjacentHTML('beforeend', htmlStr);
		});
	}


});