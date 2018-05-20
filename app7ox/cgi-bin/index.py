from bottle import (
    run,
    get,
    template,
)
import config
import step_ai


@get('/')
def index():
    template('index.html')


run(**config.RUN_ARGS)
