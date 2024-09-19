/**
 * community/main.jsp에 포함
 * 1 전체 최신순
 * 2 여행 메이트 최신순
 * 3 자유게시판 최신순
 * 4 전체 인기순
 * 5 여행 메이트 인기순
 * 6 자유 게시판 인기순
 */

// 전체 탭 최신순 게시물 데이터를 로드하는 함수
function loadPosts1(page) {
    axios.get('../community/api/postsAllRecent?page=' + page)
        .then(response => {
            const posts = response.data.posts;
            const totalPages = response.data.totalPages;

            const postTableBody = document.getElementById('postTableBody');
            const pagination = document.getElementById('pagination');

            postTableBody.innerHTML = '';
            posts.forEach(post => {
                const postDetailsPage = `../community/details?postId=${post.postId}`;
                const row = `
                    <tr class="table-light">
                        <td class="text-center">${post.postId}</td>
                        <td class="text-center"> 
                            <a href="${postDetailsPage}">${post.title}<a>
                        </td>
                        <td class="text-center">${post.nickname}</td>
                        <td class="text-center">${post.good}</td>
                        <td class="text-center">${post.createdTime}</td>
                    </tr>
                `;
                postTableBody.innerHTML += row;
            });

            const maxPagesToShow = 5;
            const currentPageGroup = Math.floor((page - 1) / maxPagesToShow);
            const startPage = currentPageGroup * maxPagesToShow + 1;
            const endPage = Math.min(startPage + maxPagesToShow - 1, totalPages);

            pagination.innerHTML = '';
            if (page > 1) {
                pagination.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous" data-page="${page - 1}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                `;
            }
            for (let i = startPage; i <= endPage; i++) {
                if (i === page) {
                    pagination.innerHTML += `<li class="page-item active"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                } else {
                    pagination.innerHTML += `<li class="page-item"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                }
            }
            if (page < totalPages) {
                pagination.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next" data-page="${page + 1}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                `;
            }

            document.querySelectorAll('#pagination a.page-link').forEach(a => {
                a.addEventListener('click', loadPage1);
            });
        })
        .catch(error => {
            console.error('Error fetching posts1:', error);
        });
}

