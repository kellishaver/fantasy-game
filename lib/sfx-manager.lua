local sfx_manager = {
  combat_music =  sfx[2],
  scene_music = sfx[1]
}

function sfx_manager.play_scene_music()
    sfx_manager.scene_music = sfx[scene.music]
    love.audio.play(sfx_manager.scene_music.source)
    love.audio.setVolume(0.5)
end

function sfx_manager.play_combat_music()
  ssrc = sfx_manager.scene_music.source
  ssrc:stop()
  ssrc:setVolume(0)

  love.audio.play(sfx_manager.combat_music.source)
  love.audio.setVolume(0.5)
end

function sfx_manager.stop_combat_music()
  csrc = sfx_manager.combat_music.source
  csrc:stop()
  csrc:setVolume(0)

  ssrc = sfx_manager.scene_music.source
  ssrc:play()
  ssrc:setVolume(0.5)
end

function sfx_manager.pick_up()
  src = sfx[7].source
  src:play()
  ssrc:setVolume(1)
end

function sfx_manager.punch()
  src = sfx[3].source
  src:play()
  ssrc:setVolume(1)
end

function sfx_manager.grunt()
  src = sfx[4].source
  src:play()
  ssrc:setVolume(1)
end

function sfx_manager.success()
  src = sfx[5].source
  src:play()
  ssrc:setVolume(1)
end

function sfx_manager.player_death()
  src = sfx[6].source
  src:play()
  ssrc:setVolume(1)
end


return sfx_manager