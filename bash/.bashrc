gitc() {
    git add -A
    git commit -m "$1"
}

pbenv() {
    poetry publish --username $PYPI_USERNAME --password $PYPI_PASSWORD --build
}


# requirement, pandoc, texlive-latex-recommended and extra
hackmd2pdf() {
    HACKMD_CODE=$1
    DATE=$(date +"%m-%d-%y")
    REMOTE=https://hackmd.io/${HACKMD_CODE}/download
    MDFILE=./${DATE}_${HACKMD_CODE}.md
    OUTFILE=./${DATE}_${HACKMD_CODE}.pdf
    FORMAT=article
    echo downloading from $REMOTE ...
    echo "this will produce two local files"
    echo $MDFILE 
    echo $OUTFILE
    curl -s -L $REMOTE -o $MDFILE
    pandoc $MDFILE -o $OUTFILE \
      --pdf-engine=pdflatex \
      --highlight-style=monochrome \
      -V 'fontsize: 12pt' \
      -V 'papersize: A4' \
      -V 'urlcolor: blue' \
      -V 'date: \today{}' \
      -V 'documentclass:$FORMAT' \
      -V 'geometry:margin=3.8cm'
    echo completed
}

md2pdf() {
    pandoc $1 -o $2 \
    --pdf-engine=pdflatex \
    --highlight-style=monochrome \
    -V 'fontsize: 12pt' \
    -V 'papersize: A4' \
    -V 'urlcolor: blue' \
    -V 'date: \today{}' \
    -V 'documentclass:$FORMAT' \
    -V 'geometry:margin=3.8cm'
}

