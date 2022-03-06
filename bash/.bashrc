gitc() {
    git add -A
    git commit -m "$1"
}

pbenv() {
    poetry publish --username $PYPI_USERNAME --password $PYPI_PASSWORD --build
}
