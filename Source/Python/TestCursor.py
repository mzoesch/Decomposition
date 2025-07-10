from Cursor import Cursor

def main_test(*args, **kwargs) -> None:
    with open('TestCursor.txt', 'r') as c_file:
        content_f = c_file.read()

    content = ''
    cursor = Cursor(content_f, 1, 1)

    curly_open: int = 0
    for c, valid in cursor.iter():
        if c is None:
            content = content[:-1]
            continue

        if valid is False:
            content += c
            continue
        curly_open += 1 if c == '{' else 0
        curly_open -= 1 if c == '}' else 0
        content += c
        if curly_open == 0 and c == '}':
            content += ';'
            break
        continue

    with open('TestCursor.out', 'w') as f:
        f.write(content)

    return None


if __name__ == "__main__":
    main_test()
