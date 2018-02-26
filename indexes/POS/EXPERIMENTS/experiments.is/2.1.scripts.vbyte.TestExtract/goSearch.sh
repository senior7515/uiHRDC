
echo "################################################################" 
rm -f E.dat
rm -f N.dat

./SEARCH indexes/wiki2gb E 200 "int2=merge;intn=svs;fsearch=seqM" < ../../patterns/wiki2g.words.f1_1000
mv E.dat E_Wa.2.1.vbyte.dat

./SEARCH indexes/wiki2gb E 200 "int2=merge;intn=svs;fsearch=seqM" < ../../patterns/wiki2g.words.f1001_100k
mv E.dat E_Wb.2.1.vbyte.dat

./SEARCH indexes/wiki2gb N 3 "int2=merge;intn=svs;fsearch=seqM" < ../../patterns/wiki2g_2_2
mv N.dat N_p2.2.1.vbyte.dat

./SEARCH indexes/wiki2gb N 3 "int2=merge;intn=svs;fsearch=seqM" < ../../patterns/wiki2g_5_5
mv N.dat N_p5.2.1.vbyte.dat



#./SEARCH indexes/wiki2gb E 100 "int2=merge;intn=svs;fsearch=seqM" < ../../patterns/einstein.words
#./SEARCH indexes/wiki2gb N 100 "int2=merge;intn=svs;fsearch=seqM" < ../../patterns/einstein_2_5
#cp E.dat E.2.1.vbyte.dat
#cp N.dat N.2.1.vbyte.dat

echo "################################################################"


