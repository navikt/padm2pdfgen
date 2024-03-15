FROM ghcr.io/navikt/pdfgen:2.0.22

ENV JDK_JAVA_OPTIONS="-XX:MaxRAMPercentage=75 -XX:InitialRAMPercentage=75 -Dlogback.configurationFile=logback-remote.xml"
COPY templates /app/templates
COPY fonts /app/fonts
COPY resources /app/resources
