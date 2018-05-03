FROM python:2.7-stretch
ENV TERM=linux DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y apt-utils
RUN apt-get install -y swig libasound2-dev portaudio19-dev libfann-dev sudo

# Configure audio.
COPY asound.conf /etc/asound.conf



# Add audio tools for debugging.
RUN sed -i 's/stretch main/stretch main contrib non-free/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y vim libttspico-utils pulseaudio
RUN pulseaudio --system -D



# Add a Mycroft user with sudo permissions.
RUN groupadd mycroft
RUN useradd --create-home -d /home/mycroft --shell /bin/false -g mycroft -G audio mycroft
RUN echo 'mycroft ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Mycroft needs a correctly configured locale.
ENV LANG "en_US.UTF-8"
ENV LANGUAGE "en_US.UTF-8"
ENV LC_ALL "en_US.UTF-8"
RUN echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
RUN apt-get purge locales && apt-get install -y locales && dpkg-reconfigure locales

# Install Mycroft.
# @todo The DeepSpeech code is, at the time of writing, available on dev, but not yet on master.
RUN git clone --branch release/v18.2.5 --depth 1 https://github.com/MycroftAI/mycroft-core.git /opt/mycroft
RUN chown mycroft:mycroft -R /opt/mycroft
USER mycroft
WORKDIR /opt/mycroft
# start-mycroft.sh creates this directory too, but then it's owned by root:root, for some reason.
RUN mkdir /opt/mycroft/skills

RUN ./dev_setup.sh

# Add local Mycroft configuration.
# @todo Move this up once we're done with it, as it will change less often than Mycroft itself.
USER root
COPY mycroft.conf /etc/mycroft/mycroft.conf
RUN chown mycroft:mycroft -R /etc/mycroft
USER mycroft

# Start Mycroft.
RUN ./start-mycroft.sh all

CMD tail -f /dev/null
#ENTRYPOINT ["tail", "-f", "/opt/mycroft/scripts/logs/mycroft-skills.log"]

EXPOSE 8181
