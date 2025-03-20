#!/bin/bash

#opt -load-pass-plugin Binaries/DecompositionPass.so -passes='decomposition-plugin-fp' -disable-output Examples/003_Simple/LlvmIr/main.ll
opt -load-pass-plugin Binaries/DecompositionPass.so -passes='decomposition-plugin-sccp' -disable-output Examples/003_Simple/LlvmIr/main.ll
