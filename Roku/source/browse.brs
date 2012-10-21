' This function creates the browse movies screen. It shows everything returned in the movies list
' Eventually I would like to add genre to this
Function CreateMenu() as integer
    screen = CreateObject("roPosterScreen")
    port = CreateObject("roMessagePort")
    screen.SetMessagePort(port)

    screen.SetContentList(GetMovieOptions())
    screen.SetFocusedListItem(1)
    screen.show()
    
    while (true)
        msg = wait(0, port)
        if type(msg) = "roPosterScreenEvent"
            if (msg.isScreenClosed())
                return -1
            else if (msg.isListItemSelected())
                ShowMovieItemDetails( msg.GetIndex() )
            endif
        endif
        
    end while
End Function

' This is the function that gets the list of all the movies from the server
' For now it is a static list as the server is not built
Function GetMovieOptions() as object
    m.options = [
        {
            ShortDescriptionLine1: "True Grit"
            Price: "$0.99"
            Rating: "350"
            SDPosterURL: "pkg://images/movies/01_large.png"
            HDPosterURL: "pkg://images/movies/01_large.png"
        }
        {
            ShortDescriptionLine1: "The Borne Identity"
            Price: "$0.99"
            Rating: "350"
            SDPosterURL: "pkg://images/movies/01_large.png"
            HDPosterURL: "pkg://images/movies/01_large.png"
        }
        {
            ShortDescriptionLine1: "A Classic"
            Price: "$0.99"
            Rating: "350"
            SDPosterURL: "pkg://images/movies/01_large.png"
            HDPosterURL: "pkg://images/movies/01_large.png"
        }
    ]
    return m.options
End Function