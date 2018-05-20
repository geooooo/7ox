import json
from bottle import (
    post,
    request,
)


@post('/step_ai')
def step_ai():
    print(request.forms.get('field'))
    print(request.forms.get('get'))
    return json.dumps({
        'x': 0,
        'y': 0,
        'win': '',
    })
