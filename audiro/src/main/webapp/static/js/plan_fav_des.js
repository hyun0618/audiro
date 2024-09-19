/**
 * /audiro/plan.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', () => {

	getAllFavDestination();

	function getAllFavDestination() {
		const uri = '/audiro/api/plan/fav';
		axios
			.get(uri)
			.then((response) => {
				makeFavDestinationElements(response.data);
			})
			.catch((error) => {
				console.log(error);
			});

	}

	function makeFavDestinationElements(data) {

		const divFav = document.querySelector('div#favDestination');

		let htmlStr = '';
		for (let destination of data) {
			htmlStr += `
				<div class="favDestination col-2" fav-id="${destination.favoriteDestinationId}">
						<div class="card fav">
							<img src="${destination.imgUrl}" class="card-img-top" alt="${destination.name}"/>
							<div class="card-body my-2">
								<div class="cardTitle">${destination.name}</div>
							</div>
						</div>
				</div>
			`;
		}

		divFav.insertAdjacentHTML('beforeend', htmlStr);

		const favDestination = document.querySelectorAll('div.favDestination');
		favDestination.forEach((f) => {
			f.removeEventListener('click', getFavDestination);
			f.addEventListener('click', getFavDestination);
		})

	}

	function getFavDestination(event) {
		const favoriteDestinationId = event.target.closest('.favDestination').getAttribute('fav-id');
		const uri = `/audiro/api/plan/fav/${favoriteDestinationId}`;
		axios
			.get(uri)
			.then((response) => {
				favDestinationToPlan(response.data);

			})
			.catch((error) => {
				console.log(error);
			})

	}

	function favDestinationToPlan(data) {
		const dayId = document.querySelector('div.click').getAttribute('day-id');
		const plan = document.querySelector(`div#dayPlan${dayId} .timeline ul`);
		const htmlStr = `
                <li id="list${data.favoriteDestinationId}" class="list row g-0 p-2" des-id="${data.destinationId}">
                	<div class="name col-10">${data.name}</div>
                	<div class="deleteFav col-2">
						<img class="deleteFavImg" src="/audiro/images/delete.png" />
					</div>
                </li>
		`;
		plan.insertAdjacentHTML('beforeend', htmlStr);
		
		deleteEvent();
	}
	
	function deleteEvent(){
		const deleteFavImg = document.querySelectorAll('.deleteFavImg');
		deleteFavImg.forEach((d) => {
			d.removeEventListener('click', deleteFavDestinationInPlan); // 중복 방지 위해 기존 이벤트 제거
			d.addEventListener('click', deleteFavDestinationInPlan);
		})

	}
	

	function deleteFavDestinationInPlan(event) {
		const favList = event.target.closest('.list');
		favList.remove();

	}



});