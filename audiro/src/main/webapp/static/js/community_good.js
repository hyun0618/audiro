/**
 * 커뮤니티/디테일에 포함
 */

 //포함 확인
 console.log('good');
 
 
document.addEventListener('DOMContentLoaded', function() {
    const btnGood = document.getElementById('btngood');
    const postId = btnGood.getAttribute('data-post-id');   // data-post-id 속성값 읽기
    const usersId = btnGood.getAttribute('data-users-id'); // data-users-id 속성값 읽기
    const authorId = btnGood.getAttribute('data-author-id'); // data-author-id 속성값 읽기
    
     // 디버깅 용도로 ID 출력
    console.log('postId:', postId);
    console.log('usersId:', usersId);
    console.log('postUsersId:', authorId);
    
    // 사용자가 로그인하지 않은 경우 처리
    if (!usersId) {
        console.warn('User is not logged in.');
        btnGood.addEventListener('click', function() {
            alert('로그인해야 추천할 수 있습니다.');
        });
        return;
    }

    // 작성자가 본인 글에 추천을 못하도록 설정
    if (usersId == authorId) {
        console.warn('본인 글에는 추천할 수 없습니다.');
        btnGood.addEventListener('click', function() {
            alert('본인 글에는 추천할 수 없습니다.');
        });
        return;
    }


    // 페이지 로드 시 서버에서 좋아요 상태 확인
    axios.get(`/audiro/community/${postId}/liked`, {
        params: {
            usersId: usersId
        }
    })
    .then(response => {
        if (response.data) {
            btnGood.src = "../images/good2.png";
            btnGood.setAttribute('data-has-liked', 'true');
        }
    })
    .catch(error => {
        console.error('Error fetching like status:', error);
    });

    btnGood.addEventListener('click', function() {
        // 좋아요 여부를 확인하는 속성값 읽기
        if (this.getAttribute('data-has-liked') === 'true') {
            alert('이미 추천한 게시글입니다.❌');
            return;
        }

        // 이미지 변경
        this.src = "../images/good2.png";

        // 서버에 좋아요 요청 보내기
        axios.post(`/audiro/community/${postId}/like`, null, {
            params: {
                usersId: usersId
            }
        })
        .then(response => {
            alert('해당 글을 추천했습니다💜');
            this.setAttribute('data-has-liked', 'true');  // 좋아요 성공 시 속성 설정
            location.reload();
        })
        .catch(error => {
            alert('You can only like a post once.');
            // 오류 발생 시 원래 이미지로 복원
            this.src = "../images/good1.png";
        });
    });
});