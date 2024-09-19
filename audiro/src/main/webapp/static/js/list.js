/**
 * post/review/list에 포함
 */

document.addEventListener('DOMContentLoaded', function() {

	//여행후기 찜 담기 클릭 이벤트
	const btnReviewLike = document.querySelectorAll('.likeReview');
	btnReviewLike.forEach(btn => {
		btn.addEventListener('click', updateReveiw);

	});
	
	//여행후기 찜담기(찜담고 삭제기능)
	async function updateReveiw(event) {
		
		if (signedInUser === null || signedInUser === '') {
					if (confirm("로그인하시겠습니까?")) {
						window.location.href = '/audiro/user/signin';
					}
					return;
				}

		const tag = event.currentTarget;
		const postId = tag.attributes['data-review-id'].nodeValue; // 클릭된 버튼의 data-review-id 값 가져오기
		const id = document.querySelector('input#usersId').value;
		//const favoriteId
		console.log('Post ID:', postId); // 디버깅을 위해 콘솔에 출력
		console.log('Users ID:', id); // 디버깅을 위해 콘솔에 출력
		
		try {
			const response = await axios.post('/audiro/api/review/likeReview/toggle', { postId },{ usersId });
			console.log('Server response:', response.data);
			if (response.data) {
				tag.classList.add('active'); // 좋아요 추가된 경우 UI 업데이트
			} else if (!response.data) {
				tag.classList.remove('active'); // 좋아요 제거된 경우 UI 업데이트
			}
		} catch (error) {
			console.error('Error toggling favorite:', error);
		}
	}



		
			/*
		    // 버튼 요소를 ID로 가져옵니다
		    const sortLatestButton = document.querySelector('button#sortLatest');
		    const sortLikesButton = document.querySelector('button#sortLikes');

		    // 최신순 버튼 클릭 이벤트 리스너 추가
		    sortLatestButton.addEventListener('click', function() {
				alert('클릭');
		        sortReviews('latest');
		    });

		    // 좋아요순 버튼 클릭 이벤트 리스너 추가
		    sortLikesButton.addEventListener('click', function() {
				alert('클릭');
		        sortReviews('likes');
		    });

		    // 정렬된 리뷰 목록을 가져오는 함수
		    function sortReviews(sortOption) {
		        console.log('Selected option:', sortOption);

		        // Axios를 사용하여 선택된 값을 쿼리 파라미터로 포함한 GET 요청을 보냅니다
		        axios.get(`/api/review/list?sort=${sortOption}`)
		            .then(response => {
		                // 응답 데이터를 처리합니다
		                const data = response.data;
		                updateReviewList(data);
		            })
		            .catch(error => {
		                // 에러를 처리합니다
		                console.error(error);
		            });
		    }

		    // 리뷰 목록을 업데이트하는 함수
		    function updateReviewList(data) {
		        // 리뷰를 표시할 컨테이너를 가져옵니다
		        const reviewContainer = document.getElementById('reviewContainer');
		        reviewContainer.innerHTML = '';

		        // 데이터를 반복하면서 각 리뷰에 대한 HTML을 생성합니다
		        data.forEach(review => {
		            const reviewElement = document.createElement('div');
		            reviewElement.classList.add('review-item');
		            reviewElement.innerHTML = `
					<div class="row row-cols-1 row-cols-md-4 g-4">
					                           <!-- 여행후기 카드 반복문  이미지변경하기 -->
					                           <c:forEach var="list" items="${list}">
					                               <div class="col">
					                               <input id="postId" name="postId" type="hidden" value="${post.postId}" /> 
					                               <input id="usersId" name="usersId" type="hidden" value="${signedInUsersId}" /> 
					                                   <div class="card h-80">
					                                       <div class="position-relative">
					                                           <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f8f357b6-4fdf-41dc-a6ff-cfddb4087409" class="card-img-top" alt="...">
					                                           <p class="btn likeReview ${list.favoritePost != null ? 'active' : ''}" data-review-id="${list.postId}" style="position: absolute; top: 10px; right: 1px; z-index: 10;">
					                                               <img src="<c:url value='/images/like.png' />" alt="like" style="width: 24px; height: 24px;" />
					                                           </p>
					                                       </div>
					                                       <div class="card-body">
					                                           <!-- 클릭 시 상세페이지로 이동하는 링크 -->
					                                           <h5 class="card-title">
					                                               <a href="details?postId=${list.postId}&id=${list.id}" class="card-link">${list.title}</a>
					                                           </h5>
					                                           <a href="#" class="list-group-item list-group-item-action">
					                                               <div class="d-flex w-100 justify-content-between">
					                                                   <small>${list.modifiedTime}</small>
					                                               </div>
					                                           </a>
					                                       </div>
					                                   </div>
					                               </div>
					                           </c:forEach>
					                       </div>
		            `;
		            reviewContainer.appendChild(reviewElement);
						});
					}
					*/

				
});
