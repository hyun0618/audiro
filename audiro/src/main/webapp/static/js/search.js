/**
 * 
 */

 
 document.addEventListener('DOMContentLoaded', function() {
    // 검색 버튼 클릭 이벤트 리스너 추가
    document.getElementById('btnSearch').addEventListener('click', function(event) {
        event.preventDefault(); // 폼 제출을 막습니다.

        // 검색어 가져오기
        const query = document.getElementById('inputSearch').value;

        // 검색어가 비어있는지 확인
        if (!query.trim()) {
            alert("검색어를 입력하세요.");
            return;
        }

        // 선택한 카테고리 값 가져오기
        const category1 = document.querySelector('select[name="category1"]').value;
        const category2 = document.querySelector('select[name="category2"]').value;

        // '검색 결과' 탭 활성화
        const searchTabLink = document.querySelector('a[href="#search"]');
        if (searchTabLink) {
            const searchTab = new bootstrap.Tab(searchTabLink);
            searchTab.show();
        }

        // 검색 요청 데이터
        const data = {
            keyword: query,
            category1: category1,
            category2: category2
        };

        console.log('검색 요청 데이터:', data);

        // Axios를 사용하여 검색 요청 보내기
        axios.post('../community/search', data)
            .then(function(response) {
                console.log('검색 응답 데이터:', response.data.searchPostList.title);
                const searchPostList = response.data.searchPostList;
                // 검색 결과를 가져온 후 표시할 HTML 요소 가져오기
                const searchResultsContainer = document.getElementById('search');

                // 기존 검색 결과 초기화
                searchResultsContainer.innerHTML = '';

                // 검색 결과가 없는 경우
                if (searchPostList == null || searchPostList.length === 0) {
                    searchResultsContainer.innerHTML = '<div style="padding: 100px;"><p class="text-center mb-5">검색 결과가 없습니다.</p><div>';
                    return;
                }

                // 검색 결과를 반복하며 HTML 생성
                searchPostList.forEach(searchPostList => {
                    const postDetailsPage = `../community/details?postId=${searchPostList.postId}`;
                    const resultHTML = `
                        <tr class="table-light">
                            <td class="text-center">${searchPostList.postId}</td>
                            <td class="text-center"> 
                                <a href="${postDetailsPage}">${searchPostList.title}</a>
                            </td>
                            <td class="text-center">${searchPostList.nickname}</td>
                            <td class="text-center">${searchPostList.good}</td>
                            <td class="text-center">${searchPostList.createdTime}</td>
                        </tr>
                    `;
                    searchResultsContainer.innerHTML += resultHTML;
                });
            })
            .catch(function(error) {
                console.error('검색 중 오류 발생:', error);
            });
    });
});