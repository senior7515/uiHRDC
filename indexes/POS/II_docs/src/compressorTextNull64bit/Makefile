CPP=g++
CC =g++

LIBCOMPRESSOR = compressorText.a

ifndef CFLAGS     ##possibly already defined by the "main Makefile".
	CFLAGS = -O9  -Wall -DNDEBUG -m64
	##CFLAGS      = -O9 -m32 
	##CFLAGS      = -g -m32 -O0
endif

OBJECTS=compressor.o 
BINS=test


all: ini clean $(OBJECTS) $(BINS) 
	@echo " [MSG] Done building test"
	@ar rc $(LIBCOMPRESSOR) $(OBJECTS)
	@echo " [AR ] Library contains files: " && ar t $(LIBCOMPRESSOR)
	@echo " [EXE] check with: ./test <input file text> <input file docbeginings> <output file>"
	@echo "   valgrind   ./test /sitio/textos/FT91.TXT /sitio/textos/FT91.TXT.DOCBOUNDARIES outfilename.txt"
	@echo "\n"

ini:
	@echo " [LIB] Compiling files to create library $(LIBCOMPRESSOR)"
	@echo " [MSG] Compilation options $(CFLAGS)"
	
%.o: %.c 
	@echo " [C] Compiling $<"
	@$(CPP) $(CFLAGS) -c $< -o $@
	
%.o: %.cpp 
	@echo " [C++] Compiling $<"
	@$(CPP) $(CFLAGS) -c $< -o $@

test: test.o
	@echo " [BLD] Building test Compressor (exe): ./test"
	@$(CPP) $(CFLAGS) -o test test.o $(OBJECTS)


clean:
	@echo " [CLN] Removing test & objects"
	@rm -f $(BINS)  
	@rm -f $(OBJECTS) test.o
	@rm -f $(LIBCOMPRESSOR)

cleanO:
	@echo " [CLN] Removing objects"
	@rm -f $(OBJECTS) 


tar:
	@echo " [PACKAGING] Compressing the source code"
	@tar czvf compressorplain.tar.gz *.cpp *.h Makefile  go*
	

