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
