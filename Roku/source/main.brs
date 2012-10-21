' This function is the core/main that creates the screen
Function Main() as void
    m.menuFunctions = [
        CreateMenu,
    ]
    screen = CreateObject("roListScreen")
    port = CreateObject("roMessagePort")
    screen.SetMessagePort(port)
    InitTheme()
    screen.SetHeader("Welcome to LTheater")
    contentList = InitContentList()
    screen.SetContent(contentList)
    screen.show()
    while (true)
        msg = wait(0, port)
        if (type(msg) = "roListScreenEvent")
            if (msg.isListItemSelected())
                m.menuFunctions[msg.GetIndex()]()
            endif      
        endif
    end while
End Function

' This function creates the inital options, recent, browse and search
Function InitContentList() as object
    contentList = [
        {
            Title: "Latest",
            ID: "1",
            SDSmallIconUrl: "pkg:/images/latest_small.png",
            HDSmallIconUrl: "pkg:/images/breakfast_small.png",
            HDBackgroundImageUrl: "pkg:/images/latest_large.png",
            SDBackgroundImageUrl: "pkg:/images/latest_large.png",            
            ShortDescriptionLine1: "Most Recent Uploads",
            ShortDescriptionLine2: "Select from the latest selection of movies"
        },
        {
            Title: "Browse",
            ID: "2",
            SDSmallIconUrl: "pkg:/images/browse_small.png",
            HDSmallIconUrl: "pkg:/images/browse_small.png",
            HDBackgroundImageUrl: "pkg:/images/browse_large.png",
            SDBackgroundImageUrl: "pkg:/images/browse_large.png",            
            ShortDescriptionLine1: "Everything",
            ShortDescriptionLine2: "Browse the full list of movies"            
        },
        {
            Title: "Search",
            ID: "3",
            SDSmallIconUrl: "pkg:/images/search_small.png",
            HDSmallIconUrl: "pkg:/images/search_small.png",
            HDBackgroundImageUrl: "pkg:/images/search_large.png",
            SDBackgroundImageUrl: "pkg:/images/search_large.png",            
            ShortDescriptionLine1: "Search",
            ShortDescriptionLine2: "Keyword search the movie database"            
        }
    ]
    return contentList
End Function


' This function defines the look/feel of the main screen
Function InitTheme() as void
    app = CreateObject("roAppManager")
    
    listItemHighlight           = "'FFFFFF"
    listItemText                = "'707070"
    brandingGreen               = "'37491D"
    backgroundColor             = "'e0e0e0"
    theme = {
        BackgroundColor: backgroundColor
        OverhangSliceHD: "pkg:/images/Overhang_Slice_HD.png"
        OverhangSliceSD: "pkg:/images/Overhang_Slice_HD.png"
        OverhangLogoHD: "pkg:/images/channel_logo.png"
        OverhangLogoSD: "pkg:/images/channel_logo.png"
        OverhangOffsetSD_X: "25"
        OverhangOffsetSD_Y: "15"
        OverhangOffsetHD_X: "25"
        OverhangOffsetHD_Y: "15"
        BreadcrumbTextLeft: brandingGreen
        BreadcrumbTextRight: "'E1DFE0"
        BreadcrumbDelimiter: brandingGreen
        
        ListItemText: listItemText
        ListItemHighlightText: listItemHighlight
        ListScreenDescriptionText: listItemText
        ListItemHighlightHD: "pkg:/images/select_bkgnd.png"
        ListItemHighlightSD: "pkg:/images/select_bkgnd.png"
        CounterTextLeft: brandingGreen
        CounterSeparator: brandingGreen
        GridScreenBackgroundColor: backgroundColor
        GridScreenListNameColor: brandingGreen
        GridScreenDescriptionTitleColor: brandingGreen
        GridScreenLogoHD: "pkg://images/channel_logo.png"
        GridScreenLogoSD: "pkg://images/channel_logo.png"
        GridScreenOverhangHeightHD: "138"
        GridScreenOverhangHeightSD: "138"
        GridScreenOverhangSliceHD: "pkg:/images/Overhang_Slice_HD.png"
        GridScreenOverhangSliceSD: "pkg:/images/Overhang_Slice_HD.png"
        GridScreenLogoOffsetHD_X: "25"
        GridScreenLogoOffsetHD_Y: "15"
        GridScreenLogoOffsetSD_X: "25"
        GridScreenLogoOffsetSD_Y: "15"
    }
    app.SetTheme( theme )
End Function