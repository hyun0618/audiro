/**
 * alllist.jsp에 포함
 */

// console.log("포함ok");


// 여행 게시물 탭 최신순 게시물 데이터를 로드하는 함수
function loadPosts2(page) {
    axios.get('../community/allNewList?page=' + page)
        .then(response2 => {
            const posts2 = response2.data.posts2;
            const totalPages2 = response2.data.totalPages2;

            const postTableBody2 = document.getElementById('postTableBody2');
            const pagination2 = document.getElementById('pagination2');

            postTableBody2.innerHTML = '';
            posts2.forEach(post2 => {
                const postDetailsPage2 = `../community/details?postId=${post2.postId}`;
                const row = `
                    <tr class="table-light">
                        <td class="text-center">${post2.postId}</td>
                        <td class="text-center"> 
                            <a href="${postDetailsPage2}">${post2.title}<a>
                        </td>
                        <td class="text-center">${post2.nickname}</td>
                        <td class="text-center">${post2.good}</td>
                        <td class="text-center">${post2.createdTime}</td>
                    </tr>
                `;
                postTableBody2.innerHTML += row;
            });

            const maxPagesToShow = 5;
            const currentPageGroup = Math.floor((page - 1) / maxPagesToShow);
            const startPage = currentPageGroup * maxPagesToShow + 1;
            const endPage = Math.min(startPage + maxPagesToShow - 1, totalPages2);

            pagination2.innerHTML = '';
            if (page > 1) {
                pagination2.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous" data-page="${page - 1}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                `;
            }
            for (let i = startPage; i <= endPage; i++) {
                if (i === page) {
                    pagination2.innerHTML += `<li class="page-item active"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                } else {
                    pagination2.innerHTML += `<li class="page-item"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                }
            }
            if (page < totalPages2) {
                pagination2.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next" data-page="${page + 1}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                `;
            }

            document.querySelectorAll('#pagination2 a.page-link').forEach(a => {
                a.addEventListener('click', loadPage2);
            });
        })
        .catch(error => {
            console.error('Error fetching posts2:', error);
        });
}



// 여행 게시물 탭 인기순 게시물 데이터를 로드하는 함수
function loadPosts5(page) {
    axios.get('../community/allPopularityList?page=' + page)
        .then(response5 => {
            const posts5 = response5.data.posts5;
            const totalPages5 = response5.data.totalPages5;

            const postTableBody5 = document.getElementById('postTableBody2');
            const pagination5 = document.getElementById('pagination2');

            postTableBody5.innerHTML = '';
            posts5.forEach(post5 => {
                const postDetailsPage5 = `../community/details?postId=${post5.postId}`;                 
                const row = `
                    <tr class="table-light">
                        <td class="text-center">${post5.postId}</td>
                        <td class="text-center"> 
                            <a href="${postDetailsPage5}">${post5.title}<a>
                        </td>
                        <td class="text-center">${post5.nickname}</td>
                        <td class="text-center">${post5.good}</td>
                        <td class="text-center">${post5.createdTime}</td>
                    </tr>
                `;
                postTableBody5.innerHTML += row;
            });

            const maxPagesToShow = 5;
            const currentPageGroup = Math.floor((page - 1) / maxPagesToShow);
            const startPage = currentPageGroup * maxPagesToShow + 1;
            const endPage = Math.min(startPage + maxPagesToShow - 1, totalPages5);

            pagination5.innerHTML = '';
            if (page > 1) {
                pagination5.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous" data-page="${page - 1}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                `;
            }
            for (let i = startPage; i <= endPage; i++) {
                if (i === page) {
                    pagination5.innerHTML += `<li class="page-item active"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                } else {
                    pagination5.innerHTML += `<li class="page-item"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                }
            }
            if (page < totalPages5) {
                pagination5.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next" data-page="${page + 1}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                `;
            }

            document.querySelectorAll('#pagination2 a.page-link').forEach(a => {
                a.addEventListener('click', loadPage5);
            });
        })
        .catch(error => {
            console.error('Error fetching posts5:', error);
        });
}



// 페이지네이션 클릭 이벤트 핸들러 - 여행 메이트 탭 - 최신순
function loadPage2(e) {
    e.preventDefault();
    const pageNo = e.target.getAttribute('data-page');
    if (pageNo) {
        loadPosts2(parseInt(pageNo, 10));
    }
}


// 페이지네이션 클릭 이벤트 핸들러 - 여행메이트 탭 - 인기순
function loadPage5(e) {
    e.preventDefault();
    const pageNo = e.target.getAttribute('data-page');
    if (pageNo) {
        loadPosts5(parseInt(pageNo, 10));
    }
}



// 초기 데이터 로드 및 탭 활성화 시 데이터 로드
document.addEventListener('DOMContentLoaded', function() {
    loadPosts2(1);
});



//여행 메이트 - 최신순(라디오 버튼 클릭 시 이벤트 발생 )
document.addEventListener('DOMContentLoaded', () => {
    const recentMateRadioButton = document.getElementById('btnradio2_1');
    recentMateRadioButton.checked = true; //-> 기본으로 활성화 시킴
    // '최신순' 라디오 버튼에 change 이벤트 리스너 추가
    recentMateRadioButton.addEventListener('change', function() {
        if (this.checked) {
            handleMateRecentSort();
        }
    });
});

function handleMateRecentSort() {
    // '최신순' 버튼 클릭 시 수행할 작업을 여기에 작성합니다.
    console.log('여행 메이트 최신순 버튼이 클릭되었습니다.');

    // 예: 최신순으로 정렬하는 함수 호출
    // sortItemsByPopularity();
    loadPosts2(1);
}


//여행메이트 - 인기순(라디오 버튼 클릭 시 이벤트 발생 )
document.addEventListener('DOMContentLoaded', () => {
    // '인기순' 라디오 버튼에 change 이벤트 리스너 추가
    const popularMateRadioButton = document.getElementById('btnradio2_2');
    popularMateRadioButton.addEventListener('change', function() {
        if (this.checked) {
            handleMatePopularSort();
        }
    });
});


function handleMatePopularSort() {
    // '인기순' 버튼 클릭 시 수행할 작업을 여기에 작성합니다.
    console.log('여행 메이트 인기순 버튼이 클릭되었습니다.');

    // 예: 인기순으로 정렬하는 함수 호출
    // sortItemsByPopularity();
    loadPosts5(1);
}