import json
import base64
from random import (
    random,
    randint,
)
from urllib.parse import unquote as urldecode
from bottle import (
    post,
    request,
)


FLAG_AI = 1
FLAG_USER = 2
FLAG_EMPTY = 0

WIN_CELL_COUNT = 5


def level_str_to_num(level):
    level = level.lower()
    if level == 'глупый':
        return 0.0
    elif level == 'лёгкий':
        return 0.3
    elif level == 'средний':
        return 0.6
    elif level == 'сложный':
        return 0.8
    elif level == 'умный':
        return 1.0


def get_win(field):
    eq_count = 0
    # по горизонтали
    for row in range(7):
        prev_cell = None
        eq_count = 0
        for col in range(7):
            cur_cell = field[row][col]
            if cur_cell != FLAG_EMPTY:
                if prev_cell == None or prev_cell == cur_cell:
                    eq_count += 1
                    if eq_count == WIN_CELL_COUNT:
                        return 'AI' if cur_cell == FLAG_AI else 'User'
                else:
                    eq_count = 1
                    prev_cell = None
            prev_cell = cur_cell
    # по вертикали
    for col in range(7):
        prev_cell = None
        eq_count = 0
        for row in range(7):
            cur_cell = field[row][col]
            if cur_cell != FLAG_EMPTY:
                if prev_cell == None or prev_cell == cur_cell:
                    eq_count += 1
                    if eq_count == WIN_CELL_COUNT:
                        return 'AI' if cur_cell == FLAG_AI else 'User'
                else:
                    eq_count = 1
                    prev_cell = None
            prev_cell = cur_cell
    # по главной диагонали
    row = 0
    while row < 7:
        r = row
        c = 0
        prev_cell = None
        eq_count = 0
        while r < 7 and c < 7:
            cur_cell = field[r][c]
            if cur_cell != FLAG_EMPTY:
                if prev_cell == None or prev_cell == cur_cell:
                    eq_count += 1
                    if eq_count == WIN_CELL_COUNT:
                        return 'AI' if cur_cell == FLAG_AI else 'User'
                else:
                    eq_count = 1
                    prev_cell = None
            prev_cell = cur_cell
            r += 1
            c += 1
        row += 1
    col = 1
    while col < 7:
        c = col
        r = 0
        prev_cell = None
        eq_count = 0
        while r < 7 and c < 7:
            cur_cell = field[r][c]
            if cur_cell != FLAG_EMPTY:
                if prev_cell == None or prev_cell == cur_cell:
                    eq_count += 1
                    if eq_count == WIN_CELL_COUNT:
                        return 'AI' if cur_cell == FLAG_AI else 'User'
                else:
                    eq_count = 1
                    prev_cell = None
            prev_cell = cur_cell
            r += 1
            c += 1
        col += 1
    # по побочной диагонали
    row = 0
    while row < 7:
        r = row
        c = 0
        prev_cell = None
        eq_count = 0
        while r >= 0 and c < 7:
            cur_cell = field[r][c]
            if cur_cell != FLAG_EMPTY:
                if prev_cell == None or prev_cell == cur_cell:
                    eq_count += 1
                    if eq_count == WIN_CELL_COUNT:
                        return 'AI' if cur_cell == FLAG_AI else 'User'
                else:
                    eq_count = 1
                    prev_cell = None
            prev_cell = cur_cell
            r -= 1
            c += 1
        row += 1
    col = 0
    while col < 7:
        r = 6
        c = col
        prev_cell = None
        eq_count = 0
        while r >= 0 and c < 7:
            cur_cell = field[r][c]
            if cur_cell != FLAG_EMPTY:
                if prev_cell == None or prev_cell == cur_cell:
                    eq_count += 1
                    if eq_count == WIN_CELL_COUNT:
                        return 'AI' if cur_cell == FLAG_AI else 'User'
                else:
                    eq_count = 1
                    prev_cell = None
            prev_cell = cur_cell
            r -= 1
            c += 1
        col += 1
    return ''


def is_empty_cell(x, y, field):
    return field[y][x] == FLAG_EMPTY


def ai_ultasha(field):
    def check_max(y, x, flag):
        nonlocal field
        sum = 0
        i = 1
        while x + i < 7:
            if field[y][x + i] != flag:
                sum += 5 ** i
                break
            else:
                i += 1
        i = 1
        while x - i >= 0:
            if field[y][x - i] != flag:
                sum += 5 ** i
                break
            else:
                i += 1
        i = 1
        while y + i < 7:
            if field[y + i][x] != flag:
                sum += 5 ** i
                break
            else:
                i += 1
        i = 1
        while y - i >= 0:
            if field[y - i][x] != flag:
                sum += 5 ** i
                break
            else:
                i += 1
        i = 1
        while x + i < 7 and y + i < 7:
            if field[y + i][x + i] != flag:
                sum += 5 ** i
                break
            else:
                i += 1
        i = 1
        while x - i >= 0 and y - i >= 0:
            if field[y - i][x - i] != flag:
                sum += 5 ** i
                break
            else:
                i += 1
        i = 1
        while x - i >= 0 and y + i < 7:
            if field[y + i][x - i] != flag:
                sum += 5 ** i
                break
            else:
                i += 1
        i = 1
        while x + i < 7 and y - i >= 0:
            if field[y - i][x + i] != flag:
                sum += 5 ** i
                break
            else:
                i += 1
        return sum

    x = -1,
    y = -1
    if field[3][3] == FLAG_EMPTY:
        return 3, 3
    maxi = -1
    for r in range(7):
        for c in range(7):
            if field[r][c] != FLAG_EMPTY:
                continue
            max = check_max(r, c, FLAG_AI)
            min = check_max(r, c, FLAG_USER)
            if max + min > maxi:
                print(r, c)
                maxi = max + min
                y = r
                x = c
    return x, y

def step(level, field):
    x = -1
    y = -1
    if get_win(field) == 'User':
        return {
            'x': x,
            'y': y,
            'win': 'User',
        }
    if random() * 10 > level * 10:
        while True:
            x = randint(0, 6)
            y = randint(0, 6)
            if is_empty_cell(x, y, field):
                break
    else:
        x, y = ai_ultasha(field)
        if x != -1:
            field[y][x] = FLAG_AI
    return {
        'x': x,
        'y': y,
        'win': get_win(field),
    }


@post('/step_ai')
def step_ai():
    level = level_str_to_num(urldecode(request.POST['level']))
    field = json.loads(request.POST['field'])
    return json.dumps(step(level, field))
