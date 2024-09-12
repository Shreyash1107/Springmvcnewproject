function confirmDelete(aid) {
	if (confirm("Are you sure you want to remove this Alumni?")) {
		window.location.href = 'del?aid=' + aid;
	}
}
/*function confirmUpdate(aid, name, email, contact, age, company, bid, gender, dept_id) {
	if (confirm("Are you sure you want to update this alumni record?")) {
		window.location.href = 'updatealumni?aid=' + aid +
							   '&name=' + name +
							   '&email=' + email +
							   '&Contact=' + contact +
							   '&Age=' + age +
							   '&Company=' + company +
							   '&Bid=' + bid +
							   '&Gender=' + gender +
							   '&dept_id=' + dept_id;
	}
}*/

function confirmUpdate(aid, name, email, Contact, Age, Company, Gender, Bid, dept_id) {
	if (confirm("Are you sure you want to update this alumni record?")) {
		window.location.href = 'updatealumni?aid=' + aid +
			'&name=' + encodeURIComponent(name) +
			'&email=' + encodeURIComponent(email) +
			'&Contact=' + encodeURIComponent(Contact) +
			'&Age=' + Age +
			'&Company=' + encodeURIComponent(Company) +
			'&Gender=' + encodeURIComponent(Gender) +
			'&Bid=' + Bid +
			'&dept_id=' + dept_id;
	}
}

