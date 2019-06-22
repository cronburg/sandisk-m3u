# Playlist creator for SanDisk Clip Sport

The script in this repository generates M3U playlists for every directory
containing audio files (mp3, m4a, aac) on an sdcard for playing on a
"SanDisk Clip Sport" mp3 player. First, put all your music files in
separate directories on your sdcard in a top-level directory called
Music. For instance if the sdcard is mounted on `/mnt/music`, put
music files in:

```
/mnt/music/Music/playlist1
/mnt/music/Music/playlist2
...
/mnt/music/Music/playlistN
```

Upon running `./mkplaylists.sh /mnt/music`, the script will create:

```
/mnt/music/Music/playlist1/playlist1.m3u
/mnt/music/Music/playlist2/playlist2.m3u
...
/mnt/music/Music/playlistN/playlistN.m3u
```

## Details

By trial and error, it is known that M3U files on this particular device
must have DOS-based line terminators (carriage return + line feed). Thus
this script uses `dos2unix`. "Corrupt" playlists (with just Unix newlines)
result in playlists that appear empty to the mp3 player interface.

These devices only support playlists of [at most 1000
songs](https://kb.sandisk.com/app/answers/detail/a_id/14337):

```
NOTE: Maximum number of M3U playlists supported is 50 playlists. Maximum number
of files supported per playlist is 1000
```

Other support information can be [found from the manufacturer
here](https://kb.sandisk.com/app/answers/detail/a_id/14334/).

This code is unofficial and provided as-is under the MIT license.

