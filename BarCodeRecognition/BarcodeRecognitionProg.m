clc, clear, close all;
[f p]=uigetfile('*.png');
I=imread([p f]);
I= imresize(I,[240,320]);
GI=rgb2gray(I);
figure,imshow(I),title('Original Image');
figure,imshow(GI),title('Gray Image');
Row=[80 120 160];
[R, F] = Feature(I, Row);
[Center, Width, NumBar] = Bar(F);
[Sequence, NumSeq] = Detection(Width, NumBar, 2);
[LGCode, LCode, GCode, RCode, LCodeRev, GCodeRev, RCodeRev] = Codebook;
[Code, Conf] = Recognition(Center, Width, ...
    Sequence, NumSeq, LGCode, LCode, GCode, RCode, ...
    LCodeRev, GCodeRev, RCodeRev) ;
Code=Code';
disp(Code);
disp(Conf);

