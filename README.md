# Getting up and running
- Setup environment with Docker:
    ```bash 
    docker build -t dcp .
    docker run -it -v .:/host dcp
    ```
- Compile (only run once one the first time):
  ```bash
  python3 ./Launch.py -DoSetup
  ```
- Split:
  - CMake projects:
    ```bash
    python3 ./Launch.py \
      -DoAnalyse -CMakeLocation <path_to_cmake> \
      -DoSplit
    ```
  - Non-CMake projects:
    ```bash
    python3 ./Launch.py \
      -DoAnalyse -BuildCommand <build_command> \
      -DoSplit -TargetBuildDir <intermediate_build_dir>
    ```
