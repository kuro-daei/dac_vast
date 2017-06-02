/*  global vastUrl */
const Vast = require('vastjs');

document.addEventListener('DOMContentLoaded', () => {
  const player = document.createElement('video');
  player.width = 775;
  player.height = 436;
  document.body.appendChild(player);
  const vast = new Vast(document.body);
  vast.load(vastUrl).then(() => {
    player.addEventListener('loadeddata', () => {
      player.play();
    });
    player.addEventListener('timeupdate', () => {
      vast.timeupdate(player.currentTime);
    });
    player.src = vast.media('video/mp4');
  });
});
