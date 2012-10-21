' This function show details of each movie gotten fron GetMovieOptions
Function ShowMovieItemDetails(index as integer) as integer
    print "Selected Index: " + Stri(index)
    detailsScreen = CreateObject("roSpringboardScreen")
    port = CreateObject("roMessagePort")
    detailsScreen.SetMessagePort(port)
    detailsScreen.SetDescriptionStyle("generic")
    detailsScreen.SetStaticRatingEnabled(false)
    
    details = {
        HDPosterUrl: m.options[index].HDPosterURL
        SDPosterUrl: m.options[index].SDPosterURL
        Description: m.options[index].ShortDescriptionLine1
        LabelAttrs: ["Price:", "Rating:"]
        LabelVals: [m.options[index].Price, m.options[index].Rating]
    }
    detailsScreen.SetContent(details)
    detailsScreen.AddButton(1, "Place Order")
    detailsScreen.AddButton(2, "Report Movie to System")
    detailsScreen.show()
    
    while (true)
        msg = wait(0, port)
        if type(msg) = "roSpringboardScreenEvent"
            if (msg.isScreenClosed())
                return -1
            else if (msg.isButtonPressed())
                DetailsScreenButtonClicked( msg.GetIndex() )
            endif
        endif
    end while
End Function

' This function is what actually starts playing the movir
' Currently only kinda pretends to work. no functionality
Function DetailsScreenButtonClicked(index as integer) as void
    dialog = CreateObject("roOneLineDialog")
    if (index = 1)
        dialog.SetTitle("Placing Order")
    else if (index = 2)
        dialog.SetTitle("Reporting Movie to System")
    endif
    dialog.ShowBusyAnimation()
    dialog.show()
    
    Sleep(4000)
End Function