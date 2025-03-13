sub game_defineMediaFunctions(game as object)
    game.musicPlay = function(name as string, loop = false as boolean) as boolean
        path = m.resourcesConfig.music[name].localPath
        if m.filesystem.Exists(path)
            m.audioplayer.stop()
            m.audioplayer.ClearContent()
            m.audioplayer.AddContent({ url: path })
            m.audioplayer.SetLoop(loop)
            m.audioPlayer.play()
            return true
        else
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

	game.playSound = function(sound_name as string, volume = 100 as integer) as boolean
		if m.Sounds.DoesExist(sound_name) then
			m.Sounds[sound_name].trigger(volume, m.current_sound_channel - 1)
			m.current_sound_channel++
			if m.current_sound_channel > m.max_sound_channels
				m.current_sound_channel = 1
			end if
			return true
		else
			print "playSound() - No sound has been loaded under the name: " ; sound_name
			return false
		end if
	end function

    game.setBackgroundColor = sub(color as dynamic)
        m.background_color = color
    end sub
end sub
