def run_after_autoconf() -> None:
    with open('Makefile', 'r') as f:
        makefile_content = f.read()

    assert 'USE_AMALGAMATION ?= 1' in makefile_content
    makefile_content = makefile_content.replace('USE_AMALGAMATION ?= 1', 'USE_AMALGAMATION ?= 0')

    with open('Makefile', 'w') as f:
        f.write(makefile_content)

    return None


if __name__ == '__main__':
    run_after_autoconf()
