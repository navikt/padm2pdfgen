FROM ghcr.io/navikt/pdfgen:2.0.22

ENV JDK_JAVA_OPTIONS="-Xmx2g -Xms2g -Dlogback.configurationFile=logback-remote.xml"
COPY templates /app/templates
COPY fonts /app/fonts
COPY resources /app/resources
