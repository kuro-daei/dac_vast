/*  global global_vars */
const Vast = require('vastjs');

document.addEventListener('DOMContentLoaded', () => {
  const player = document.querySelector(global_vars.video_selector);
  const vast = new Vast(player);
  vast.load(global_vars.vast_url).then(() => {
    player.addEventListener('loadeddata', () => {
      player.play();
    });
    player.addEventListener('timeupdate', () => {
      vast.timeupdate(player.currentTime);
    });
    player.src = vast.media('video/mp4');
  });
});
