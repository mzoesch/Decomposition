# Getting up and running

## With Docker
Run the following command:
```bash
docker build -t dcp . <--build-arg=USE_LOCAL_FILES=true>
docker run -it -v /path/to/target/codebase:/host dcp
```

## On Native
Run:
```bash
python3 ./Launch.py -DoSetup
```


## Split

Split a CMake project:
```bash
python3 ./Launch.py \
  -DoAnalyse -CMakeLocation <path_to_cmake> \
  -DoSplit
```

Split a non-CMake project:
```bash
python3 ./Launch.py \
  -DoAnalyse -BuildCommand <build_command> \
  -DoSplit -TargetBuildDir <intermediate_build_dir>
```
