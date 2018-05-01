FROM jakkn/nwnxee
# Install plugin run dependencies
RUN runDeps="mono-complete" \
    && apt update \
    && apt -y install gnupg2 \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && apt -y install apt-transport-https \
    && echo "deb https://download.mono-project.com/repo/debian stable-stretch main" | tee /etc/apt/sources.list.d/mono-official-stable.list \
    && apt update \
    && apt -y install $runDeps \
    && rm -r /var/cache/apt /var/lib/apt/lists
# Configure MONO
ENV NWNX_MONO_SKIP=n
