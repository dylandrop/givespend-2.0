class @ItemPopup
    constructor: () ->
    	$(".fancybox").each ->
    		item_id = this.id
    		$(this).fancybox({
	    		href: "items/#{item_id}",
	    		type: 'ajax'
    		})