document.addEventListener('DOMContentLoaded', () => {
	// Details 수정 버튼
	const modifyBtn = document.querySelector('#modifybtn');
	if (modifyBtn) {
		modifyBtn.addEventListener('click', modifyBtnListener);
	}

	// Details 삭제 버튼
	const deleteBtn = document.querySelector('#deletebtn');
	if (deleteBtn) {
		deleteBtn.addEventListener('click', deletebtnBtnListener);
	}
	
	// Details 댓글 등록 버튼
	const registerCommentBtn = document.querySelector('button#registerCommmetbtn');
	registerCommentBtn.addEventListener('click', registerCommentBtnListener);

	////////////////////////////////////////////////////////////////////////////////

	// 댓글 등록 함수
	function registerCommentBtnListener(e) {
		console.log('버튼 클릭 이벤트 감지됨'); // 디버그 로그 추가
		const usersId = document.getElementById('loginUsersId').value;

		// 사용자가 로그인하지 않은 경우 로그인 페이지로 리디렉션합니다.
		
		if (usersId === null || usersId === '') {
			if (confirm("로그인 후 댓글등록 가능합니다. 로그인하시겠습니까?")) {
				window.location.href = '/audiro/user/signin';
			}
			return;
		}

		const postId = document.querySelector('#postId').value;
		const content = document.querySelector('#comment').value;
		/*
		// 댓글 내용이 비어 있는지 확인합니다.
		if (content === '') {
			alert('댓글 내용을 입력하세요.');
			return;
		}
*/
		const data = { postId, content, usersId };

		// axios를 사용하여 서버에 댓글 데이터를 전송합니다.
		axios.post('/audiro/api/comment/new', data)
			.then((response) => {
				getAllComments(); // 댓글 목록을 새로 고칩니다.
				document.querySelector('textarea#comment').value = ''; // 댓글 입력란을 초기화합니다.
			})
			.catch((error) => {
				console.error('댓글 등록 중 오류 발생:', error); // 에러 로그 출력
			});
	}

	// 여행후기 수정 버튼 함수
	function modifyBtnListener() {
		const form = document.querySelector('.reviewBtn');
		const postId = document.querySelector('input#postId').value;
		console.log(postId);
		form.action = 'modify';
		form.method = 'get';
		form.submit();
	}

	// 여행후기 삭제 버튼 함수
	function deletebtnBtnListener(e) {
		e.preventDefault();
		const result = confirm('정말 삭제할까요?');
		if (result) {
			const form = document.querySelector('.reviewBtn');
			form.action = 'delete';
			form.method = 'post';
			form.submit();
		}
	}

	////////////////////////////////////////////////////////////////////////////////


/*
	// 댓글 수정 클릭하면 저장, 취소 버튼으로 변경
	window.cBtnModify = function (commentsId) {
		alert('댓글 수정 클릭!');
		const commentElement = document.querySelector(`#comment-content-${commentsId}`);
		const originalContent = commentElement.innerText;

		// 아이콘들을 감싸는 컨테이너를 숨김
		const buttonContainer = commentElement.closest('.custom-label').querySelector('.edit-icons');
		buttonContainer.style.display = 'none';

		// 수정 중에 textarea와 저장/취소 버튼을 추가
		commentElement.outerHTML = `
			<textarea id="comment-edit-${commentsId}" class="form-control" rows="3" style="max-height: 100px;">${originalContent}</textarea>
			<button id="save-btn-${commentsId}" class="btn btn-primary" onClick="saveComment(${commentsId})">저장</button>
			<button id="cancel-btn-${commentsId}" class="btn btn-secondary" onClick="cancelEdit(${commentsId}, '${originalContent}')">취소</button>
		`;
	};

	// 댓글 수정 저장 함수
	async function saveComment(commentsId) {
		const editedContent = document.querySelector(`#comment-edit-${commentsId}`).value;
		const uri = `/audiro/api/comment/${commentsId}`;
		try {
			const response = await axios.put(uri, { commentsId, content: editedContent });
			if (response.data.success) {
				const commentContainer = document.querySelector(`#comment-edit-${commentsId}`).closest('.custom-label');
				commentContainer.innerHTML = `
					<span id="comment-content-${commentsId}">${editedContent}</span>
					<div class="edit-icons" style="display: flex; align-items: center;">
						<button id="modifybtn(${commentsId})" onClick="cBtnModify(${commentsId})" class="btn btn-link" style="margin-left: 10px; padding: 0; border: none; background: none;">
							<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
								<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325"/>
							</svg>
						</button>
						<button id="deletebtn(${commentsId})" onClick="cBtnDelete(${commentsId})" class="btn btn-link" style="margin-left: 10px; padding: 0; border: none; background: none;">
							<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
								<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>
							</svg>
						</button>
					</div>
				`;
				getAllComments();
			}
		} catch (error) {
			console.error('댓글 저장 중 오류 발생:', error);
		}
	}

	// 댓글 수정 취소 함수
	function cancelEdit(commentsId, originalContent) {
		const commentContainer = document.querySelector(`#comment-edit-${commentsId}`).closest('.custom-label');
		commentContainer.innerHTML = `
			<span id="comment-content-${commentsId}">${originalContent}</span>
			<div class="edit-icons" style="display: flex; align-items: center;">
				<button id="modifybtn(${commentsId})" onClick="cBtnModify(${commentsId})" class="btn btn-link" style="margin-left: 10px; padding: 0; border: none; background: none;">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
						<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325"/>
					</svg>
				</button>
				<button id="deletebtn(${commentsId})" onClick="cBtnDelete(${commentsId})" class="btn btn-link" style="margin-left: 10px; padding: 0; border: none; background: none;">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
						<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>
					</svg>
				</button>
			</div>
		`;
	}

	// 대댓글 등록하면 아래 댓글창 나타내기
	function activeReply(commentsId) {
		document.querySelectorAll('.replyCommentGroup').forEach(rcg => rcg.style.display = 'none');
		document.querySelector(`#replyContent${commentsId}`).style.display = 'flex';
	}

	// 대댓글 등록 함수
	function addReply(commentsId) {
		const postId = document.querySelector('#postId').value;
		const content = document.querySelector(`#comment${commentsId != undefined ? commentsId : ''}`).value;

		if (content === '') {
			alert('댓글 내용을 입력하세요.');
			return;
		}

		const data = { postId, content, parentCommentId: commentsId };
		const uri = `/audiro/api/comment/`;
		axios.post(uri, data)
			.then((response) => {
				alert('댓글 등록 성공!!');
				getAllComments();
			})
			.catch((error) => {
				console.error('댓글 등록 중 오류 발생:', error);
			});
	}
	
	
	
	
	
	// 댓글 삭제 함수
	function cBtnDelete(commentsId) {
		alert('댓글 삭제 클릭!');
		const uri = `/audiro/api/comment/${commentsId}`;
		axios.delete(uri)
			.then(response => {
				alert('댓글 삭제 성공!');
				getAllComments(); // 댓글 목록을 다시 불러와 갱신합니다.
			})
			.catch(error => {
				console.error('댓글 삭제 중 오류 발생:', error);
			});
	}
	*/
	
	
	// 모든 댓글 가져오기 함수
	function getAllComments() {
		const postId = document.querySelector('#postId').value;

		const uri = `/audiro/api/comment/${postId}`;
		axios.get(uri)
			.then(response => {
				console.log('댓글 데이터:', response.data); // 응답 데이터 로그 출력
				document.querySelector('#commentList').innerHTML = makeCommentElements(response.data, 0);
			})
			.catch(error => {
				console.log('댓글 가져오기 중 오류 발생:', error);
			});
	}

	// 모든 댓글 그리기 함수
	function makeCommentElements(data, level) {
		return data.map(cmm => {
			// 타임스탬프를 Date 객체로 변환
			const modifiedTime = new Date(cmm.modifiedTime);

			// 연도별 시분초 포맷팅 (24시간 형식)
			const formattedHours = modifiedTime.getHours().toString().padStart(2, '0');
			const formattedMinutes = modifiedTime.getMinutes().toString().padStart(2, '0');
			const formattedSeconds = modifiedTime.getSeconds().toString().padStart(2, '0');
			const formattedTime = `${modifiedTime.getFullYear()}-${modifiedTime.getMonth() + 1}-${modifiedTime.getDate()} ${formattedHours}:${formattedMinutes}:${formattedSeconds}`;

			// 수정, 삭제 아이콘
			//const pencilPath = "M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325";
			//const trashPath = "M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5";

			// 대댓글 아이콘
			const replyIcon = level > 0 ? '<svg class="reply-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M3 12H21M3 12L8 7M3 12L8 17" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>' : '';

			return `
				<div class="mt-2" style="display: flex; align-items: flex-start; margin-left: ${level * 50}px;">
					<img src="../../images/defaultprofile5.png" alt="프로필 이미지" class="p-profile-image" id="p-profile-image" style="margin-right: 10px; margin-left: 50px;">
					<div style="flex: 1;">
						<div style="display: flex; align-items: center; margin-bottom: 5px;">
							<span style="font-weight: bold; margin-right: 10px;">${cmm.nickname}</span>
							<label for="modifiedTime" class="form-time" style="font-size: 0.8em; color: #888;">
								${formattedTime}
							</label>
						</div>
						<div class="custom-label" style="max-height: 100px; overflow-y: auto; padding: 5px; margin-bottom: 5px; display: flex; align-items: center; justify-content: space-between; border: none;"> <!-- 테두리 제거 -->
							<span id="comment-content-${cmm.commentsId}">${cmm.content}</span>
							
							</div>
						</div>
					</div>
				</div>
				<div id="replyContent${cmm.commentsId}" class="replyCommentGroup" style="display: none; align-items: flex-start; margin-left: ${level * 50}px;">
					<textarea id="comment${cmm.commentsId}" class="form-control mt-2" rows="3" style="max-height: 100px; overflow-y: auto; flex: 1; margin: 10px 20px;"></textarea>
					<button onClick="addReply(${cmm.commentsId})" type="button" class="btn btn-dark mt-3 add-reply-btn" data-comments-id="${cmm.commentsId}" style="font-size: 0.8em; margin-left: 20px;">
						댓글 등록
					</button>
				</div>
				${makeCommentElements(cmm.childComment, level + 1)}
			`;
		}).reduce((o1, o2) => o1 + o2, "");
	}

	// 초기화 함수 호출
	getAllComments();
});
