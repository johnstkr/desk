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

$(document).on("ajax:success", ".label-form", function (e, data, status, xhr) {
    var id = $(this).data("case");
    update_current_label_list(data, id);
    //since the form can be reused but the names cannot, clear out the fields
    $(this).find("input.form-control").val("")
    //and reset the pulldown too
    $(this).find("select.form-control").prop('selectedIndex', 0);
}).on("ajax:error", function (e, xhr, status, error) {
    $(".label-result").append("<p>ERROR</p>");
});


$(document).on("ajax:success", ".label-add-form", function (e, data, status, xhr) {
    var id = $(this).data("case");
    update_current_label_list(data, id);


}).on("ajax:error", function (e, xhr, status, error) {
    $(".label-result").append("<p>ERROR</p>");
});

$(document).on('click', 'a.indicator_trigger', function (event) {
    $(this).find('.indicator').removeClass("hidden");
});

$(document).on("hidden.bs.modal", "#case-modal", function () {
    $(this).removeData("bs.modal");
});

var update_current_label_list = function (data, id) {
    //add it to the current tags
    $(".current").append(data);
    //add it to the case listing too
    //get the id from data-case
    //append to the row
    $("#case-row-" + id).append(data);
};