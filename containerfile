FROM gcr.io/distroless/base

LABEL "org.opencontainers.image.authors"="kuba86@github"
LABEL "org.opencontainers.image.url"="https://github.com/kuba86/ffmpeg-opus-converter-container"
LABEL "org.opencontainers.image.licenses"="Apache-2.0"

COPY files/licenses/* /licenses/
COPY --chmod=755 files/usr/bin/* /usr/bin/
COPY --chmod=755 files/lib64/* /lib64/

CMD ["toybox"]
