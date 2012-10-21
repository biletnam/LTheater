sub Main()
  ' create our screen
  screen = CreateObject("roPosterScreen") 

  ' setup a message port so we can receive event information
  port = CreateObject("roMessagePort")
  screen.SetMessagePort(port)

  ' change the screen's message text
  screen.ShowMessage("Welcome to LTheater. Nothing works yet!")
  screen.Show()

  ' start our event loop
  while true
    msg = Wait(0, port) ' wait for an event

    if type(msg) = "roPosterScreenEvent"
      ' we got a poster screen event
      if msg.isScreenClosed()
        ' the user closed the screen
        exit while
      end if
    end if
  end while

  screen.Close()
  ' any time all screens in a channel are closed, the channel will exit
end sub