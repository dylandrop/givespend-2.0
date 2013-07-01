class @ItemGrid
    constructor: () ->
        shuffle = (a) ->
            for i in [a.length-1..1]
                j = Math.floor Math.random() * (i + 1)
                [a[i], a[j]] = [a[j], a[i]]
            a

        largestZ = ->
            bigZ = 0
            $(".item-card").each ->
                thisZ = parseFloat($(this).css('z-index'))
                bigZ = if thisZ > bigZ then thisZ else bigZ
            bigZ

        coords = shuffle( [ [80,20], [470,350], [425,45], [130,340] ] )

        cards = $(".item-card")
        parent = $("#arranged-list")
        initialY = parent.position().top
        initialX = parent.position().left
        doubles = cards[0..3]
        singles = cards[4..]

        counter = 0
        for e, i in doubles by 2
            [first, second] = doubles[i .. i + 1]
            $(first).css('left', coords[counter][0] + initialX)
            $(first).css('top', coords[counter][1] + initialY)
            $(second).css('left', coords[counter][0] + 20.0 + initialX)
            $(second).css('top', coords[counter][1] + 20.0 + initialY)
            counter++
        for e, i in singles
            $(e).css('left', coords[i + counter][0] + initialX)
            $(e).css('top', coords[i + counter][1] + initialY)

        $(".item-card").each ->
            $(this).draggable
                start: ->
                    $(this).css('z-index', largestZ() + 1)

        $(".item-card").mousedown ->
            $(this).css('z-index', largestZ() + 1)

        thisGrid = @
        $("#sort").click ->
            thisGrid.toGrid()
        $(window).resize ->
            thisGrid.toGrid()

    toGrid: () ->
        $(".item-card").each ->
            $(this).css({'top': 'auto','left': 'auto','position':'relative','z-index': 1}).appendTo('#arranged-list')
