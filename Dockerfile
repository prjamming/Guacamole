FROM guacamole/guacamole

# Expose Guacamole web interface port (default 8080)
EXPOSE 8080

# Create and initialize PostgreSQL data directory
RUN mkdir -p /var/lib/postgresql/data/pgdata && \
    postgresql-13-initdb -d /var/lib/postgresql/data/pgdata

# Environment variables for Guacamole configuration (replace with your values)
ENV GUACD_PROTOCOL RDP  # Change to VNC if needed
ENV GUACD_HOSTNAME guacd  # Name of your guacd service (if using a separate container)
ENV GUACD_PORT 3389      # Port for RDP (or VNC port if using VNC)
ENV GUACAMOLE_HOME /config  # Persistence location (optional)

# Persist configuration (optional)
VOLUME /config

CMD ["guacd", "-f"]
