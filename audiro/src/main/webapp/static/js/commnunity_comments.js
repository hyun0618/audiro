/**
 * /community/details.jsp에 포함
 */

//제대로 포함되었는지 확인
console.log("댓글 자바스크립트 ok");






// *** 페이지네이션을 통한 댓글 목록 로드
function loadComments(page) {
    
    const usersId = document.getElementById('inputLoginUsersId').value; //로그인한 usersid
    const postUsersId = document.getElementById('inputPostUsersId').value; //글작성자의 usersId
    const postId = document.getElementById('inputPostId').value; // *** postId를 가져옴
   // console.log(usersId);
  //  console.log(postUsersId);
  //  console.log(postId);
    axios.get(`../community/api/comments/all/${postId}?page=${page}`) // *** REST API 요청
        .then(response => { // *** 성공 시 데이터 처리
            const commentsList = response.data.commentsList; // *** 댓글 목록 데이터
           // console.log(commentsList);
            const totalCommentsPages = response.data.totalCommentsPages; // *** 전체 댓글 페이지 수

            const commentsListBody = document.getElementById('commentsListBody'); // *** 댓글 목록을 표시할 요소
            const commentsPagination = document.getElementById('commentsPagination'); // *** 페이지네이션을 표시할 요소

            commentsListBody.innerHTML = ''; // *** 댓글 목록 초기화
            
            const row6 = `<div id="secretSentence" class="py-4 my-2" style="background-color: #D8DEE4; margin-left: 1px;">
                            <span id="secretCommentImg"><img class="comment-image ms-3 me-2" style="width: 30px;" src="https://img.icons8.com/?size=100&id=KAiiLqQy1c9d&format=png&color=000000" alt="자물쇠"/></span>
                            <span id="secretSentenceP">비밀 댓글입니다</span>
                          </div>`;



            commentsList.forEach(commentsList => { // *** 댓글 목록을 반복하며 HTML 생성
               // console.log(commentsList.isPrivate);
                //console.log(commentsList.usersId);
                console.log(commentsList.commentsId);
               // let commentsId = commentsList.commentsId;
                if(commentsList.isPrivate === 0 && commentsList.usersId == usersId) {
                     //공개 댓글이고 댓글 작성자인경우
const row = `
    <input id="inputCommentsId-${commentsList.commentsId}" type="text" class="visually-hidden" value="${commentsList.commentsId}"/>
    <input id="inputCommentsIsPrivate-${commentsList.commentsId}" type="text" class="visually-hidden" value="${commentsList.isPrivate}"/>
    <div class="container my-2 py-1">
        <div class="d-flex align-items-start mt-2">
            <div id="divShowCommentProfile-${commentsList.commentsId}" style="margin-right: 10px;">
                <img class="comment-image mt-1" src="../${commentsList.path}" style="width: 50px; height: 50px;" alt="Profile Image">
            </div>
            <div id="divShowcommentData-${commentsList.commentsId}" class="ms-2 me-1" style="width: 77%;">
                <div class="d-flex align-items-center">
                    <img id="commentDecoratingImages-${commentsList.commentsId}" src="https://img.icons8.com/?size=100&id=N14mXNJbgqu4&format=png&color=000000" style="width: 30px;" alt="icon"/>
                    <p id="commentNickname-${commentsList.commentsId}" class="ms-1" style="margin-bottom: 0;">${commentsList.nickname}</p>
                    <p id="commentModifiedTime-${commentsList.commentsId}" class="ms-1" style="font-size: 12px; color: #b6c0c0; margin-bottom: 0;">${commentsList.modifiedTime}</p>
                </div>
                <div>
                    <p class="mt-2 commentContent-${commentsList.commentsId}">${commentsList.content}</p>
                </div>
            </div>
            <div id="divbtnCommentModifyAndDelete-${commentsList.commentsId}" class="ms-auto">
                <button onclick="confirmUpdate(${commentsList.commentsId})" id="btnUpdateComment-${commentsList.commentsId}" type="button" class="btn btn-light btn-sm mt-2">수정</button>
                <button onclick="confirmDelete(${commentsList.commentsId})" id="btnDeleteComment-${commentsList.commentsId}" type="button" class="btn btn-light btn-sm mt-2">삭제</button>
            </div>
        </div>
        <div id="updateShowTextArea-${commentsList.commentsId}"></div> <!-- 수정 폼이 추가될 위치 -->
    </div>
`;
               // console.log(commentsList.usersId);
                commentsListBody.innerHTML += row; // *** 댓글 목록에 추가
                
                } else if(commentsList.isPrivate === 0 && commentsList.usersId != usersId) {
                    //공개댓글이고 댓글 작성자가 아닌경우 수정삭제버튼숨김
                    const row2 = `
                        <input id="inputCommentsId" type="text" class="visually-hidden" value="${commentsList.commentsId}"/>
                        <div class="container my-2 py-1">
                            <div class="d-flex align-items-start mt-2">
                                <div id="divShowCommentProfile" style="margin-right: 10px;">
                                    <img class="comment-image mt-1" src="../${commentsList.path}" style="width: 50px; height: 50px;" alt="Profile Image">
                                </div>
                                <div id="divShowcommentData" class="ms-2">
                                    <div class="d-flex align-items-center">
                                        <img id="commentDecoratingImages" src="https://img.icons8.com/?size=100&id=N14mXNJbgqu4&format=png&color=000000" style="width: 30px;" alt="icon"/>
                                        <p id="commentNickname" class="ms-1" style="margin-bottom: 0;">${commentsList.nickname}</p>
                                        <p id="commentModifiedTime" class="ms-1" style="font-size: 12px; color: #b6c0c0; margin-bottom: 0;">${commentsList.modifiedTime}</p>
                                    </div>
                                    <div>
                                        <p class="mt-2">${commentsList.content}</p>
                                    </div>
                                </div>
                                <div id="divbtnCommentModifyAndDelete" class="ms-auto">
                                    <button  type="button" class="btn btn-light btn-sm" style="display: none;">수정</button>
                                    <button  type="button" class="btn btn-light btn-sm" style="display: none;">삭제</button>
                               </div>
                            </div>
                        </div>
                `;
                commentsListBody.innerHTML += row2; // *** 댓글 목록에 추가    
                }
                
                 else { //비댓 일 경우 postUsersId == usersId
                    if(commentsList.usersId == usersId) {
                      //  console.log(commentsList.usersId);
                         //비댓이고 댓글작성자가 로그인한경우. 
                    const row3 = `
                         <input id="inputCommentsId-${commentsList.commentsId}" type="text" class="visually-hidden" value="${commentsList.commentsId}"/>
                         <input id="inputCommentsIsPrivate-${commentsList.commentsId}" type="text" class="visually-hidden" value="${commentsList.isPrivate}"/>
    <div class="container my-2 py-1" style="background-color: #D8DEE4;">
        <div class="d-flex align-items-start mt-2">
            <div id="divShowCommentProfile-${commentsList.commentsId}" style="margin-right: 10px;">
                <img class="comment-image mt-1" src="../${commentsList.path}" style="width: 50px; height: 50px;" alt="Profile Image">
            </div>
            <div id="divShowcommentData-${commentsList.commentsId}" class="ms-2 me-1" style="width: 77%;">
                <div class="d-flex align-items-center">
                    <img id="commentDecoratingImages-${commentsList.commentsId}" src="https://img.icons8.com/?size=100&id=N14mXNJbgqu4&format=png&color=000000" style="width: 30px;" alt="icon"/>
                    <p id="commentNickname-${commentsList.commentsId}" class="ms-1" style="margin-bottom: 0;">${commentsList.nickname}</p>
                    <p id="commentModifiedTime-${commentsList.commentsId}" class="ms-1" style="font-size: 12px; color: #b6c0c0; margin-bottom: 0;">${commentsList.modifiedTime}</p>
                </div>
                <div class="d-flex align-items-center">
                    <spen class="me-2">🔒</spen>
                    <p class="mt-2 commentContent-${commentsList.commentsId}">${commentsList.content}</p>
                </div>
            </div>
            <div id="divbtnCommentModifyAndDelete-${commentsList.commentsId}" class="ms-auto">
                <button onclick="confirmUpdate(${commentsList.commentsId})" id="btnUpdateComment-${commentsList.commentsId}" type="button" class="btn btn-light btn-sm mt-2">수정</button>
                <button onclick="confirmDelete(${commentsList.commentsId})" id="btnDeleteComment-${commentsList.commentsId}" type="button" class="btn btn-light btn-sm mt-2">삭제</button>
            </div>
        </div>
        <div id="updateShowTextArea-${commentsList.commentsId}"></div> <!-- 수정 폼이 추가될 위치 -->
    </div>
                `;     
                    commentsListBody.innerHTML += row3;
                    
                    } else if(postUsersId == usersId && commentsList.usersId == postUsersId){
                    const row4 = `
<input id="inputCommentsId-${commentsList.commentsId}" type="text" class="visually-hidden" value="${commentsList.commentsId}"/>
<input id="inputCommentsIsPrivate-${commentsList.commentsId}" type="text" class="visually-hidden" value="${commentsList.isPrivate}"/>    
    <div class="container my-2 py-1" style="background-color: #D8DEE4;">
        <div class="d-flex align-items-start mt-2" >
            <div id="divShowCommentProfile-${commentsList.commentsId}" style="margin-right: 10px;">
                <img class="comment-image mt-1" src="../${commentsList.path}" style="width: 50px; height: 50px;" alt="Profile Image">
            </div>
            <div id="divShowcommentData-${commentsList.commentsId}" class="ms-2 me-1" style="width: 77%;">
                <div class="d-flex align-items-center">
                    <img id="commentDecoratingImages-${commentsList.commentsId}" src="https://img.icons8.com/?size=100&id=N14mXNJbgqu4&format=png&color=000000" style="width: 30px;" alt="icon"/>
                    <p id="commentNickname-${commentsList.commentsId}" class="ms-1" style="margin-bottom: 0;">${commentsList.nickname}</p>
                    <p id="commentModifiedTime-${commentsList.commentsId}" class="ms-1" style="font-size: 12px; color: #b6c0c0; margin-bottom: 0;">${commentsList.modifiedTime}</p>
                </div>
                <div>
                    <p class="mt-2 commentContent-${commentsList.commentsId}">🔒 ${commentsList.content}</p>
                </div>
            </div>
            <div id="divbtnCommentModifyAndDelete-${commentsList.commentsId}" class="ms-auto">
                <button onclick="confirmUpdate(${commentsList.commentsId})" id="btnUpdateComment-${commentsList.commentsId}" type="button" class="btn btn-light btn-sm mt-2">수정</button>
                <button onclick="confirmDelete(${commentsList.commentsId})" id="btnDeleteComment-${commentsList.commentsId}" type="button" class="btn btn-light btn-sm mt-2">삭제</button>
            </div>
        </div>
        <div id="updateShowTextArea-${commentsList.commentsId}"></div> <!-- 수정 폼이 추가될 위치 -->
    </div>
                `;     
                    commentsListBody.innerHTML += row4;                        
                    } else if(postUsersId == usersId && commentsList.usersId != postUsersId){
                    const row5 = `
                        <input id="inputCommentsId" type="text" class="visually-hidden" value="${commentsList.commentsId}"/>
                        <div class="container my-2 py-1" style="background-color: #D8DEE4;">
                            <div class="d-flex align-items-start mt-2">
                                <div id="divShowCommentProfile" style="margin-right: 10px;">
                                    <img class="comment-image mt-1" src="../${commentsList.path}" style="width: 50px; height: 50px;" alt="Profile Image">
                                </div>
                                <div id="divShowcommentData" class="ms-2">
                                    <div class="d-flex align-items-center">
                                        <img id="commentDecoratingImages" src="https://img.icons8.com/?size=100&id=N14mXNJbgqu4&format=png&color=000000" style="width: 30px;" alt="icon"/>
                                        <p id="commentNickname" class="ms-1" style="margin-bottom: 0;">${commentsList.nickname}</p>
                                        <p id="commentModifiedTime" class="ms-1" style="font-size: 12px; color: #b6c0c0; margin-bottom: 0;">${commentsList.modifiedTime}</p>
                                    </div>
                                    <div>
                                        <p class="mt-2">🔒 ${commentsList.content}</p>
                                    </div>
                                </div>
                                <div id="divbtnCommentModifyAndDelete" class="ms-auto">
                                    <button type="button" class="btn btn-light btn-sm" style="display: none;">수정</button>
                                    <button type="button" class="btn btn-light btn-sm" style="display: none;">삭제</button>
                               </div>
                            </div>
                        </div>
                `;                         
                   commentsListBody.innerHTML += row5;     
                    } else{
                    commentsListBody.innerHTML += row6;
                        
                    }
                }
            });

            const maxPagesToShow = 5; // *** 최대 표시할 페이지 수
            const currentPageGroup = Math.floor((page - 1) / maxPagesToShow); // *** 현재 페이지 그룹 계산
            const startPage = currentPageGroup * maxPagesToShow + 1; // *** 시작 페이지 계산
            const endPage = Math.min(startPage + maxPagesToShow - 1, totalCommentsPages); // *** 끝 페이지 계산

            commentsPagination.innerHTML = ''; // *** 페이지네이션 초기화
            if (page > 1) {
                commentsPagination.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous" data-page="${page - 1}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                `;
            }
            for (let i = startPage; i <= endPage; i++) {
                if (i === page) {
                    commentsPagination.innerHTML += `<li class="page-item active"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                } else {
                    commentsPagination.innerHTML += `<li class="page-item"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                }
            }
            if (page < totalCommentsPages) {
                commentsPagination.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next" data-page="${page + 1}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                `;
            }

            document.querySelectorAll('#commentsPagination a.page-link').forEach(a => {
                a.addEventListener('click', CommentsloadPage); // *** 페이지네이션 클릭 이벤트 핸들러 등록
            });
        })
        .catch(error => { // *** 오류 처리
            console.error('Error fetching comments:', error);
        });
}

