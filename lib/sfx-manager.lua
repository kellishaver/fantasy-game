local sfx_manager = {
  combat_music =  sfx[2],
  scene_music = sfx[1]
}

function sfx_manager.play_scene_music()
    sfx_manager.scene_music = sfx[scene.music]
    love.audio.setVolume(1)
    love.audio.play(sfx_manager.scene_music.source)
end

function sfx_manager.play_combat_music()
  ssrc = sfx_manager.scene_music.source
  ssrc:stop()
  ssrc:setVolume(0)

  love.audio.setVolume(0.5)
  love.audio.play(sfx_manager.combat_music.source)
end

function sfx_manager.stop_combat_music()
  csrc = sfx_manager.combat_music.source
  csrc:stop()
  csrc:setVolume(0)

  ssrc = sfx_manager.scene_music.source
  ssrc:play()
  ssrc:setVolume(1)
end

function sfx_manager.punch()
  src = sfx[3].source
  src:play()
end

function sfx_manager.grunt()
  src = sfx[4].source
  src:play()
end


return sfx_manager