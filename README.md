[![Build status](https://github.com/navikt/padm2pdfgen/workflows/Deploy%20to%20dev%20and%20prod/badge.svg)](https://github.com/navikt/padm2pdfgen/workflows/Deploy%20to%20dev%20and%20prod/badge.svg)
# padm2pdfgen
Repository for templates for generating PDF's from dialogmeldinger.

## Technologies & Tools

* [pdfgen](https://github.com/navikt/pdfgen)

#### Creating a docker image
Creating a docker image should be as simple as `docker build -t padm2pdfgen .`

## Getting started
### Run in development mode
To run the application with templates, data and fonts locally mounted you can use
```bash
docker run \
        -v /full/path/to/templates:/app/templates \
        -v /full/path/to/fonts:/app/fonts \
        -v /full/path/to/data:/app/data \
        -v /full/path/to/resources:/app/resources \
        -p 8080:8080 \
        -e DISABLE_PDF_GET=false \
        -it \
        --rm \
        navikt/pdfgen
```

Or you can use the convenience script `./run_development.sh`  
For windows, you can use the script `./run_development_windows.sh`

When running the application you can use the env var `DISABLE_PDF_GET` to enable GET requests at
`/api/v1/genpdf/<application>/<template>` which looks for test data at `data/<application>/<template>.json` and outputs
a PDF to your browser. Additionally, the template folder will be fetched on every request, and reflect any changes made
since the last GET, making this ideal for developing new templates for your application.

The template and data directory structure both follow the `<application>/<template>` structure.
Example url: `http://0.0.0.0:8080/api/v1/genpdf/padm2/padm2`

### Notes on developing templates on Windows
It is a known issue that pdfgen's output documents look different depending on whether the template
has `\r\n` or `\n` as line endings. Therefore, it is strongly recommended to configure Git to not convert newlines, as well as ensure that your editor ends its lines with LF (`\n`) and not CRLF (`\r\n`), as the former will accurately show what your
templates will look like in production.

## Contact us
### Code/project related questions can be sent to
* June Henriksen, `june.henriksen2@nav.no`
* Erik Gunnar Jansen, `erik.gunnar.jansen@nav.no`
* Mathias Frits Rørvik, `mathias.rorvik@nav.no`
* John Martin Lindseth, `john.martin.lindseth@nav.no`

### For NAV employees
We are available at the Slack channel #isyfo
