SRCDIR = ./src
SRCDIRUTILS = utils
SRCDIRLINKER = linker
SRCDIRILISTS = ilists
CC          = g++

export CFLAGS  = -O9  -m64  -Wall   -D_FORTIFY_SOURCE=0 
#CFLAGS     = -O9 -m32
#CFLAGS     = -O9 
#CFLAGS      = -g -O0 -m32

#DEBUGOPT  =-DDEBUG_ON
DEBUGOPT   =-DDEBUG_OFF 

#LIB_IL_INDEX_VBYTE = il_vbyte.a
LIB_IL_INDEX_VBYTE = il_2.0.vbyte_64bit.a

all: exes  cleanO

###  builds the index ---------------------------------------- 
index: ilspire07.o  basics.o  sort_alg.o
	@echo "Compiling sources to create the library $(LIB_IL_INDEX_VBYTE)"
	ar rc $(LIB_IL_INDEX_VBYTE) ilspire07.o  basics.o	sort_alg.o
	rm -f *.o

###  links the index to obtain the exes ----------------------
exes: ilspire07.o  basics.o  
	@echo "Now building myIL && myILSearch testing programs"
	ar rc $(LIB_IL_INDEX_VBYTE) ilspire07.o  basics.o sort_alg.o
	$(CC) $(DEBUGOPT) -o myIL $(SRCDIRLINKER)/build_il.c  $(LIB_IL_INDEX_VBYTE) $(CFLAGS)		
	$(CC) $(DEBUGOPT) -o myILSearch $(SRCDIRLINKER)/search_il.c $(LIB_IL_INDEX_VBYTE)  $(CFLAGS)		
	rm *.o


##  ----------------------------------------------------------

ilspire07.o:  basics.o sort_alg.o
	 $(CC) $(CFLAGS) -c  $(SRCDIR)/ilspire07.c 
	 
ilspire07:  basics.o 
	 $(CC) -DFACADEWITHMAIN $(CFLAGS) $(DEBUGOPT)  basics.o sort_alg.o  -o EXTRACTPOSTINGS $(SRCDIR)/ilspire07.c -lm
searcherFacade:  basics.o  
	 $(CC) -DSEARCHERFACADEWITHMAIN $(CFLAGS) $(DEBUGOPT)  basics.o sort_alg.o -o SEARCHERFACADE $(SRCDIR)/ilspire07.c -lm
	 

sort_alg.o: 
	$(CC) $(CFLAGS) -c $(SRCDIR)/$(SRCDIRUTILS)/sort_alg.c
		 
	 
basics.o: 
	$(CC) $(CFLAGS) -c $(SRCDIR)/$(SRCDIRUTILS)/basics.c
	



cleanO: 
	rm -f *.o
	
clean:
	rm -rf *~ *% *.o core *.bak $(LIB_IL_INDEX_VBYTE) myIL myILSearch

tar:
	# datetex=il_vbyte[$(date +%F_%H_%M_%S)].tar.gz 
	# tar czvf "$datetex" Makefile src linker scripts README patts go*
	tar czvf il_vbyte.tar.gz Makefile src linker scripts README patts go*
	
bz:
	# datetex=il_vbyte[$(date +%F_%H_%M_%S)].tar.bz2
	# tar jcvf  "$datetex" Makefile src linker scripts README patts samplePosting go*
	tar jcvf il_vbyte.tar.bz2 Makefile src linker scripts README patts samplePosting go*


##  valgrind  --leak-check=full --show-reachable=yes ./myIL ../crr.post crr "samplerate=8;filename=output"
##  valgrind  --leak-check=full --show-reachable=yes ./myILSearch crr I 20 2 "int2=svs;fsearch=dec" < patterns.file
##
