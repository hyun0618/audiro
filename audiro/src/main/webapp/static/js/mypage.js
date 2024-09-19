/**
 * /post/review/mypage.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', function() {


	//여행후기 찜 담기 클릭 이벤트
	const btnReviewLike = document.querySelectorAll('.likeReviewBtn');
	btnReviewLike.forEach(btn => {
		btn.addEventListener('click', favoriteReview);
	});

	//유저 관심 담기 클릭 이벤트
	//const btnUserLike = document.querySelector('#userLike');
	//btnUserLike.addEventListener('click', favoriteUser);







	////////////////////////////////////////////////////////////
		
	// 여행후기 찜담기(찜담고 삭제기능)
		async function favoriteReview(event) {
			
			/*const signedInUsersId = document.getElementById('userId')
			if (signedInUsersId === null || signedInUsersId === '') {
			            if (confirm("로그인하시겠습니까?")) {
			                window.location.href = '/audiro/user/signin';
			            }
			            return;
			        }*/

					
		    const tag = event.currentTarget;
		    const postId = tag.attributes['data-review-id'].nodeValue; // 클릭된 버튼의 data-review-id 값 가져오기
		    
			try {
		        const response = await axios.post('/audiro/api/review/likeReview/toggle', { postId });
		        if (response.data) {
		            tag.classList.add('active'); // 찜 추가된 경우 UI 업데이트
		        } else if (!response.data) {
		            tag.classList.remove('active'); // 찜 제거된 경우 UI 업데이트
		        }
		    } catch (error) {
		        console.error('Error toggling favorite:', error);
		    }
		}
	/*
	// 유저 관심 담기(담고 삭제하기)
	async function favoriteUser(event) {
		alert('관심유저 버튼!!!!!');
		if (signedInUsersId === null || signedInUsersId === '') {
		            if (confirm("로그인하시겠습니까?")) {
		                window.location.href = '/audiro/user/signin';
		            }
		            return;
		        }

		const tag = event.currentTarget;
		const id = tag.attributes['data-user-id'].nodeValue; // 클릭된 버튼의 data-user-id 값 가져오기
		//const favoriteUserId = "'{post[0].usersId}';
		try {
			const response = await axios.post('/audiro/api/review/likeUser/toggle', { id, favoriteUserId });
			if (response.data) {
				tag.classList.add('active'); // 찜 추가된 경우 UI 업데이트
				tag.querySelector('img').src = `../../images/like_red2.png`;
			} else if (!response.data) {
				tag.classList.remove('active'); // 찜 제거된 경우 UI 업데이트
				tag.querySelector('img').src = `../../images/like_black.png`;
			}
		} catch (error) {
			console.error('Error toggling like:', error);
		}
	}
	*/
	
/*11111번찜담기 기능
	//여행후기 찜담기(찜담고 삭제기능)
	async function favoriteReview(event) {
		alert('후기찜버튼!!!!!');
		const tag = event.currentTarget;
		const postId = tag.attributes['data-review-id'].nodeValue; // 클릭된 버튼의 data-review-id 값 가져오기
		try {
			const response = await axios.post('/audiro/api/review/likeReview/toggle', { postId });
			if (response.data) {
				tag.classList.add('active'); // 찜 추가된 경우 UI 업데이트
			} else if (!response.data) {
				tag.classList.remove('active'); // 찜 제거된 경우 UI 업데이트
			}
		} catch (error) {
			console.error('Error toggling favorite:', error);
		}
		*/



		

});