// 페이지네이션 클릭 이벤트 핸들러
function CommentsloadPage(e) {
    e.preventDefault(); // *** 기본 동작 막기
    const pageNo = e.target.getAttribute('data-page'); // *** 페이지 번호 가져오기
    if (pageNo) {
        loadComments(parseInt(pageNo, 10)); // *** 페이지 번호를 정수로 변환하여 로드. 10진수 사용한다는 말 같음
    }
}

// 초기 데이터 로드 및 탭 활성화 시 데이터 로드
document.addEventListener('DOMContentLoaded', function() {
    loadComments(1); // *** 초기 로드 시 첫 페이지 로드
});


//삭제
function confirmDelete(commentId) {
     const commentsId = parseInt(commentId, 10); // 댓글 ID를 int 타입으로 변환
            if (confirm("정말 삭제하시겠습니까?")) {
                // 삭제 작업 수행
            const data = {commentsId: commentsId}
            axios.post(`../community/api/comments/delete/comment`,data)
                    .then(response => {
                            //     console.log(commentsId);
                             alert("삭제되었습니다.");
                             location.reload(); // 새로고침
                    })
                     .catch(error => {
                        console.error('Error:', error);
                        alert('오류가 발생했습니다. 다시 시도해주세요.');
                    });
           
            } 
        }
        
  
  
