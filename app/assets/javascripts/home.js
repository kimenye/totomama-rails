$(document).ready(function() {
    $.each($('.rating-readonly'), function(index, rating) {
        var val = $.attr(rating, 'data-rating');
        var type = $.attr(rating, 'data-type');
        var item_id = $.attr(rating, 'data-id');
        var selector = "star" + val + "-" + type + "-" + item_id;
        $("#" + selector).attr('checked', 'checked');
    });

    $('.rating-readonly :radio').attr('disabled', 'disabled');

    $('#moreResults li:nth-child(odd)').addClass('alternate');
});
