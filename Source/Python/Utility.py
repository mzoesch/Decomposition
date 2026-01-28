def starts_content_with_qualified_type(c: str, ty: str) -> bool:
    if c.startswith(ty):
        return True

    primitives = [' ', '\t', '\n']

    c_idx = 0
    ty_idx = 0
    while ...:
        if len(ty) <= ty_idx:
            return True
        if len(c) <= c_idx:
            return False

        if ty[ty_idx] in primitives:
            ty_idx += 1
            continue

        if c[c_idx] in primitives:
            c_idx += 1
            continue

        if ty[ty_idx] != c[c_idx]:
            return False

        ty_idx += 1
        c_idx += 1

        continue

    return True
