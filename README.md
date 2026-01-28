# Getting up and running
- Setup environment with Docker (only run **once**; on the **first launch**):
    ```bash 
    docker build -t dcp .
    ```
- Launch interactive docker console:
    ```bash 
    docker run -it -v .:/host dcp
    ```
- Prepare Clang plugin (only run **once**; on the **first launch**):
  ```bash
  python3 ./Launch.py -DoSetup
  ```
- Decompose:
  - A CMake project:
    ```bash
    python3 ./Launch.py \
      -DoAnalyse -CMakeLocation <path_to_cmake> \
      -DoSplit
    ```
  - A non-CMake project:
    ```bash
    python3 ./Launch.py \
      -DoAnalyse -BuildCommand <build_command> \
      -DoSplit -TargetBuildDir <intermediate_build_dir>
    ```

Examples can be found under `Eval/CROWN.py`.
