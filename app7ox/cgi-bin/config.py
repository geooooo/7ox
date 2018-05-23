import os
from bottle import (
    TEMPLATE_PATH,
    route,
    static_file,
)


TEMPLATE_PATH.insert(0, f"{os.getcwd()}/views/web/")

RUN_ARGS = {
    'reloader': True,
    'port': 8080,
    'debug': True,
}


@route("/<filename:path>")
def server_static_file(filename):
    return static_file(filename, root=f"{os.getcwd()}/views/web/")
