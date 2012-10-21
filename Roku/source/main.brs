sub Main()
    ' create our screen
    screen = CreateObject("roPosterScreen") 
    
    ' setup a message port so we can receive event information
    port = CreateObject("roMessagePort")
    screen.SetMessagePort(port)
    
    ' change the screen's message text
    screen.ShowMessage("Welcome to LTheater. Nothing works yet!")
    screen.Show()

    progress_bar = {TargetRect: {x: 350, y: 500, w: 598, h: 37}, url: "pkg:/images/progress_bar.png"}
    for i=1 to 100
        fillbar = { x: 350, y: 500, w: i, h: 37 }
        screen.setLayer(10, { color: "#00BB00", targetRect: fillbar })
        screen.show()
    end for

    ' start our event loop
    while true
        1
    end while
    
    
    screen.Close()
    ' any time all screens in a channel are closed, the channel will exit
end sub