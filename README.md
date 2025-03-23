### Build and Run LLVM-Pass
Compile with:
```bash
mkdir build && cd build && cmake .. -G Ninja && ninja && cd ..
```

Run with:
```bash
opt -load-pass-plugin Binaries/DecompositionPass.so -passes='decomposition-plugin-sccp' -disable-output <input_file> -o <output_file>
opt -load-pass-plugin Binaries/DecompositionPass.so -passes='decomposition-plugin-fp' -disable-output <input_file> -o <output_file>
opt -load-pass-plugin Binaries/DecompositionPass.so -passes='decomposition-plugin-mp' -disable-output <input_file> -o <output_file>
```


### Build an example
Generic build layout:
```bash
mkdir build && cmake -S . -B build -G Ninja -DDECOMPOSITION_PASS_ROOT=<root> && ninja -C build
```

### Build ibpng
`ibpng` does not support Ninja, so `make` has to be used instead. <br />
Generate llvm: <br />
```bash
mkdir build && cmake -S . -B build -DCMAKE_INSTALL_PREFIX=build/ -DPNG_HARDWARE_OPTIMIZATIONS=no -DDECOMPOSITION_PLUGIN_PRESENT=on -DDECOMPOSITION_PASS_ROOT=<root> && make -C build
```

### Extra stuff
Dot files: <br />
```bash 
opt -passes=dot-callgraph -disable-output <input_file> -o <output_file>
dot -Tpng <input_file> -o <output_file>
```
