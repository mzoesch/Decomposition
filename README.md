## Getting up and running

### Docker
To build a docker image, run the following command:
```bash
docker build -t dcp . <--build-arg=USE_LOCAL_FILES=true>
```

And then run with:
```bash
docker run -it -v /path/tot/target/codebase:/host dcp
```
Then inside your docker image.

### Native
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
