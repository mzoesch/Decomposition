### Build and Run LLVM-Passes
Either run the provided `Setup.sh` / `Setup.bat` script or manually set up the environment with cmake:
```bash
mkdir build && cd build && cmake .. && cmake --build . && cd ..
```

Run with:
```bash
python3 ./Launch.py -Split -IR <path_to_linked_llvm_bitcode>
```


### Build an example
Generic build layout:
```bash
mkdir build && cd build && cmake .. -DDECOMPOSITION_PASS_ROOT=<root> && cmake --build . && cd ..
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
