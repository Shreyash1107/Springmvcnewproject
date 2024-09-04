$(document).ready(function () {
    // Number of rows to show per page
    var rowsShown = 10;
    
    // Total number of rows
    var rowsTotal = $('#data tbody tr').length;
    
    // Total number of pages
    var numPages = Math.ceil(rowsTotal / rowsShown);

    // Append pagination buttons
    $('#data').after('<div id="nav" class="pagination-container"></div>');
    for (var i = 0; i < numPages; i++) {
        var pageNum = i + 1;
        $('#nav').append('<button class="btn btn-outline-primary page-button" data-page="' + i + '">' + pageNum + '</button> ');
    }

    // Show the first set of rows
    $('#data tbody tr').hide().slice(0, rowsShown).show();
    $('#nav .page-button:first').addClass('active');

    // Handle page button click
    $('#nav .page-button').click(function () {
        $('#nav .page-button').removeClass('active');
        $(this).addClass('active');
        var currPage = $(this).data('page');
        var startItem = currPage * rowsShown;
        var endItem = startItem + rowsShown;
        $('#data tbody tr').hide().slice(startItem, endItem).show();
    });
});
