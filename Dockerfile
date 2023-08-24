# Use the cm2network/steamcmd as the base image
FROM cm2network/steamcmd

RUN apt-get update && \
    apt-get install -y lib32gcc-s1 && \
    apt-get clean

WORKDIR /home/steam

COPY scripts/init.sh /home/steam/init.sh
# Run the script to install. Whenever Valheim is updated, run this script again.
COPY scripts/start_server.sh /home/steam/start_server.sh
RUN chmod +x /home/steam/start_server.sh

# Run this script to start the server
COPY scripts/valheim.sh /home/steam/valheim.sh
RUN chmod +x /home/steam/valheim.sh

# Set the init.sh script as the default command
# Automatically execute this script whenever a container is started based on the image
CMD ["/home/steam/init.sh"]
ENTRYPOINT ["bash"]
