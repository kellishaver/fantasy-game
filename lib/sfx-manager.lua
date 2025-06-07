local sfx_manager = {
  combat_music =  sfx[2],
  scene_music = sfx[1]
}

function sfx_manager.play_scene_music()
    sfx_manager.scene_music = sfx[scene.music]
    love.audio.setVolume(0.3)
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

  sfx_manager.play_scene_music()
end

return sfx_manager