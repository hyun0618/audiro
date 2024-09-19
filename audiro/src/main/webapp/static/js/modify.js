/**
 * /post/review/modify.jsp포함
 */
document.addEventListener('DOMContentLoaded', () => {
	
	//modify 수정완료
	const modifyBtn = document.querySelector('button#modifyBtn');
	modifyBtn.addEventListener('click', modifyBtnListener);
	
	  
	////////////////////////////////////////////////////////////////////////////////

	// 수정완료
	function modifyBtnListener(e) {
		e.preventDefault();
		
		 const form = document.querySelector('form#modifyForm');
		        const inputTitle = form.querySelector('input[name="title"]');
		        const textContent = form.querySelector('textarea[name="content"]');

		        // 제목과 내용이 비어있는지 확인
		        if (inputTitle.value.trim() === '' || textContent.value.trim() === '') {
		            alert('제목과 내용은 반드시 입력하세요.');
		            return;
		        }

		        // 업데이트 내용 저장 확인
		        const result = confirm('변경 내용을 저장할까요?');
		        if (result) {
		            form.action = '/audiro/post/review/update'; // 요청 주소 수정
		            form.method = 'POST'; // 요청 방식 수정
		            form.submit(); // 폼 제출
		        }
		    }
		});


	