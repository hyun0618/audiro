/**
 * search.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', function() {
    const btnAllTags = document.querySelectorAll('button.badge');
    for (let btnTag of btnAllTags) {
        btnTag.addEventListener('click', clickTag);
    }
    
    const divTagContainer = document.querySelector('div#tagContainer');
    divTagContainer.addEventListener('click', clickTagContainer);
    
    const btnSearch = document.querySelector('button#btnSearch');
    btnSearch.addEventListener('click', clickBtnSearch);
	
	const btnReset = document.querySelector('button#btnReset');
	btnReset.addEventListener('click', clickBtnReset);
    
    let baseUri = `../api/travel/search-tags?`;
    let regionTags = [];
    let themeTags = [];
    let companionTags = [];
    let keyword = '';
    let currentPage = 1;

    const tagCategories = {};
    
    loadInitialData();

    function loadInitialData() {
        const initialUri = baseUri.slice(0, -1);
        sendRequest(initialUri);
    }
	
	function clickBtnReset() {
	    regionTags = [];
	    themeTags = [];
	    companionTags = [];

	    for (let tag in tagCategories) {
	        delete tagCategories[tag];
	    }

	    const btnNewTags = document.querySelectorAll('button.new-badge');
	    btnNewTags.forEach(tag => tag.remove());

	    document.querySelector('input#inputSearch').value = '';

	    currentPage = 1;
	    keyword = '';

	    updateUri();
	}
    
    function clickTag(event) {
        const tag = event.target.textContent.substring(2);
        const category = event.target.parentElement.querySelector('p').textContent;
        let tagList = getTagList(category);

        const btnExist = Array.from(divTagContainer.children)
                              .find(child => child.textContent === event.target.textContent);

        if (btnExist) {
            btnExist.remove();
            tagList.splice(tagList.indexOf(tag), 1);
        } else {
            const html = `<button class="badge text-bg-light new-badge" data-category="${category}">${event.target.textContent}</button>`;
            divTagContainer.innerHTML += html;
            tagList.push(tag);
            tagCategories[tag] = category;
        }
        
        currentPage = 1;
        
        updateUri();
    }

    function clickTagContainer(event) {
        const target = event.target;
        const isBadge = target.classList.contains('new-badge');

        if (isBadge) {
            const tag = target.textContent.substring(2);
            const category = tagCategories[tag];
            let tagList = getTagList(category);

            target.remove();
            tagList.splice(tagList.indexOf(tag), 1);
            delete tagCategories[tag];
        } else {
            return
        }
        
        currentPage = 1;
        
        updateUri();
    }
    
    function getTagList(category) {
        if (category === "지역") {
            return regionTags;
        } else if (category === "테마") {
            return themeTags;
        } else if (category === "동행자") {
            return companionTags;
        }
        return [];
    }

    function updateUri() {
        let uri = baseUri;

        if (regionTags.length > 0) {
            uri += `region=${regionTags.join('&region=')}&`;
        }
        if (themeTags.length > 0) {
            uri += `theme=${themeTags.join('&theme=')}&`;
        }
        if (companionTags.length > 0) {
            uri += `companion=${companionTags.join('&companion=')}&`;
        }
        if (keyword) {
            uri += `keyword=${keyword}&`;
        }
        
        uri += `currentPage=${currentPage}`;
        
        console.log(uri);
        
        sendRequest(uri);
    }
    
    function sendRequest(uri) {
        axios.get(uri)
        .then(response => {
            console.log(response.data);
            const destinations = response.data.destinations;
            const totalPages = response.data.totalPages;
            
            updateDestinations(destinations);
            updatePagination(totalPages);
        })
        .catch(error => {
            console.log(error);
        });
    }
    
    function updateDestinations(destinations) {
        const cardContainer = document.querySelector('#cardContainer .row');
        cardContainer.innerHTML = '';

        destinations.forEach(d => {
            const destinationDetailsPage = `./details?id=${d.travelDestinationId}`;
            const html = `
                <div class="col-4">
					<div class="card">
	                    <a href="${destinationDetailsPage}">
	                        <img src="${d.imgUrl}" class="img-destination" alt="${d.name}" />
	                    </a>
	                    <div class="title-container">
	                        <span>${d.name}</span>
	                        <img src="../images/like_black.png" class="img-like" alt="like" data-id="${d.travelDestinationId}" />
	                    </div>
					</div>
                </div>
            `;
            cardContainer.innerHTML += html;
        });
        
        if (signedInUser !== null && signedInUser !== '') {
            updateFavoriteStates(destinations);
        }
        
        const imgAllLikes = document.querySelectorAll('img.img-like');
        for (let imgLike of imgAllLikes) {
            imgLike.addEventListener('click', clickLike);
        }
    }
    
    function clickBtnSearch() {
        keyword = document.querySelector('input#inputSearch').value;
        
        currentPage = 1;
        
        updateUri();
    }
    
    function updatePagination(totalPages) {
        const pagination = document.querySelector('ul#pagination');
        pagination.innerHTML = '';
		
		const maxVisiblePages = 5;
		const startPage = Math.floor((currentPage - 1) / maxVisiblePages) * maxVisiblePages + 1;
		const endPage = Math.min(startPage + maxVisiblePages - 1, totalPages);
    
        const firstPage = `
            <li class="page-item ${currentPage === 1 ? 'disabled' : ''}">
                <a class="page-link" href="#" aria-label="First">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
        `;
        pagination.innerHTML += firstPage;
		
		const prevPageSet = `
			<li class="page-item ${startPage === 1 ? 'disabled' : ''}">
				<a class="page-link" href="#" aria-label="PreviousSet">
					<span aria-hidden="true">&lsaquo;</span>
				</a>
			</li>
		`;
		pagination.innerHTML += prevPageSet;	
					
    
        for (let i = startPage; i <= endPage; i++) {
            const btnPage = `
                <li class="page-item ${currentPage === i ? 'active' : ''}">
                    <a class="page-link" href="#" data-page="${i}">${i}</a>
                </li>
            `;
            pagination.innerHTML += btnPage;
        }
		
		const nextPageSet = `
			<li class="page-item ${endPage >= totalPages ? 'disabled' : ''}">
				<a class="page-link" href="#" aria-label="NextSet">
					<span aria-hidden="true">&rsaquo;</span>
				</a>
			</li>
		`;
		pagination.innerHTML += nextPageSet;
    
        const lastPage = `
            <li class="page-item ${currentPage === totalPages ? 'disabled' : ''}">
                <a class="page-link" href="#" aria-label="Last">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        `;
        pagination.innerHTML += lastPage;
    
        const pageLinks = pagination.querySelectorAll('.page-link');
        pageLinks.forEach(link => {
            link.addEventListener('click', function(event) {
                event.preventDefault();
                const ariaLabel = event.target.getAttribute('aria-label');
                if (ariaLabel === 'First') {
                    currentPage = 1;
                } else if (ariaLabel === 'PreviousSet') {
					currentPage = Math.max(startPage - maxVisiblePages, 1);
				} else if (ariaLabel === 'NextSet') {
					if (endPage < totalPages) {
						currentPage = endPage + 1;
					} else {
						currentPage = totalPages;
					}
				} else if (ariaLabel === 'Last') {
                    currentPage = totalPages;
                } else {
                    const page = parseInt(event.target.dataset.page);
                    if (!isNaN(page)) {
                        currentPage = page;
                    }
                }
                updateUri();
            });
        });
        
        const firstArrow = pagination.querySelector('[aria-label="First"]');
        const lastArrow = pagination.querySelector('[aria-label="Last"]');
		const prevArrow = pagination.querySelector('[aria-label="PreviousSet"]');
		const nextArrow = pagination.querySelector('[aria-label="NextSet"]');
		
        if (currentPage === 1) {
            firstArrow.parentElement.classList.add('disabled');
			prevArrow.parentElement.classList.add('disabled');
        } else {
			firstArrow.parentElement.classList.remove('disabled');
			prevArrow.parentElement.classList.remove('disabled');
		}
		
        if (currentPage === totalPages) {
            lastArrow.parentElement.classList.add('disabled');
			nextArrow.parentElement.classList.add('disabled');
        } else {
			lastArrow.parentElement.classList.remove('disabled');
			nextArrow.parentElement.classList.remove('disabled');
		}
    }
    
    function updateFavoriteStates(destinations) {
        destinations.forEach(d => {
            const travelDestinationId = d.travelDestinationId;
            axios.get(`../favorite/state/topDestination/${travelDestinationId}/${signedInUser}`)
                .then(response => {
                    const isFavorite = response.data !== -1;
                    const imgTag = document.querySelector(`.img-like[data-id="${travelDestinationId}"]`);
                    
                    if (isFavorite) {
                        imgTag.src = `../images/like_red2.png`;
                    } else {
                        imgTag.src = `../images/like_black.png`;
                    }
                })
                .catch(error => {
                    console.log(error);
                });
        });
    }

    function clickLike(event) {
        if (signedInUser === null || signedInUser === '') {
            if (confirm("로그인 하시겠습니까?")) {
                window.location.href = '/audiro/user/signin';
            }
            return;
        }
        
        const clickedImg = event.target;
        const clickedImgSrc = clickedImg.getAttribute('src');
        const clickedImgDestiId = clickedImg.getAttribute('data-id');
        
        const imgLikeBlackSrc = `../images/like_black.png`;
        const imgLikeRedSrc = `../images/like_red2.png`;
        
        if (clickedImgSrc === imgLikeBlackSrc) {
            clickedImg.src = imgLikeRedSrc;
            updateFavoriteState(clickedImgDestiId, 1)
            .then(() => {
                    animateHeart();
            });
        } else {
            clickedImg.src = imgLikeBlackSrc;
            updateFavoriteState(clickedImgDestiId, 0);
        }

    }
    
    function updateFavoriteState(travelDestinationId, isFavorite) {
        return axios.post('../favorite/update/top/destination', {
            travelDestinationId: travelDestinationId,
            signedInUser: signedInUser,
            isFavorite: isFavorite
        })
        .then()
        .catch(error => {
            console.log(error);
        });
    }
    
    function animateHeart() {
        const heartAnimation = document.querySelector('#heart-animation');

        heartAnimation.style.display = 'block';
        heartAnimation.classList.add('play-animation');

        setTimeout(() => {
            heartAnimation.style.display = 'none';
            heartAnimation.classList.remove('play-animation');
        }, 2000);
    }
    
});