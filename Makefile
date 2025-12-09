CXX = /opt/homebrew/opt/llvm/bin/clang++
CXXFLAGS = -std=c++20

all: main.exe

math.pcm: modules/math.cppm
	$(CXX) $(CXXFLAGS) -x c++-module --precompile $< -o build/$@

greet.pcm: modules/greet.cppm
	$(CXX) $(CXXFLAGS) -x c++-module --precompile $< -o build/$@

main.exe: src/main.cpp math.pcm greet.pcm
	$(CXX) $(CXXFLAGS) -fprebuilt-module-path=build -fmodule-file=math=build/math.pcm -fmodule-file=greet=build/greet.pcm src/main.cpp build/math.pcm build/greet.pcm -o build/main.exe

clean:
	rm -f build/*.pcm build/main.exe

.PHONY: all clean