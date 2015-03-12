$(function () {
  $(".tag-field").select2({tags:[]}, {
    placeholder: "Select tag",
    allowClear: true,
    minimumInputLength: 1,
  });
})
