from Repository import *


common_args = ''


#
# LoC as stated from the 'Ownership Guided C to Rust Translation' conference paper.
#
# How to use:
#   mkdir my_eval && cd my_eval && python3 ../Eval/CROWN.py
#
projects: list[Repository] = [

    # Avl: Binary search tree (229 LoC)
    GeneratedCMakeRepository(None, ['avl.c'], name='avl', additional_args=' -ImplMergeStrategy Tarjan'),

    # binn: Binary serialization (4'426 LoC)
    GeneratedCMakeRepository('https://github.com/liteserver/binn', ['src/binn.h', 'src/binn.c'], additional_args=' -ImplMergeStrategy Tarjan'),

    # brotli                https://github.com/google/brotli.git            (537'723 LoC)

    # bst: Binary search tree (154 LoC)
    GeneratedCMakeRepository(None, ['bst.c'], name='bst', additional_args=' -ImplMergeStrategy Tarjan'),

    # buffer: Simpel buffer implementation (1'207 LoC)
    GeneratedCMakeRepository(None, ['buffer.h', 'buffer.c'], name='buffer', additional_args=' -ImplMergeStrategy Tarjan'),

    # Bzip2: Lossless data compression (14'829 LoC)
    CMakeRepository('https://gitlab.com/bzip2/bzip2.git', 'bz2', additional_args=' -ImplMergeStrategy Tarjan'),

    # genann: Neural network library (2'410 LoC)
    GeneratedCMakeRepository('https://github.com/codeplea/genann.git', ['genann.h', 'genann.c'], additional_args=' -ImplMergeStrategy Tarjan', pub_compile_defs=['genann_act=genann_act_sigmoid_cached']),

    # heman: Heightmap utilities (13'762 LoC)
    CMakeRepository('https://github.com/prideout/heman.git', 'heman', additional_args=' -ImplMergeStrategy Tarjan'),

    # Ht: Simple hash table (264 LoC)
    GeneratedCMakeRepository('https://github.com/benhoyt/ht.git', ['ht.h', 'ht.c'], additional_args=' -ImplMergeStrategy Tarjan'),

    # JSON.h: JSON library for C/C++ (3'860 LoC)
    HeaderOnlyRepository('https://github.com/sheredom/json.h.git', 'json.h', additional_args=' -ImplMergeStrategy Tarjan'),

    # libcsv: CSV library (976 LoC)
    GeneratedCMakeRepository('https://github.com/rgamble/libcsv.git', ['csv.h', 'libcsv.c'], additional_args=' -ImplMergeStrategy Tarjan'),

    # libtree: Collection of binary search treas (2'610 LoC)
    GeneratedCMakeRepository('https://github.com/fbuihuu/libtree.git', ['libtree.h', 'avl.c'], name='libtree-avl', additional_args=' -ImplMergeStrategy Tarjan'),
    GeneratedCMakeRepository('https://github.com/fbuihuu/libtree.git', ['libtree.h', 'bst.c'], name='libtree-bst', additional_args=' -ImplMergeStrategy Tarjan'),
    GeneratedCMakeRepository('https://github.com/fbuihuu/libtree.git', ['libtree.h', 'rb.c'], name='libtree-rb', additional_args=' -ImplMergeStrategy Tarjan'),
    GeneratedCMakeRepository('https://github.com/fbuihuu/libtree.git', ['libtree.h', 'splay.c'], name='libtree-splay', additional_args=' -ImplMergeStrategy Tarjan'),

    #
    # CURRENTLY DOES NOT WORK!
    #
    # libzahl: Suckless big integer library (4'655 LoC)
    #
    # 1. Add to Makefile:
    # CC=clang
    # CXX=clang++
    # CFLAGS =-O0 -g -Xclang -load -Xclang /host/Binaries/Clang/libDecomposition.so -Xclang \
    #         -add-plugin -Xclang decomposition -Xclang -plugin-arg-decomposition -Xclang -IrPath=Saved/tar-MyLibrary
    # 2. bash:
    #   python ./Launch.py -DoSplit -RepositoryLocation Eval/libzahl -SplitNonCMakeTarName=MyLibrary -TargetBuildDir ""
    #
    RemoteRepository('https://github.com/maandree/libzahl.git'),

    #
    # CURRENTLY DOES NOT WORK!
    #
    # lil: Little interpreted language (5'670 LoC)
    #
    GeneratedCMakeRepository('https://github.com/wsxiaoys/lil.git', ['lil.h', 'lil.c']),

    #
    # lodepng: PNG encoder and decoder (14'153 LoC).
    #
    # To decompose run:
    # 1. RUN: CROWN.py (or clone remote repository manually.)
    # 2. RENAME: lodepng.cpp to lodepng.c (as stated in the README.md under **Compiling in C**.)
    # 3. Rerun CROWN.py or decompose manually with Launch.py.
    #
    GeneratedCMakeRepository('https://github.com/lvandeve/lodepng.git', ['lodepng.h', 'lodepng.c'], additional_args=' -ImplMergeStrategy Tarjan'),

    # quadtree: Simple quadtree library (1'216 LoC)
    GeneratedCMakeRepository('https://github.com/kutani/quadtree.git', ['aabb.h', 'aabb.c', 'quadtree.h', 'quadtree.c'], additional_args=' -ImplMergeStrategy Tarjan'),

    # rgba: RGBA parsing and formatting (1'855 LoC)
    GeneratedCMakeRepository('https://github.com/clibs/rgba.git', ['src/rgba.h', 'src/rgba.c'], additional_args=' -ImplMergeStrategy Tarjan'),

    #
    # robotfindskitten (1'508 LoC)
    #
    # To decompose run:
    # 1. RUN: CROWN.py (or clone remote repository manually.)
    # 2. RUN: autoreconf -ifv
    # 3. Add to Makefile.in and to src/Makefile.in:
    #       CC=clang
    #       CXX=clang++
    #       CFLAGS =-O0 -g -Xclang -load -Xclang /host/Binaries/Clang/libDecomposition.so -Xclang -add-plugin -Xclang decomposition -Xclang -plugin-arg-decomposition -Xclang -IrPath=Saved/tar-MyLibrary
    # 4. RUN: ./configure
    # 5. Remove in Makefile and src/Makefile (around line 220):
    #       LINE: CC = gcc
    #       LINE: CFLAGS = -g -O2
    # 6. RUN: make
    # 7. RUN: python ./Launch.py -Report -DoSplit -RepositoryLocation Eval/robotfindskitten -SplitNonCMakeTarName=MyLibrary -TargetBuildDir src -ImplMergeStrategy Tarjan
    #
    RemoteRepository('https://github.com/robotfindskitten/robotfindskitten.git', additional_args=' -ImplMergeStrategy Tarjan'),

    # tulipindicators: Technical analysis indicator function library (22'363 LoC)
    GeneratedCMakeRepository('https://github.com/TulipCharts/tulipindicators.git', ['indicators.h', 'candles.h', 'tiamalgamation.c'], additional_args=' -ImplMergeStrategy Tarjan'),

    # urlparser: Header only url parser (1'379 LoC)
    HeaderOnlyRepository(None, 'url.h', name='urlparser', additional_args=' -ImplMergeStrategy Tarjan'),
    ]


if __name__ == '__main__':
    if len(common_args) > 0:
        for p in projects:
            p.additional_args = f'{p.additional_args}{common_args}'
    common_repos_eval(projects)
