### Build and Run LLVM-Pass

Compile with: <br />
```bash mkdir build && cd build && cmake .. -G Ninja && ninja && cd .. ``` 

Run with: <br />
```bash opt -load-pass-plugin Binaries/DecompositionPass.so -passes=decomposition-plugin <input_file> -disable-output -o <output_file> ```


### Build an example

Compile with: <br />
```bash mkdir build && cd build && cmake .. -G Ninja -DLLVM_MODE=LL && ninja && cd .. ```

The .ll and .bc files are under: <br />
`build/CMakeFiles/PROJECT_NAME.dir/TRANSLATION_UNIT_NAME.c.o`
