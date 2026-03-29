# Onelines para cmd utils varias

## Youtube DL 

### Bajar gif de twitter

`youtube-dl -o - https://twitter.com/iordic/status/1282695733615956000?s=20 | ffmpeg -i - -r 15 -vf scale=512:-1 -f gif thegif.gif`