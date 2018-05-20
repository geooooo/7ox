import os
from bottle import (
    TEMPLATE_PATH,
    route,
    static_file,
)


TEMPLATE_PATH.insert(0, f"{os.getcwd()}/web/")

RUN_ARGS = {
    'debug': True,
    'reloader': True,
    'port': 8080,
}


@route("/<filename:path>")
def server_static_file(filename):
    return static_file(filename, root=f"{os.getcwd()}/web/")
