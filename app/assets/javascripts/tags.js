$(function () {
  $(".tag-field").select2({tags:[]}, {
    placeholder: "Select tag",
    allowClear: true,
    minimumInputLength: 1,
  });

  $("#dataset_tags_array").select2({
    tags: $("#dataset_tags_array").data("tags"),
    placeholder: "Select tag",
    allowClear: true,
    minimumInputLength: 1,
  });
})
