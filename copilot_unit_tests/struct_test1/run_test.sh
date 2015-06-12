#! /bin/bash

path="copilot_unit_tests/struct_test1"

function clean
{
	rm -rf copilot-c99-codegen
	rm -rf copilot_struct_test1.hi
	rm -rf copilot_struct_test1.o
	rm -rf copilot_struct_test1
	rm -rf struct_test1
}

cd $path
ghc -package-db ~/Copilot/.cabal-sandbox/x86_64-osx-ghc-7.8.3-packages.conf.d/ copilot_struct_test1.hs
./copilot_struct_test1
gcc --pedantic copilot-c99-codegen/copilot.c copilot_struct_test1.c driver.c -o struct_test1
./struct_test1
clean
