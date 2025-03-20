### Build and Run LLVM-Pass

Compile with:
```bash
mkdir build && cd build && cmake .. -G Ninja && ninja && cd ..
```

Run with:
```bash
opt -load-pass-plugin Binaries/DecompositionPass.so -passes='decomposition-plugin-sccp' -disable-output <input_file> -o <output_file>
opt -load-pass-plugin Binaries/DecompositionPass.so -passes='decomposition-plugin-fp' -disable-output <input_file> -o <output_file>
```


### Build an example

Compile with:
```bash
mkdir build && cmake -S . -B build -G Ninja -DLLVM_MODE=LL -DDECOMPOSITION_PASS_ROOT=<root> && ninja -C build
```

The .ll and .bc files are under:
`build/CMakeFiles/PROJECT_NAME.dir/TRANSLATION_UNIT_NAME.c.o`

### Extra stuff

Dot files: <br />
```bash 
opt -passes=dot-callgraph -disable-output <input_file> -o <output_file>
dot -Tpng <input_file> -o <output_file>
```
