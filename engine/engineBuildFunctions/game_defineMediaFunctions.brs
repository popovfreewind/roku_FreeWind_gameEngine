sub game_defineMediaFunctions(game as object)
    game.musicPlay = function(path as string, loop = false as boolean, startPosition = invalid as dynamic) as boolean
        if m.filesystem.Exists(path)
            m.audioplayer.stop()
            m.audioplayer.ClearContent()
            song = {}
            song.url = path
            m.audioplayer.AddContent(song)
            m.audioplayer.SetLoop(loop)
            if startPosition <> invalid
                m.audioplayer.Seek(startPosition)
            end if
            m.audioPlayer.play()
            return true
        else
            print "musicPlay() - No file exists at path: " ; path
            return false
        end if
    end function

    game.musicStop = sub()
        m.audioplayer.stop()
    end sub

    game.musicPause = sub()
        m.audioplayer.pause()
    end sub

    game.musicResume = sub()
        m.audioplayer.resume()
    end sub

    game.playSound = function(name as string, volume = 100 as integer) as boolean
        if m.Sounds.DoesExist(name)
            m.Sounds[name].trigger(volume, m.current_sound_channel - 1)
            m.current_sound_channel++
            if m.current_sound_channel > m.max_sound_channels
                m.current_sound_channel = 1
            end if
            return true
        else
            print "playSound() - No sound has been loaded under the name: " ; name
            return false
        end if
    end function

    game.setBackgroundColor = sub(color as dynamic)
        m.background_color = color
    end sub
end sub
