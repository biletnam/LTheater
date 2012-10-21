sub main()
    canvas = CreateObject("roImageCanvas")
    canvas.setLayer(0, { color: "#884400" })
    newShapeLocation = { x: 100, y: 200, w: 200, h: 100 }
    canvas.setLayer(10, { color: "#00BB00", targetRect: newShapeLocation })
    newTextAttributes = {
        color: "#0000CC"
        font: "Large"
        Halign: "Hcenter"
        Valign: "Vcenter"
    }
    canvas.setLayer(5, {
        text: "Hello World!",
        textAttrs: newTextAttributes,
        targetRect: {
            x: 200, y: 500, w: 500, h: 100
        }
    })
    canvas.show()
    
    sleep(5000)
end sub