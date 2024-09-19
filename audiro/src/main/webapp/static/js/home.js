document.addEventListener('DOMContentLoaded', () => {
    // 롤링 배너 복제본 생성
    let roller = document.querySelector('.rolling-list');
    roller.id = 'roller1'; // 아이디 부여

    let clone = roller.cloneNode(true);
    clone.id = 'roller2';
    document.querySelector('.wrap').appendChild(clone);

    document.querySelector('#roller1').style.left = '0px';
    document.querySelector('#roller2').style.left = document.querySelector('.rolling-list ul').offsetWidth + 'px';

    roller.classList.add('original');
    clone.classList.add('clone');

    

    // 캐러셀 초기화 함수
    function initCarousel(carouselId) {
        var carouselElement = document.querySelector('#destinationCarousel');
        if (carouselElement) {
            new bootstrap.Carousel(carouselElement, {
                interval: 3000 // 슬라이드 전환 시간 (밀리초)
            });
        } else {
            console.error('Element with ID destinationCarousel not found');
        }
        
    initCarousel('destinationCarousel');
    }


     // 로그인 유저의 찜 상태 
    if (signedInUser !== null && signedInUser !== '') {
        const pLikes = document.querySelectorAll('p.like');
        for (const p of pLikes) {
            getFavoriteState(p);
        }
    }

    function getFavoriteState(el) {
        const dataType = el.getAttribute('data-type');
        const dataId = el.getAttribute('data-id');
        console.log('dataType:', dataType, 'dataId:', dataId);
        
        let apiUrl = '';
        if (dataType === 'destination') {
            apiUrl = `/audiro/favorite/state/topDestination/${dataId}/${signedInUser}`;
        } else if (dataType === 'post') {
            apiUrl = `/audiro/favorite/state/topPost/${dataId}/${signedInUser}`;
        }

        if (apiUrl) {
            axios.get(apiUrl)
                .then(response => {
                    console.log(response.data);
                    if (response.data !== -1) {
                        el.innerHTML = '<img src="/audiro/images/like_red2.png" alt="like_red">';
                    } else {
                        el.innerHTML = '<img src="/audiro/images/like_black2.png" alt="like_black">';
                    }
                })
                .catch(error => {
                    console.error('오류가 발생했습니다:', error);
                });
        }
    }
    
    
    // 찜 상태 업데이트 
    function updateFavoriteState(dataType, dataId, isFavorite) {
        console.log(`Updating favorite state: dataType=${dataType}, dataId=${dataId}, isFavorite=${isFavorite}`);
        
        let apiUrl = '';
        let requestData = {};
        
        if (dataType === 'destination') {
            apiUrl = '/audiro/favorite/update/top/destination';
            requestData = { travelDestinationId: dataId, signedInUser: signedInUser, isFavorite: isFavorite };
        } else if (dataType === 'post') {
            apiUrl = '/audiro/favorite/update/top/post';
            requestData = { postId: dataId, signedInUser: signedInUser, isFavorite: isFavorite };
        }

        if (apiUrl) {
            return axios.post(apiUrl, requestData)
            .then(response => {
                console.log('Server response:', response.data);
       
            })
            .catch(error => {
                console.error('오류가 발생했습니다:', error);
            });
        }
    }
    
    // 좋아요 버튼 클릭 이벤트 핸들러
    window.toggleLike = function (element) {
        const imgElement = element.querySelector('img');
        const iconSrc = imgElement.getAttribute('src');
        const redIconSrc = '/audiro/images/like_red2.png';
        const blackIconSrc = '/audiro/images/like_black2.png';
        const dataType = element.getAttribute('data-type');
        const dataId = element.getAttribute('data-id');
        
        if (signedInUser === null || signedInUser === '') {
            if (confirm("로그인하시겠습니까?")) {
                window.location.href = '/audiro/user/signin';
            }
            return;
        }

        if (iconSrc === redIconSrc) {
            imgElement.setAttribute('src', blackIconSrc);
            updateFavoriteState(dataType, dataId, 0)
                    .then(() => {
                    
                    
                });
        } else {
            imgElement.setAttribute('src', redIconSrc);
            animateHeart();
            animateLike();
            updateFavoriteState(dataType, dataId, 1)
                .then(() => {
                 
                });
        }
        
        function animateHeart() {
	        const heartAnimation = document.getElementById('heart-animation');
	
	        heartAnimation.style.display = 'block';
	        heartAnimation.classList.add('play-animation');
	
	        setTimeout(() => {
	            heartAnimation.style.display = 'none';
	            heartAnimation.classList.remove('play-animation');
	        }, 2000);
    		
    		}
    		
    		function animateLike() {
		    imgElement.classList.add('like-animation');
		    imgElement.addEventListener('animationend', function() {
		        imgElement.classList.remove('like-animation');
		    }, { once: true });
		}
    }
    
});
