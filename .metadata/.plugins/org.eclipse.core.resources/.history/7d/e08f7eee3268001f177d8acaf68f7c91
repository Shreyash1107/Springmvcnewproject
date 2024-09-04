$(document).ready(function () {
    var rowsShown = 5;
    var rowsTotal = $('#batchTable tbody tr').length;
    var numPages = Math.ceil(rowsTotal / rowsShown);

    $('#batchTable').after('<div id="nav" class="pagination-container"></div>');

    for (var i = 0; i < numPages; i++) {
        var pageNum = i + 1;
        $('#nav').append('<button class="btn btn-outline-primary page-button" data-page="' + i + '">' + pageNum + '</button> ');
    }

    $('#batchTable tbody tr').hide();
    $('#batchTable tbody tr').slice(0, rowsShown).show();
    $('#nav .page-button:first').addClass('active');

    $('#nav .page-button').click(function () {
        $('#nav .page-button').removeClass('active');
        $(this).addClass('active');
        var currPage = $(this).data('page');
        var startItem = currPage * rowsShown;
        var endItem = startItem + rowsShown;
        $('#batchTable tbody tr').hide().slice(startItem, endItem).show();
    });
});
