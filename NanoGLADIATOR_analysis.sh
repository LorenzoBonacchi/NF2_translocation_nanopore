##### Nanogladiator 10 000
perl ReferenceWindowInitialize.pl -M genome -S SourceTargethg38.txt -T hg38w10000 -W 10000 -A hg38
perl NanoGLADIATORPrepare.pl /home/utenteunifi/tools/NanoGLADIATOR_1.0/experimentalfile230om.txt --processors 60 --target hg38w10000 --assembly hg38
perl NanoGLADIATORAnalysis.pl /home/utenteunifi/tools/NanoGLADIATOR_1.0/230OManalysis.txt --processors 60 --target hg38w100 --assembly hg38 --output /home/utenteunifi/data/WGS_NF2_230OM/nanoglad230/ --mode nocontrol

##### Nanogladiator 100 000
perl ReferenceWindowInitialize.pl -M genome -S SourceTargethg38.txt -T hg38w100000 -W 100000 -A hg38
perl NanoGLADIATORPrepare.pl /home/utenteunifi/tools/NanoGLADIATOR_1.0/experimentalfile230om.txt --processors 60 --target hg38w10000 --assembly hg38
perl NanoGLADIATORAnalysis.pl /home/utenteunifi/tools/NanoGLADIATOR_1.0/230OManalysis.txt --processors 60 --target hg38w100 --assembly hg38 --output /home/utenteunifi/data/WGS_NF2_230OM/nanoglad230/ --mode nocontrol