//수정하기        
        
let updateIsprivate = 0; // 수정 폼의 공개 여부를 나타내는 변수 (0: 공개, 1: 비공개)

function confirmUpdate(commentId) {
    // 댓글 ID를 int 타입으로 변환
    const commentsId = parseInt(commentId, 10);

    // 모든 기존 수정 폼 제거
    document.querySelectorAll('.edit-form').forEach(form => form.remove());

    // 수정할 댓글 요소 가져오기
    const commentContainer = document.querySelector(`input[id="inputCommentsId-${commentsId}"]`).closest('.container');
    const updateShowTextArea = commentContainer.querySelector(`#updateShowTextArea-${commentsId}`);

    // updateShowTextArea가 존재하는지 확인
    if (!updateShowTextArea) {
        console.error('updateShowTextArea 요소를 찾을 수 없습니다.');
        return;
    }

    // 기존 댓글 내용을 가져옴
    const commentContentElement = commentContainer.querySelector(`p.commentContent-${commentsId}`);
    const currentContent = commentContentElement ? commentContentElement.innerText : '';

    // 댓글의 공개/비공개 상태 가져오기
    const isPrivateElement = document.querySelector(`input[id="inputCommentsIsPrivate-${commentsId}"]`);
    const isPrivate = isPrivateElement ? parseInt(isPrivateElement.value, 10) : 0;

    // 수정 폼 HTML 구조
    const editForm = `
        <div class="row edit-form" id="editForm${commentsId}">
            <div class="col-12 ms-2" style="width: 98%;">
                <textarea class="form-control mt-4" id="editTextarea${commentsId}" rows="3" placeholder="착하고 고운 언어를 사용해 주세요 ㅠ_ㅠ">${currentContent}</textarea>
            </div>
        </div>
        <div class="row edit-form" id="editForm${commentsId}Buttons">
            <div class="col-12 button-container">
                <!-- 공개 아이콘 -->
                <img src="https://img.icons8.com/?size=100&id=l0nYZP2WZJqy&format=png&color=000000" id="updateOpenIcon-${commentsId}" class="icon visible" alt="open" onclick="togglePrivacy(${commentsId})" />
                <!-- 비공개 아이콘 -->
                <img src="https://img.icons8.com/?size=100&id=88611&format=png&color=000000" id="updateLockIcon-${commentsId}" class="icon" alt="lock" style="display: none;" onclick="togglePrivacy(${commentsId})" />
                <!-- 수정 완료 버튼 -->
                <button class="btn btn-outline-info mt-3 mb-3 me-2" onclick="saveUpdate(${commentsId})">수정 완료</button>
            </div>
        </div>
    `;

    // 수정 폼 추가 (id="updateShowTextArea" 요소 아래)
    updateShowTextArea.insertAdjacentHTML('beforeend', editForm);

    // 공개/비공개 상태에 따라 아이콘 초기 상태 설정
    const openIcon = document.getElementById(`updateOpenIcon-${commentsId}`);
    const lockIcon = document.getElementById(`updateLockIcon-${commentsId}`);
    const textarea = document.getElementById(`editTextarea${commentsId}`);

    if (isPrivate === 1) {
        openIcon.style.display = 'none'; // 공개 아이콘 숨김
        lockIcon.style.display = 'inline'; // 비공개 아이콘 표시
        textarea.placeholder = "비밀 댓글을 작성하세요.";
        updateIsprivate = 1; // 비공개 상태로 설정
    } else {
        openIcon.style.display = 'inline'; // 공개 아이콘 표시
        lockIcon.style.display = 'none'; // 비공개 아이콘 숨김
        textarea.placeholder = "착하고 고운 언어를 사용해 주세요 ㅠ_ㅠ";
        updateIsprivate = 0; // 공개 상태로 설정
    }
}

