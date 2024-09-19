/**
 * /post/review/create.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', () => {


	//create.jsp 저장
	const saveBtn = document.querySelector('button#savebtn');
	saveBtn.addEventListener('click', saveBtnListener);

	//cerate.jsp 임시저장
	//const draftBtn = document.querySelector('button#draftbtn');
	//draftBtn.addEventListener('click', draftBtnListener);


	/*
	//좋아요 클릭 이벤트 
	const btnLike = document.querySelectorAll('.like-btn');	
	btnLikes.forEach(btnLike => {
		   btnLike.addEventListener('click', saveLike);
	   });
	*/

	/*
	// 썸네일 선택 버튼 클릭 시 파일 입력 요소 클릭
	const thumbnailButton = document.querySelector('#thumbnailButton');
	const thumbnailInput = document.querySelector('#thumbnailInput');
	thumbnailButton.addEventListener('click', () => {
		thumbnailInput.click();
	});
*/



	/*--------------------------------------------------------------------------------------------------------- */
/*
	// 여행 코스 선택 버튼 클릭 시 모달 표시
		const selectTravelCourseButton = document.querySelector('#selectTravelCourseButton');
	        selectTravelCourseButton.addEventListener('click', () => {
	            $('#selectTravelCourseModal').modal('show');
	        });
	   // 여행 코스 선택 완료 버튼 클릭 시 처리
	   const selectTravelCourseCompleteButton = document.querySelector('#selectTravelCourseCompleteButton');
	   selectTravelCourseCompleteButton.addEventListener('click', () => {
	       // 여행 코스 선택 로직 구현 (임시로 선택 완료 버튼 클릭 시 alert만 띄우도록 예시로 작성)
	       alert('여행 코스를 선택했습니다.');

	       // 여행 코스 내용을 특정 영역에 표시할 부분 추가
	       const selectedCourse = `  		   	
		   <div class="card-body m-5">
		   		<table>
		   			<thead>
		   				<tr>
		   					<th>제목</th>
		   					<th>기간</th>
		   					<th>기간</th>
		   					<th>후기작성여부</th>
		   				</tr>
		   			</thead>
		   			<tbody>
		   				<c:forEach items="${travelPlan}" var="t">
		   					<tr>
		   						<td><c:url var="planDetailsPage"
		   								value="/travel/plan/details">
		   								<c:param name="id" value="${t.travelPlanId}"></c:param>
		   							</c:url> <a href="${planDetailsPage}">${t.title}</a></td>
		   						<c:set var="days" value="${t.duration+1}"></c:set>
		   						<td>${t.duration}박${days}일</td>
		   						<td>${t.startDate}~${t.endDate}</td>
		   						<td><c:choose>
		   								<c:when test="${t.isReviewed==0}">
									   		No
									   	</c:when>
		   								<c:when test="${t.isReviewed==1}">
									   		Yes
									   	</c:when>
		   							</c:choose></td>
		   						<td class="img" plan-id="${t.travelPlanId}"><img
		   							class="deletePlanImg" src="/audiro/images/delete.png" />
		   						</td>
		   					</tr>
		   				</c:forEach>
		   			</tbody>
		   		</table>
		   	</div>	   
		   `; 
		   // 여행 코스 선택 로직 구현 필요
		   document.querySelector('modalBodyContent').innerHTML = selectedCourse;

	       //const travelCourseContent = document.querySelector('#travelCourseContent');
	       //travelCourseContent.textContent = selectedCourse;

	       // 모달 닫기
	       $('#selectTravelCourseModal').modal('hide');
	   });

	   // 모달 닫기 버튼 클릭 시 모달 닫기
	   document.querySelector('.modal-footer .btn-secondary').addEventListener('click', () => {
	       $('#selectTravelCourseModal').modal('hide');
	   });
*/
	   
	   
	   
	   
	   
	   
	// 저장 버튼 클릭 시 실행할 함수
	function saveBtnListener(e) {
		
		e.preventDefault();// 버튼기본동작을 막음.

		const inputTitle = document.querySelector('input#title').value;
		const content = document.querySelector('.c_editor').innerHTML;

		// form 찾음. -> form.action, form.method 설정 -> form.submit()
		const form = document.querySelector('form#createForm')
		// 제목과 내용이 비어있는 지 체크:
		if (inputTitle.value === '' || content.value === '') {
			alert('제목과 내용은 반드시 입력하세요.');
			return;
		}
		document.querySelector("#c_editor").value = content;
		
		form.action = 'create';
		form.method = 'POST';

		form.submit();

	}
	/*
	
	// 임시저장 선택 버튼 클릭 시 모달 표시
		   const selectdraftButton = document.querySelector('#draftbtn');
		   selectdraftButton.addEventListener('click', () => {
		       $('#selectTravelCourseModal').modal('show');
		   });

	// 임시 저장하기
	function draftBtnListener(e) {
		e.preventDefault();// 버튼기본동작을 막음.
		alert('ddddd');
		const form = document.querySelector('form#createForm')

		form.action = 'draft';
		form.method = 'POST';
		form.submit();

		// 임시 저장 완료 알림창 표시
		alert('임시 저장되었습니다.'
			+ '여행 후기 게시글로 이동합니다.');

	}


	// 임시저장 목록에 제목 클릭 이벤트 처리
	const draftLinks = document.querySelectorAll('.draft-link');
	draftLinks.forEach(function(link) {
		link.addEventListener('click', function(event) {
			event.preventDefault(); // 기본 동작(링크 이동) 방지
			const draftPostId = event.target.getAttribute('data-draftPostId'); // 링크에 설정된 데이터 속성에서 draftPostId 값 가져오기
			console.log('draftPostId=' + draftPostId);
			loadDraftContent(draftPostId); // loadDraftContent 함수 호출
		});
	});

	// 클릭한 임시 저장 내용을 불러오는 함수
	function loadDraftContent(draftPostId) {
		// Axios를 사용하여 서버로부터 데이터 가져오기
		const uri = 'http://localhost:8080/audiro/api/review/draftPost?draftPostId=' + draftPostId;
		axios.get(uri)
			.then(response => {
				// 성공적으로 데이터를 받아왔을 때 처리
				const draft = response.data; // response.data에서 draft 객체를 가져옴
				console.log('draft=' + draft.title);
				const inputTitle = document.querySelector('input#title');
				//const summernote = document.querySelector('textarea#summernote');

				inputTitle.value = draft.title; // input의 value 속성을 설정
				$('#summernote').summernote('code', draft.content); // Summernote에 내용 설정

				// 모달 닫기
				$('#selectDraftModal').modal('hide');
			})
			.catch(error => {
				console.error('Error:', error);
			});
	}

	
	
	
	
	
	
	
	
	
	    thumbnailButton.on('click', function() {
	        thumbnailInput.click();
	    });

	    thumbnailInput.on('change', function(event) {
	        const file = event.currentTarget.files[0];
	        const currentThumbnail = thumbnailPreview.attr('src');

	        if (currentThumbnail && currentThumbnail !== '#') {
	            if (!confirm('이미 썸네일 이미지가 등록되어 있습니다. 새로운 썸네일 이미지로 교체하시겠습니까?')) {
	                event.currentTarget.value = '';
	                return;
	            }
	        }

	        if (file) {
	            const reader = new FileReader();
	            reader.onload = function(e) {
	                thumbnailPreview.attr('src', e.target.result).show();
	                thumbnailDeleteButton.show();

	                const img = '<img src="' + e.target.result + '" alt="썸네일 이미지" id="thumbnailImage">';
	                const delta = quill.clipboard.convert(img);
	                quill.setContents(delta, 'silent');
	                c_editor.val(e.target.result); // 썸네일 이미지를 textarea에 저장
	            };
	            reader.readAsDataURL(file);
	        }
	    });

	    thumbnailDeleteButton.on('click', function() {
	        thumbnailInput.val('');
	        thumbnailPreview.attr('src', '#').hide();
	        thumbnailDeleteButton.hide();

	        quill.deleteText(0, quill.getLength(), 'silent');
	        c_editor.val(''); // textarea에서 썸네일 이미지 제거
	    });

	    // 저장 버튼 클릭 시 textarea에 에디터 내용 저장
	    $('#savebtn').on('click', function() {
	        const editorContent = quill.root.innerHTML;
	        c_editor.val(editorContent);
	        $('#createForm').submit();
	    });
	});
	
	
	
	
	
	
	
	
	// 썸네일 이미지 1개만 추가하기
	$('#thumbnailInput').on('change', function(event) {
	    const file = event.currentTarget.files[0];
	    const currentThumbnail = $('#thumbnailPreview').attr('src');

	    // 이미 썸네일 이미지가 등록되어 있을 경우 처리
	    if (currentThumbnail && currentThumbnail !== '#') {
	        if (!confirm('이미 썸네일 이미지가 등록되어 있습니다. 새로운 썸네일 이미지로 교체하시겠습니까?')) {
	            event.currentTarget.value = ''; // 파일 선택 초기화
	            return;
	        }
	    }

	    // FileReader를 이용하여 새로운 썸네일 이미지 추가
	    if (file) {
	        const reader = new FileReader();
	        reader.onload = function(e) {
	            // 기존 썸네일 이미지 삭제
	            const existingThumbnail = $('#thumbnailImage');
	            if (existingThumbnail.length > 0) {
	                existingThumbnail.remove();
	            }

	            // 새로운 썸네일 이미지 추가
	            $('#thumbnailPreview').attr('src', e.target.result).show();
	            $('#thumbnailDeleteButton').show();
	            const img = '<img src="' + e.target.result + '" alt="썸네일 이미지" id="thumbnailImage">';
	            $('#c_editor').editor('pasteHTML', img);
	        };
	        reader.readAsDataURL(file);
	    }
	});

	
	// 썸네일 삭제하기
	$('#thumbnailDeleteButton').on('click', function() {
	    // 썸네일 미리보기 초기화
	    $('#thumbnailPreview').attr('src', '#').hide();
	    // 파일 입력 초기화
	    $('#thumbnailInput').val('');
	    // 삭제 버튼 숨기기
	    $(this).hide();

	    // Summernote 콘텐츠에서 썸네일 이미지 제거
	    const existingThumbnail = $('#thumbnailImage');
	    if (existingThumbnail.length > 0) {
	        existingThumbnail.remove();
	    }
		*/
	});






