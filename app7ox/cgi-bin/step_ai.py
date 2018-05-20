import json
import base64
from urllib.parse import unquote as urldecode
from bottle import (
    post,
    request,
)


@post('/step_ai')
def step_ai():
    level = urldecode(request.POST['level'])
    field = request.POST['field']
    print(field)
    print(level)
    return json.dumps({
        'x': 0,
        'y': 0,
        'win': '',
    })
