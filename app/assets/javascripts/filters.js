$(document).ready(function () {
    $("a.filter").bind("ajax:success", function (evt, data, status, xhr) {
        //show the returned data
        $("div#filter_details").html(data);
        //hide the indicator
        $(this).find('.indicator').addClass("hidden");
        //clear active filter
        $('a.filter').removeClass("active");
        //make this the active filter
        $(this).addClass("active");

    }).bind("ajax:error", function (evt, data, status, xhr) {
        $("div#errors").removeClass("hidden");
    });
});

$(document).on('click', 'a.indicator_trigger', function (event) {
    $(this).find('.indicator').removeClass("hidden");
});