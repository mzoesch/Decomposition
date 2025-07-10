## Getting up and running

### Docker
Run the `BuildDocker.sh` script or the following command:
```bash
docker build -t dcp . <--build-arg=USE_LOCAL_FILES=true>
```

And then run `RunDocker.sh` or:
```bash
docker run -it -v /path/to/target/codebase:/host dcp
```

### Native
Run the provided `Setup.sh` script or:
```bash
python3 ./Launch.py -Setup
```


## Split

Split a CMake project:
```bash
python3 ./Launch.py \
  -Analyse -CMakeLocation <path_to_cmake> \
  -Split
```

Split a non-CMake project:
```bash
python3 ./Launch.py \
  -Analyse -BuildCommand <build_command> \
  -Split -TargetBuildDir <intermediate_build_dir>
```
