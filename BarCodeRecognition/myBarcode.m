function [Code Conf]=myBarcode(GI)

Row=[80 120 160]
[R, F]=Feature(GI,Row);
[Center, Width, NumBar] = Bar(F);
[Sequence, NumSeq] = Detection(Width, NumBar, 2);
[LGCode, LCode, GCode, RCode, LCodeRev, GCodeRev, RCodeRev] = Codebook;
[Code, Conf] = Recognition(Center, Width, ...
    Sequence, NumSeq, LGCode, LCode, GCode, RCode, ...
    LCodeRev, GCodeRev, RCodeRev) ;
Code=Code';
