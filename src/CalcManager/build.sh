# To run this script locally:
# - if cloned from windows, ensure that line endings are `LF`
# - under linux: cd to your_path\calculator\src\CalcManager
# - under WSL: cd `wslpath "your_path\calculator\src\CalcManager"`
# Execute the following:
#   git clone --branch 2.0.23 https://github.com/emscripten-core/emsdk
#   ./emsdk install 2.0.23
#   ./emsdk activate 2.0.23
#   source ./emsdk_env.sh
# Navigate back to this file's folder in the same terminal

mkdir -p bin/wasm

echo Generating LLVM Bitcode files
emcc \
	-std=c++17 \
	-s WASM=1 \
	-s LEGALIZE_JS_FFI=0 \
	-s RESERVED_FUNCTION_POINTERS=64 \
    -s ALLOW_MEMORY_GROWTH=1 \
	-s BINARYEN=1 \
	-s DISABLE_EXCEPTION_CATCHING=0 \
	-o bin/wasm/CalcManager.bc \
	-r \
	CEngine/*.cpp Ratpack/*.cpp *.cpp -I.
