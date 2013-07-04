class @CategoryMenu
  constructor: () ->
    $("#categories").hover ( ->
      $(".category-menu").stop(true, true).slideDown('slow') ), -> 
      $(".category-menu").stop(true, true).slideUp()