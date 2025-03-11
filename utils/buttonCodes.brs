function buttonCodes(buttonName as string, buttonState = "pressed") as integer

    buttons = {
        "back": [0, 100, 1000]
        "up": [2, 102, 1002]
        "down": [3, 103, 1003]
        "left": [4, 104, 1004]
        "right": [5, 105, 1005]
        "ok": [6, 106, 1006]
        "instant_replay": [7, 107, 1007]
        "rewind": [8, 108, 1008]
        "fast_forward": [9, 109, 1009]
        "info": [10, 110, 1010]
        "play": [13, 113, 1013]
    }

    states = {
        "pressed": 0
        "released": 1
        "held": 2
    }

    return buttons[buttonName][states[buttonState]]

end function