// 여행 게시물 탭 최신순 게시물 데이터를 로드하는 함수
function loadPosts2(page) {
    axios.get('../community/api/postsMateRecent?page=' + page)
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


// 자유 게시물 탭 최신순 게시물 데이터를 로드하는 함수
function loadPosts3(page) {
    axios.get('../community/api/postsFreeRecent?page=' + page)
        .then(response3 => {
            const posts3 = response3.data.posts3;
            const totalPages3 = response3.data.totalPages3;

            const postTableBody3 = document.getElementById('postTableBody3');
            const pagination3 = document.getElementById('pagination3');

            postTableBody3.innerHTML = '';
            posts3.forEach(post3 => {
                const postDetailsPage3 = `../community/details?postId=${post3.postId}`;
                const row = `
                    <tr class="table-light">
                        <td class="text-center">${post3.postId}</td>
                        <td class="text-center"> 
                            <a href="${postDetailsPage3}">${post3.title}<a>
                        </td>
                        <td class="text-center">${post3.nickname}</td>
                        <td class="text-center">${post3.good}</td>
                        <td class="text-center">${post3.createdTime}</td>
                    </tr>
                `;
                postTableBody3.innerHTML += row;
            });

            const maxPagesToShow = 5;
            const currentPageGroup = Math.floor((page - 1) / maxPagesToShow);
            const startPage = currentPageGroup * maxPagesToShow + 1;
            const endPage = Math.min(startPage + maxPagesToShow - 1, totalPages3);

            pagination3.innerHTML = '';
            if (page > 1) {
                pagination3.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous" data-page="${page - 1}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                `;
            }
            for (let i = startPage; i <= endPage; i++) {
                if (i === page) {
                    pagination3.innerHTML += `<li class="page-item active"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                } else {
                    pagination3.innerHTML += `<li class="page-item"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                }
            }
            if (page < totalPages3) {
                pagination3.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next" data-page="${page + 1}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                `;
            }

            document.querySelectorAll('#pagination3 a.page-link').forEach(a => {
                a.addEventListener('click', loadPage3);
            });
        })
        .catch(error => {
            console.error('Error fetching posts3:', error);
        });
}

// 전체 탭 인기순 게시물 데이터를 로드하는 함수
function loadPosts4(page) {
    axios.get('../community/api/postsAllPopularity?page=' + page)
        .then(response4 => {
            const posts4 = response4.data.posts4;
            const totalPages4 = response4.data.totalPages4;

            const postTableBody4 = document.getElementById('postTableBody');
            const pagination4 = document.getElementById('pagination');

            postTableBody4.innerHTML = '';
            posts4.forEach(post4 => {
                const postDetailsPage4 = `../community/details?postId=${post4.postId}`;                
                const row = `
                    <tr class="table-light">
                        <td class="text-center">${post4.postId}</td>
                        <td class="text-center"> 
                            <a href="${postDetailsPage4}">${post4.title}<a>
                        </td>
                        <td class="text-center">${post4.nickname}</td>
                        <td class="text-center">${post4.good}</td>
                        <td class="text-center">${post4.createdTime}</td>
                    </tr>
                `;
                postTableBody4.innerHTML += row;
            });

            const maxPagesToShow = 5;
            const currentPageGroup = Math.floor((page - 1) / maxPagesToShow);
            const startPage = currentPageGroup * maxPagesToShow + 1;
            const endPage = Math.min(startPage + maxPagesToShow - 1, totalPages4);

            pagination4.innerHTML = '';
            if (page > 1) {
                pagination4.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous" data-page="${page - 1}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                `;
            }
            for (let i = startPage; i <= endPage; i++) {
                if (i === page) {
                    pagination4.innerHTML += `<li class="page-item active"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                } else {
                    pagination4.innerHTML += `<li class="page-item"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                }
            }
            if (page < totalPages4) {
                pagination4.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next" data-page="${page + 1}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                `;
            }

            document.querySelectorAll('#pagination a.page-link').forEach(a => {
                a.addEventListener('click', loadPage4);
            });
        })
        .catch(error => {
            console.error('Error fetching posts4:', error);
        });
}


// 여행 게시물 탭 인기순 게시물 데이터를 로드하는 함수
function loadPosts5(page) {
    axios.get('../community/api/postsMatePopularity?page=' + page)
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


// 자유 게시물 탭 인기순 게시물 데이터를 로드하는 함수
function loadPosts6(page) {
    axios.get('../community/api/postsFreePopularity?page=' + page)
        .then(response6 => {
            const posts6 = response6.data.posts6;
            const totalPages6 = response6.data.totalPages6;

            const postTableBody6 = document.getElementById('postTableBody3');
            const pagination6 = document.getElementById('pagination3');

            postTableBody6.innerHTML = '';
            posts6.forEach(post6 => {
                const postDetailsPage6 = `../community/details?postId=${post6.postId}`;
                const row = `
                    <tr class="table-light">
                        <td class="text-center">${post6.postId}</td>
                        <td class="text-center"> 
                            <a href="${postDetailsPage6}">${post6.title}<a>
                        </td>
                        <td class="text-center">${post6.nickname}</td>
                        <td class="text-center">${post6.good}</td>
                        <td class="text-center">${post6.createdTime}</td>
                    </tr>
                `;
                postTableBody6.innerHTML += row;
            });

            const maxPagesToShow = 5;
            const currentPageGroup = Math.floor((page - 1) / maxPagesToShow);
            const startPage = currentPageGroup * maxPagesToShow + 1;
            const endPage = Math.min(startPage + maxPagesToShow - 1, totalPages6);

            pagination6.innerHTML = '';
            if (page > 1) {
                pagination6.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous" data-page="${page - 1}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                `;
            }
            for (let i = startPage; i <= endPage; i++) {
                if (i === page) {
                    pagination6.innerHTML += `<li class="page-item active"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                } else {
                    pagination6.innerHTML += `<li class="page-item"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                }
            }
            if (page < totalPages6) {
                pagination6.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next" data-page="${page + 1}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                `;
            }

            document.querySelectorAll('#pagination3 a.page-link').forEach(a => {
                a.addEventListener('click', loadPage6);
            });
        })
        .catch(error => {
            console.error('Error fetching posts6:', error);
        });
}



// 페이지네이션 클릭 이벤트 핸들러 - 전체 탭 - 최신순
function loadPage1(e) {
    e.preventDefault();
    const pageNo = e.target.getAttribute('data-page');
    if (pageNo) {
        loadPosts1(parseInt(pageNo, 10));
    }
}

// 페이지네이션 클릭 이벤트 핸들러 - 여행 메이트 탭 - 최신순
function loadPage2(e) {
    e.preventDefault();
    const pageNo = e.target.getAttribute('data-page');
    if (pageNo) {
        loadPosts2(parseInt(pageNo, 10));
    }
}

// 페이지네이션 클릭 이벤트 핸들러 - 자유 게시판 탭 - 최신순
function loadPage3(e) {
    e.preventDefault();
    const pageNo = e.target.getAttribute('data-page');
    if (pageNo) {
        loadPosts3(parseInt(pageNo, 10));
    }
}

// 페이지네이션 클릭 이벤트 핸들러 - 전체 탭 - 인기순
function loadPage4(e) {
    e.preventDefault();
    const pageNo = e.target.getAttribute('data-page');
    if (pageNo) {
        loadPosts4(parseInt(pageNo, 10));
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

// 페이지네이션 클릭 이벤트 핸들러 - 자유 게시판 탭 - 인기순
function loadPage6(e) {
    e.preventDefault();
    const pageNo = e.target.getAttribute('data-page');
    if (pageNo) {
        loadPosts6(parseInt(pageNo, 10));
    }
}


// 초기 데이터 로드 및 탭 활성화 시 데이터 로드
document.addEventListener('DOMContentLoaded', function() {
    loadPosts1(1);
});

//여행메이트 탭 활성화시 실행됨
document.querySelector('a[data-bs-toggle="tab"][href="#mate"]').addEventListener('shown.bs.tab', function () {
    const recentMateRadioButton = document.getElementById('btnradio2_1');
    recentMateRadioButton.checked = true; //-> 기본으로 활성화 시킴
    loadPosts2(1);
    
});

//자유게시판 탭 활성화시 실행됨
document.querySelector('a[data-bs-toggle="tab"][href="#free"]').addEventListener('shown.bs.tab', function () {
    const recentFreeRadioButton = document.getElementById('btnradio3_1');
    recentFreeRadioButton.checked = true; //-> 기본으로 활성화 시킴
    loadPosts3(1);
});


//정렬

//전체 - 최신순(라디오 버튼 클릭 시 이벤트 발생 )
document.addEventListener('DOMContentLoaded', () => {
    // '최신순' 라디오 버튼에 change 이벤트 리스너 추가
    const recentAllRadioButton = document.getElementById('btnradio1_1');
    recentAllRadioButton.checked = true; //-> 기본으로 활성화 시킴
    recentAllRadioButton.addEventListener('change', function() {
        if (this.checked) {
            handleRecentSort();
        }
    });
});

function handleRecentSort() {
    // '최신순' 버튼 클릭 시 수행할 작업을 여기에 작성합니다.
    console.log('전체 최신순 버튼이 클릭되었습니다.');

    // 예: 최신순으로 정렬하는 함수 호출
    // sortItemsByPopularity();
    loadPosts1(1);
}

//전체 - 인기순(라디오 버튼 클릭 시 이벤트 발생 )
document.addEventListener('DOMContentLoaded', () => {
    // '인기순' 라디오 버튼에 change 이벤트 리스너 추가
    const popularAllRadioButton = document.getElementById('btnradio1_2');
    popularAllRadioButton.addEventListener('change', function() {
        if (this.checked) {
            handleAllPopularSort();
        }
    });
});

function handleAllPopularSort() {
    // '인기순' 버튼 클릭 시 수행할 작업을 여기에 작성합니다.
    console.log('전체 인기순 버튼이 클릭되었습니다.');

    // 예: 인기순으로 정렬하는 함수 호출
    // sortItemsByPopularity();
    loadPosts4(1);
}



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



//자유 게시판 - 최신순(라디오 버튼 클릭 시 이벤트 발생 )
document.addEventListener('DOMContentLoaded', () => {
    const recentFreeRadioButton = document.getElementById('btnradio3_1');
    recentFreeRadioButton.checked = true; //-> 기본으로 활성화 시킴
    // '최신순' 라디오 버튼에 change 이벤트 리스너 추가
    recentFreeRadioButton.addEventListener('change', function() {
        if (this.checked) {
            handleFreeRecentSort();
        }
    });
});

function handleFreeRecentSort() {
    // '최신순' 버튼 클릭 시 수행할 작업을 여기에 작성합니다.
    console.log('자유 게시판 최신순 버튼이 클릭되었습니다.');

    // 예: 최신순으로 정렬하는 함수 호출
    // sortItemsByPopularity();
    loadPosts3(1);
}


//자유 게시판 - 인기순(라디오 버튼 클릭 시 이벤트 발생 )
document.addEventListener('DOMContentLoaded', () => {
    // '인기순' 라디오 버튼에 change 이벤트 리스너 추가
    const popularFreeRadioButton = document.getElementById('btnradio3_2');
    popularFreeRadioButton.addEventListener('change', function() {
        if (this.checked) {
            handleFreePopularSort();
        }
    });
});

function handleFreePopularSort() {
    // '인기순' 버튼 클릭 시 수행할 작업을 여기에 작성합니다.
    console.log('자유 게시판 인기순 버튼이 클릭되었습니다.');

    // 예: 인기순으로 정렬하는 함수 호출
    // sortItemsByPopularity();
    loadPosts6(1);
}
