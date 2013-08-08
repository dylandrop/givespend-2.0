class @ItemPopup
  constructor: () ->
    $(".fancybox").each ->
      item_id = this.id
      $(this).dblclick ->
    	  $.fancybox
          href: "items/#{item_id}",
          type: 'ajax'
      $('.add-to-cart a').click ->
        $.fancybox.close()