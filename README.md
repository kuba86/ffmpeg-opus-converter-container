# ffmpeg-opus-converter-container
Minimal Podman / Docker container with ffmpeg and opus tools for converting mp3 to opus.

The container has the following tools available:

1. ffmpeg
2. opusenc
3. opusdec
4. opusinfo
5. toybox

## Example usage

### Convert mp3 to opus using ffmpeg and opusenc (opus-tools)
Because `opusenc` does not support mp3's as input we first need to convert mp3 to wav using `ffmpeg`, and then we can use `opusenc` to convert the wav to opus. On Linux, we can pipe the output of one program to input of another using `|` (pipe).

For example, let's say we have an hour of radio recorded, and we want to convert it to opus. The file name is `2022-10-06_ekg_tokfm.mp3` and the file is located at `/home/user/radio`. we would then run:

```shell
podman run -ti --rm --volume /home/user/radio:/radio kuba86/ffmpeg-opus-converter:ffmpeg-5.1.1-opus-1.3.1 toybox sh -c "ffmpeg -hide_banner -stats_period 120 -i /radio/2022-10-06_ekg_tokfm.mp3 -f wav - | opusenc --bitrate 16 --speech --comp 10 --framesize 60 --title '2022-10-06 EKG' --artist 'TokFM' --date '2022-10-06' - /radio/2022-10-06_ekg_tokfm.opus"
```

### Checking the cli options for ffmpeg, opusenc, opusdec, opusinfo, and toybox
you can run the following commands to check the help:

```shell
ffmpeg --help
opusenc --help
opusdec --help
opusinfo --help
toybox --help
```
