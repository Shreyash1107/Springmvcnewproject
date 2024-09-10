function confirmDelete(dept_id) {
    if (confirm("Are you sure you want to delete this department?")) {
        window.location.href = 'delete?dept_id=' + dept_id;
    }
}

function confirmUpdate(dept_id, dept_name) {
    if (confirm("Are you sure you want to update this department?")) {
        window.location.href = 'update?dept_id=' + dept_id + '&dept_name=' + encodeURIComponent(dept_name);
    }
}
