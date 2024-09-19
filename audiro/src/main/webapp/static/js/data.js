/**
 * 
 */

document.addEventListener('DOMContentLoaded', () => {

	// 맨 처음 db 저장할 때만 사용
	//getDes();
	//getTag();
	
});

// 여행지 데이터 db 저장
function getDes() {
	const url = 'https://opensheet.elk.sh/1tblPrUU-CCwCZWkk8wQcBTGS4isR2QERONOYhpKpLds/sheet';
	axios.get(url)
		.then(response => {
			const data = response.data;
			console.log(data);
			axios.post('/audiro/api/destination/save', data)
				.then((response) => {
					alert('Data saved successfully');
				})
				.catch((error) => {
					console.error('Error saving data', error);
				});
		})
		.catch(error => {
			console.error('Error fetching data', error);
		});

}

// 태그 데이터 db 저장
function getTag() { 
	const url = 'https://opensheet.elk.sh/12WzGX7F-FVhSzqIn7KbHw3eqj3Nb0QC2jHZk8LkALb4/tag';
	axios.get(url)
		.then(response => {
			const data = response.data;
			console.log(data);
			axios.post('/audiro/api/destination/save/tag', data)
				.then((response) => {
					alert('Data saved successfully');
				})
				.catch((error) => {
					console.error('Error saving data', error);
				});
		})
		.catch(error => {
			console.error('Error fetching data', error);
		});

}
