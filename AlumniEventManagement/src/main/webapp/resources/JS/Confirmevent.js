function confirmDelete(Eid) {
	if (confirm("Are you sure you want to remove this Scheduled Events?")) {
		window.location.href = 'delevent?Eid=' + Eid;
	}
}
function confirmUpdate(Eid, Name, Date, Time) {
	if (confirm("Are you sure you want to update this Event Details?")) {
		window.location.href = 'updateevent?Eid=' + Eid +
			'&Name=' + encodeURIComponent(Name) +
			'&Date=' + encodeURIComponent(Date) +
			'&Time=' + encodeURIComponent(Time);
	}
}