function togglePrivacy(commentId) {
    const openIcon = document.getElementById(`updateOpenIcon-${commentId}`);
    const lockIcon = document.getElementById(`updateLockIcon-${commentId}`);
    const textarea = document.getElementById(`editTextarea${commentId}`);

    // 아이콘 상태 전환 및 updateIsprivate 변수 업데이트
    if (openIcon.style.display === 'none') {
        openIcon.style.display = 'inline'; // 공개 아이콘 표시
        lockIcon.style.display = 'none'; // 비공개 아이콘 숨김
        updateIsprivate = 0; // 공개 상태로 설정
        textarea.placeholder = "착하고 고운 언어를 사용해 주세요 ㅠ_ㅠ";
    } else {
        openIcon.style.display = 'none'; // 공개 아이콘 숨김
        lockIcon.style.display = 'inline'; // 비공개 아이콘 표시
        updateIsprivate = 1; // 비공개 상태로 설정
        textarea.placeholder = "비밀 댓글을 작성하세요.";
    }
}


function saveUpdate(commentId) {
    const newContent = document.getElementById(`editTextarea${commentId}`).value;
    
    // 텍스트 영역이 비어있는지 확인
    if (newContent.trim() === '') {
        alert('내용을 입력해주세요.');
        return;
    }

    const data = {
        commentsId: commentId,
        content: newContent,
        isPrivate: updateIsprivate // 댓글 공개 여부 추가
    };

    axios.post(`../community/api/comments/update/comment`, data)
        .then(response => {
            alert("수정되었습니다.");
            location.reload(); // 새로고침
        })
        .catch(error => {
            console.error('Error:', error);
            alert('오류가 발생했습니다. 다시 시도해주세요.');
        });
}



      
                // 수정 작업 수행
        //    const data = {commentsId: commentsId}
       //     axios.post(`../community/api/comments/update/comment`,data)
        //            .then(response => {
                            //     console.log(commentsId);
      //                       alert("수정 되었습니다.");
      //                       location.reload(); // 새로고침
      //              })
     //                .catch(error => {
     //                   console.error('Error:', error);
     //                   alert('오류가 발생했습니다. 다시 시도해주세요.');
    //                });
           
             
  //      }    
           

