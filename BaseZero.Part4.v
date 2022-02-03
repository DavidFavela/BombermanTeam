// --- BEGIN ADDSUB1_32 ---
module FullAdder(A,B,C,carry,sum);
	input B;   //bit to be added
	input C;	// carry bit
	output carry;	//output carry
	input A;   // bit to be added
	output sum;	//sum of bits
	
	wire intermediate, carry1, carry2;
	
	assign intermediate = A ^ B;
	assign carry1 = A & B;
	assign carry2 = intermediate & C;
	assign sum = intermediate ^ C;
	assign carry = carry1 | carry2;

endmodule

module ADDSUB1_32(IN1_16,IN2_16,OP1_4,sum,OUT2_2);
    input  [15:0] IN1_16;	//16 bit input to be added
    input  [15:0] IN2_16;   //16 bit input to be added
    input  [3:0] OP1_4;     //command code to get mode
    output [31:0] sum;      //output of ADDSUB1_32 module
    output [1:0] OUT2_2;    //Error code
    wire b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15; //XOR Interfaces
    wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15; //Carry Interfaces
	wire mode;
	assign mode = OP1_4[2] & 'b1; // mode = 1 IFF OP1_4 == 0101 (subtraction)
    assign b0 = IN2_16[0] ^ mode;
    assign b1 = IN2_16[1] ^ mode;
    assign b2 = IN2_16[2] ^ mode;
    assign b3 = IN2_16[3] ^ mode;
    assign b4 = IN2_16[4] ^ mode;
    assign b5 = IN2_16[5] ^ mode;
    assign b6 = IN2_16[6] ^ mode;
    assign b7 = IN2_16[7] ^ mode;
    assign b8 = IN2_16[8] ^ mode;
    assign b9 = IN2_16[9] ^ mode;
    assign b10 = IN2_16[10] ^ mode;
    assign b11 = IN2_16[11] ^ mode;
    assign b12 = IN2_16[12] ^ mode;
    assign b13 = IN2_16[13] ^ mode;
    assign b14 = IN2_16[14] ^ mode;
    assign b15 = IN2_16[15] ^ mode;


	FullAdder FA0(IN1_16[0],b0,mode,c0,sum[0]);
	FullAdder FA1(IN1_16[1],b1,  c0,c1,sum[1]);
	FullAdder FA2(IN1_16[2],b2,  c1,c2,sum[2]);
	FullAdder FA3(IN1_16[3],b3,  c2,c3,sum[3]);

	FullAdder FA4(IN1_16[4],b4,  c3,c4,sum[4]);
	FullAdder FA5(IN1_16[5],b5,  c4,c5,sum[5]);
	FullAdder FA6(IN1_16[6],b6,  c5,c6,sum[6]);
	FullAdder FA7(IN1_16[7],b7,  c6,c7,sum[7]);

	FullAdder FA8(IN1_16[8],b8,  c7,c8,sum[8]);
	FullAdder FA9(IN1_16[9],b9,  c8,c9,sum[9]);
	FullAdder FA10(IN1_16[10],b10,c9,c10,sum[10]);
	FullAdder FA11(IN1_16[11],b11,c10,c11,sum[11]);

	FullAdder FA12(IN1_16[12],b12, c11,c12,sum[12]);
	FullAdder FA13(IN1_16[13],b13,  c12,c13,sum[13]);
	FullAdder FA14(IN1_16[14],b14,  c13,c14,sum[14]);
	FullAdder FA15(IN1_16[15],b15,  c14,c15,sum[15]);
	assign sum[16] = c15 & ~mode;
	assign sum[17] = 'b0;
	assign sum[18] = 'b0;
	assign sum[19] = 'b0;
	assign sum[20] = 'b0;
	assign sum[21] = 'b0;
	assign sum[22] = 'b0;
	assign sum[23] = 'b0;
	assign sum[24] = 'b0;
	assign sum[25] = 'b0;
	assign sum[26] = 'b0;
	assign sum[27] = 'b0;
	assign sum[28] = 'b0;
	assign sum[29] = 'b0;
	assign sum[30] = 'b0;
	assign sum[31] = 'b0;
		
	
	//xor (carry, c15, c14);
	assign OUT2_2 = {1'b0, ((c15 ^ c14) & mode)} ;	

endmodule
// --- END ADDSUB1_32 ---


// --- BEGIN MULT1_32 ---
// Use structured code

module MULT1_32(a,b,outnice);
	input [15:0] a,b;
	output [31:0] outnice;

	wire [15:0] sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7, sum8, sum9, sum10, sum11, sum12, sum13, sum14, sum15, sum16, sum17, sum18, sum19, sum20, sum21, sum22, sum23, sum24, sum25, sum26, sum27, sum28, sum29, sum30;
	wire [15:0] c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30;
	wire zero;
	assign zero = 'b0;
	
	FullAdder FA0(a[0] & b[0], zero, zero, c0[0], sum0[0]);
	FullAdder FA1(a[1] & b[0], zero, c0[0], c1[0], sum1[0]);
	FullAdder FA2(a[2] & b[0], zero, c1[0], c2[0], sum2[0]);
	FullAdder FA3(a[3] & b[0], zero, c2[0], c3[0], sum3[0]);
	FullAdder FA4(a[4] & b[0], zero, c3[0], c4[0], sum4[0]);
	FullAdder FA5(a[5] & b[0], zero, c4[0], c5[0], sum5[0]);
	FullAdder FA6(a[6] & b[0], zero, c5[0], c6[0], sum6[0]);
	FullAdder FA7(a[7] & b[0], zero, c6[0], c7[0], sum7[0]);
	FullAdder FA8(a[8] & b[0], zero, c7[0], c8[0], sum8[0]);
	FullAdder FA9(a[9] & b[0], zero, c8[0], c9[0], sum9[0]);
	FullAdder FA10(a[10] & b[0], zero, c9[0], c10[0], sum10[0]);
	FullAdder FA11(a[11] & b[0], zero, c10[0], c11[0], sum11[0]);
	FullAdder FA12(a[12] & b[0], zero, c11[0], c12[0], sum12[0]);
	FullAdder FA13(a[13] & b[0], zero, c12[0], c13[0], sum13[0]);
	FullAdder FA14(a[14] & b[0], zero, c13[0], c14[0], sum14[0]);
	FullAdder FA15(a[15] & b[0], zero, c14[0], c15[0], sum15[0]);
	
	// second row
	
	FullAdder FA16(a[0] & b[1], sum1[0], zero, c1[1], sum1[1]);
	FullAdder FA17(a[1] & b[1], sum2[0], c1[1], c2[1], sum2[1]);
	FullAdder FA18(a[2] & b[1], sum3[0], c2[1], c3[1], sum3[1]);
	FullAdder FA19(a[3] & b[1], sum4[0], c3[1], c4[1], sum4[1]);
	FullAdder FA20(a[4] & b[1], sum5[0], c4[1], c5[1], sum5[1]);
	FullAdder FA21(a[5] & b[1], sum6[0], c5[1], c6[1], sum6[1]);
	FullAdder FA22(a[6] & b[1], sum7[0], c6[1], c7[1], sum7[1]);
	FullAdder FA23(a[7] & b[1], sum8[0], c7[1], c8[1], sum8[1]);
	FullAdder FA24(a[8] & b[1], sum9[0], c8[1], c9[1], sum9[1]);
	FullAdder FA25(a[9] & b[1], sum10[0], c9[1], c10[1], sum10[1]);
	FullAdder FA26(a[10] & b[1], sum11[0], c10[1], c11[1], sum11[1]);
	FullAdder FA27(a[11] & b[1], sum12[0], c11[1], c12[1], sum12[1]);
	FullAdder FA28(a[12] & b[1], sum13[0], c12[1], c13[1], sum13[1]);
	FullAdder FA29(a[13] & b[1], sum14[0], c13[1], c14[1], sum14[1]);
	FullAdder FA30(a[14] & b[1], sum15[0], c14[1], c15[1], sum15[1]);
	FullAdder FA31(a[15] & b[1], c15[0], c15[1], c16[1], sum16[1]);
	
	// third row
	
	FullAdder FA32(a[0] & b[2], sum2[1], zero, c2[2], sum2[2]);
	FullAdder FA33(a[1] & b[2], sum3[1], c2[2], c3[2], sum3[2]);
	FullAdder FA34(a[2] & b[2], sum4[1], c3[2], c4[2], sum4[2]);
	FullAdder FA35(a[3] & b[2], sum5[1], c4[2], c5[2], sum5[2]);
	FullAdder FA36(a[4] & b[2], sum6[1], c5[2], c6[2], sum6[2]);
	FullAdder FA37(a[5] & b[2], sum7[1], c6[2], c7[2], sum7[2]);
	FullAdder FA38(a[6] & b[2], sum8[1], c7[2], c8[2], sum8[2]);
	FullAdder FA39(a[7] & b[2], sum9[1], c8[2], c9[2], sum9[2]);
	FullAdder FA40(a[8] & b[2], sum10[1], c9[2], c10[2], sum10[2]);
	FullAdder FA41(a[9] & b[2], sum11[1], c10[2], c11[2], sum11[2]);
	FullAdder FA42(a[10] & b[2], sum12[1], c11[2], c12[2], sum12[2]);
	FullAdder FA43(a[11] & b[2], sum13[1], c12[2], c13[2], sum13[2]);
	FullAdder FA44(a[12] & b[2], sum14[1], c13[2], c14[2], sum14[2]);
	FullAdder FA45(a[13] & b[2], sum15[1], c14[2], c15[2], sum15[2]);
	FullAdder FA46(a[14] & b[2], sum16[1], c15[2], c16[2], sum16[2]);
	FullAdder FA47(a[15] & b[2], c16[1], c16[2], c17[2], sum17[2]);
	
	// fourth row
	
	FullAdder FA48(a[0] & b[3], sum3[2], zero, c3[3], sum3[3]);
	FullAdder FA49(a[1] & b[3], sum4[2], c3[3], c4[3], sum4[3]);
	FullAdder FA50(a[2] & b[3], sum5[2], c4[3], c5[3], sum5[3]);
	FullAdder FA51(a[3] & b[3], sum6[2], c5[3], c6[3], sum6[3]);
	FullAdder FA52(a[4] & b[3], sum7[2], c6[3], c7[3], sum7[3]);
	FullAdder FA53(a[5] & b[3], sum8[2], c7[3], c8[3], sum8[3]);
	FullAdder FA54(a[6] & b[3], sum9[2], c8[3], c9[3], sum9[3]);
	FullAdder FA55(a[7] & b[3], sum10[2], c9[3], c10[3], sum10[3]);
	FullAdder FA56(a[8] & b[3], sum11[2], c10[3], c11[3], sum11[3]);
	FullAdder FA57(a[9] & b[3], sum12[2], c11[3], c12[3], sum12[3]);
	FullAdder FA58(a[10] & b[3], sum13[2], c12[3], c13[3], sum13[3]);
	FullAdder FA59(a[11] & b[3], sum14[2], c13[3], c14[3], sum14[3]);
	FullAdder FA60(a[12] & b[3], sum15[2], c14[3], c15[3], sum15[3]);
	FullAdder FA61(a[13] & b[3], sum16[2], c15[3], c16[3], sum16[3]);
	FullAdder FA62(a[14] & b[3], sum17[2], c16[3], c17[3], sum17[3]);
	FullAdder FA63(a[15] & b[3], c17[2], c17[3], c18[3], sum18[3]);
	
	// fifth row
	
	FullAdder FA64(a[0] & b[4], sum4[3], zero, c4[4], sum4[4]);
	FullAdder FA65(a[1] & b[4], sum5[3], c4[4], c5[4], sum5[4]);
	FullAdder FA66(a[2] & b[4], sum6[3], c5[4], c6[4], sum6[4]);
	FullAdder FA67(a[3] & b[4], sum7[3], c6[4], c7[4], sum7[4]);
	FullAdder FA68(a[4] & b[4], sum8[3], c7[4], c8[4], sum8[4]);
	FullAdder FA69(a[5] & b[4], sum9[3], c8[4], c9[4], sum9[4]);
	FullAdder FA70(a[6] & b[4], sum10[3], c9[4], c10[4], sum10[4]);
	FullAdder FA71(a[7] & b[4], sum11[3], c10[4], c11[4], sum11[4]);
	FullAdder FA72(a[8] & b[4], sum12[3], c11[4], c12[4], sum12[4]);
	FullAdder FA73(a[9] & b[4], sum13[3], c12[4], c13[4], sum13[4]);
	FullAdder FA74(a[10] & b[4], sum14[3], c13[4], c14[4], sum14[4]);
	FullAdder FA75(a[11] & b[4], sum15[3], c14[4], c15[4], sum15[4]);
	FullAdder FA76(a[12] & b[4], sum16[3], c15[4], c16[4], sum16[4]);
	FullAdder FA77(a[13] & b[4], sum17[3], c16[4], c17[4], sum17[4]);
	FullAdder FA78(a[14] & b[4], sum18[3], c17[4], c18[4], sum18[4]);
	FullAdder FA79(a[15] & b[4], c18[3], c18[4], c19[4], sum19[4]);
	
	// sixth row
	
	FullAdder FA80(a[0] & b[5], sum5[4], zero, c5[5], sum5[5]);
	FullAdder FA81(a[1] & b[5], sum6[4], c5[5], c6[5], sum6[5]);
	FullAdder FA82(a[2] & b[5], sum7[4], c6[5], c7[5], sum7[5]);
	FullAdder FA83(a[3] & b[5], sum8[4], c7[5], c8[5], sum8[5]);
	FullAdder FA84(a[4] & b[5], sum9[4], c8[5], c9[5], sum9[5]);
	FullAdder FA85(a[5] & b[5], sum10[4], c9[5], c10[5], sum10[5]);
	FullAdder FA86(a[6] & b[5], sum11[4], c10[5], c11[5], sum11[5]);
	FullAdder FA87(a[7] & b[5], sum12[4], c11[5], c12[5], sum12[5]);
	FullAdder FA88(a[8] & b[5], sum13[4], c12[5], c13[5], sum13[5]);
	FullAdder FA89(a[9] & b[5], sum14[4], c13[5], c14[5], sum14[5]);
	FullAdder FA90(a[10] & b[5], sum15[4], c14[5], c15[5], sum15[5]);
	FullAdder FA91(a[11] & b[5], sum16[4], c15[5], c16[5], sum16[5]);
	FullAdder FA92(a[12] & b[5], sum17[4], c16[5], c17[5], sum17[5]);
	FullAdder FA93(a[13] & b[5], sum18[4], c17[5], c18[5], sum18[5]);
	FullAdder FA94(a[14] & b[5], sum19[4], c18[5], c19[5], sum19[5]);
	FullAdder FA95(a[15] & b[5], c19[4], c19[5], c20[5], sum20[5]);
	
	// seventh row
	
	FullAdder FA96(a[0] & b[6], sum6[5], zero, c6[6], sum6[6]);
	FullAdder FA97(a[1] & b[6], sum7[5], c6[6], c7[6], sum7[6]);
	FullAdder FA98(a[2] & b[6], sum8[5], c7[6], c8[6], sum8[6]);
	FullAdder FA99(a[3] & b[6], sum9[5], c8[6], c9[6], sum9[6]);
	FullAdder FA100(a[4] & b[6], sum10[5], c9[6], c10[6], sum10[6]);
	FullAdder FA101(a[5] & b[6], sum11[5], c10[6], c11[6], sum11[6]);
	FullAdder FA102(a[6] & b[6], sum12[5], c11[6], c12[6], sum12[6]);
	FullAdder FA103(a[7] & b[6], sum13[5], c12[6], c13[6], sum13[6]);
	FullAdder FA104(a[8] & b[6], sum14[5], c13[6], c14[6], sum14[6]);
	FullAdder FA105(a[9] & b[6], sum15[5], c14[6], c15[6], sum15[6]);
	FullAdder FA106(a[10] & b[6], sum16[5], c15[6], c16[6], sum16[6]);
	FullAdder FA107(a[11] & b[6], sum17[5], c16[6], c17[6], sum17[6]);
	FullAdder FA108(a[12] & b[6], sum18[5], c17[6], c18[6], sum18[6]);
	FullAdder FA109(a[13] & b[6], sum19[5], c18[6], c19[6], sum19[6]);
	FullAdder FA110(a[14] & b[6], sum20[5], c19[6], c20[6], sum20[6]);
	FullAdder FA111(a[15] & b[6], c20[5], c20[6], c21[6], sum21[6]);
	
	// eight row
	
	FullAdder FA112(a[0] & b[7], sum7[6], zero, c7[7], sum7[7]);
	FullAdder FA113(a[1] & b[7], sum8[6], c7[7], c8[7], sum8[7]);
	FullAdder FA114(a[2] & b[7], sum9[6], c8[7], c9[7], sum9[7]);
	FullAdder FA115(a[3] & b[7], sum10[6], c9[7], c10[7], sum10[7]);
	FullAdder FA116(a[4] & b[7], sum11[6], c10[7], c11[7], sum11[7]);
	FullAdder FA117(a[5] & b[7], sum12[6], c11[7], c12[7], sum12[7]);
	FullAdder FA118(a[6] & b[7], sum13[6], c12[7], c13[7], sum13[7]);
	FullAdder FA119(a[7] & b[7], sum14[6], c13[7], c14[7], sum14[7]);
	FullAdder FA120(a[8] & b[7], sum15[6], c14[7], c15[7], sum15[7]);
	FullAdder FA121(a[9] & b[7], sum16[6], c15[7], c16[7], sum16[7]);
	FullAdder FA122(a[10] & b[7], sum17[6], c16[7], c17[7], sum17[7]);
	FullAdder FA123(a[11] & b[7], sum18[6], c17[7], c18[7], sum18[7]);
	FullAdder FA124(a[12] & b[7], sum19[6], c18[7], c19[7], sum19[7]);
	FullAdder FA125(a[13] & b[7], sum20[6], c19[7], c20[7], sum20[7]);
	FullAdder FA126(a[14] & b[7], sum21[6], c20[7], c21[7], sum21[7]);
	FullAdder FA127(a[15] & b[7], c21[6], c21[7], c22[7], sum22[7]);
	
	// ninth row
	
	FullAdder FA128(a[0] & b[8], sum8[7], zero, c8[8], sum8[8]);
	FullAdder FA129(a[1] & b[8], sum9[7], c8[8], c9[8], sum9[8]);
	FullAdder FA130(a[2] & b[8], sum10[7], c9[8], c10[8], sum10[8]);
	FullAdder FA131(a[3] & b[8], sum11[7], c10[8], c11[8], sum11[8]);
	FullAdder FA132(a[4] & b[8], sum12[7], c11[8], c12[8], sum12[8]);
	FullAdder FA133(a[5] & b[8], sum13[7], c12[8], c13[8], sum13[8]);
	FullAdder FA134(a[6] & b[8], sum14[7], c13[8], c14[8], sum14[8]);
	FullAdder FA135(a[7] & b[8], sum15[7], c14[8], c15[8], sum15[8]);
	FullAdder FA136(a[8] & b[8], sum16[7], c15[8], c16[8], sum16[8]);
	FullAdder FA137(a[9] & b[8], sum17[7], c16[8], c17[8], sum17[8]);
	FullAdder FA138(a[10] & b[8], sum18[7], c17[8], c18[8], sum18[8]);
	FullAdder FA139(a[11] & b[8], sum19[7], c18[8], c19[8], sum19[8]);
	FullAdder FA140(a[12] & b[8], sum20[7], c19[8], c20[8], sum20[8]);
	FullAdder FA141(a[13] & b[8], sum21[7], c20[8], c21[8], sum21[8]);
	FullAdder FA142(a[14] & b[8], sum22[7], c21[8], c22[8], sum22[8]);
	FullAdder FA143(a[15] & b[8], c22[7], c22[8], c23[8], sum23[8]);
	
	// tenth row
	
	FullAdder FA144(a[0] & b[9], sum9[8], zero, c9[9], sum9[9]);
	FullAdder FA145(a[1] & b[9], sum10[8], c9[9], c10[9], sum10[9]);
	FullAdder FA146(a[2] & b[9], sum11[8], c10[9], c11[9], sum11[9]);
	FullAdder FA147(a[3] & b[9], sum12[8], c11[9], c12[9], sum12[9]);
	FullAdder FA148(a[4] & b[9], sum13[8], c12[9], c13[9], sum13[9]);
	FullAdder FA149(a[5] & b[9], sum14[8], c13[9], c14[9], sum14[9]);
	FullAdder FA150(a[6] & b[9], sum15[8], c14[9], c15[9], sum15[9]);
	FullAdder FA151(a[7] & b[9], sum16[8], c15[9], c16[9], sum16[9]);
	FullAdder FA152(a[8] & b[9], sum17[8], c16[9], c17[9], sum17[9]);
	FullAdder FA153(a[9] & b[9], sum18[8], c17[9], c18[9], sum18[9]);
	FullAdder FA154(a[10] & b[9], sum19[8], c18[9], c19[9], sum19[9]);
	FullAdder FA155(a[11] & b[9], sum20[8], c19[9], c20[9], sum20[9]);
	FullAdder FA156(a[12] & b[9], sum21[8], c20[9], c21[9], sum21[9]);
	FullAdder FA157(a[13] & b[9], sum22[8], c21[9], c22[9], sum22[9]);
	FullAdder FA158(a[14] & b[9], sum23[8], c22[9], c23[9], sum23[9]);
	FullAdder FA159(a[15] & b[9], c23[8], c23[9], c24[9], sum24[9]);
	
	// eleventh row
	
	FullAdder FA160(a[0] & b[10], sum10[9], zero, c10[10], sum10[10]);
	FullAdder FA161(a[1] & b[10], sum11[9], c10[10], c11[10], sum11[10]);
	FullAdder FA162(a[2] & b[10], sum12[9], c11[10], c12[10], sum12[10]);
	FullAdder FA163(a[3] & b[10], sum13[9], c12[10], c13[10], sum13[10]);
	FullAdder FA164(a[4] & b[10], sum14[9], c13[10], c14[10], sum14[10]);
	FullAdder FA165(a[5] & b[10], sum15[9], c14[10], c15[10], sum15[10]);
	FullAdder FA166(a[6] & b[10], sum16[9], c15[10], c16[10], sum16[10]);
	FullAdder FA167(a[7] & b[10], sum17[9], c16[10], c17[10], sum17[10]);
	FullAdder FA168(a[8] & b[10], sum18[9], c17[10], c18[10], sum18[10]);
	FullAdder FA169(a[9] & b[10], sum19[9], c18[10], c19[10], sum19[10]);
	FullAdder FA170(a[10] & b[10], sum20[9], c19[10], c20[10], sum20[10]);
	FullAdder FA171(a[11] & b[10], sum21[9], c20[10], c21[10], sum21[10]);
	FullAdder FA172(a[12] & b[10], sum22[9], c21[10], c22[10], sum22[10]);
	FullAdder FA173(a[13] & b[10], sum23[9], c22[10], c23[10], sum23[10]);
	FullAdder FA174(a[14] & b[10], sum24[9], c23[10], c24[10], sum24[10]);
	FullAdder FA175(a[15] & b[10], c24[9], c24[10], c25[10], sum25[10]);
	
	// twelfth row
	
	FullAdder FA176(a[0] & b[11], sum11[10], zero, c11[11], sum11[11]);
	FullAdder FA177(a[1] & b[11], sum12[10], c11[11], c12[11], sum12[11]);
	FullAdder FA178(a[2] & b[11], sum13[10], c12[11], c13[11], sum13[11]);
	FullAdder FA179(a[3] & b[11], sum14[10], c13[11], c14[11], sum14[11]);
	FullAdder FA180(a[4] & b[11], sum15[10], c14[11], c15[11], sum15[11]);
	FullAdder FA181(a[5] & b[11], sum16[10], c15[11], c16[11], sum16[11]);
	FullAdder FA182(a[6] & b[11], sum17[10], c16[11], c17[11], sum17[11]);
	FullAdder FA183(a[7] & b[11], sum18[10], c17[11], c18[11], sum18[11]);
	FullAdder FA184(a[8] & b[11], sum19[10], c18[11], c19[11], sum19[11]);
	FullAdder FA185(a[9] & b[11], sum20[10], c19[11], c20[11], sum20[11]);
	FullAdder FA186(a[10] & b[11], sum21[10], c20[11], c21[11], sum21[11]);
	FullAdder FA187(a[11] & b[11], sum22[10], c21[11], c22[11], sum22[11]);
	FullAdder FA188(a[12] & b[11], sum23[10], c22[11], c23[11], sum23[11]);
	FullAdder FA189(a[13] & b[11], sum24[10], c23[11], c24[11], sum24[11]);
	FullAdder FA190(a[14] & b[11], sum25[10], c24[11], c25[11], sum25[11]);
	FullAdder FA191(a[15] & b[11], c25[10], c25[11], c26[11], sum26[11]);
	
	// thirteenth row
	
	FullAdder FA192(a[0] & b[12], sum12[11], zero, c12[12], sum12[12]);
	FullAdder FA193(a[1] & b[12], sum13[11], c12[12], c13[12], sum13[12]);
	FullAdder FA194(a[2] & b[12], sum14[11], c13[12], c14[12], sum14[12]);
	FullAdder FA195(a[3] & b[12], sum15[11], c14[12], c15[12], sum15[12]);
	FullAdder FA196(a[4] & b[12], sum16[11], c15[12], c16[12], sum16[12]);
	FullAdder FA197(a[5] & b[12], sum17[11], c16[12], c17[12], sum17[12]);
	FullAdder FA198(a[6] & b[12], sum18[11], c17[12], c18[12], sum18[12]);
	FullAdder FA199(a[7] & b[12], sum19[11], c18[12], c19[12], sum19[12]);
	FullAdder FA200(a[8] & b[12], sum20[11], c19[12], c20[12], sum20[12]);
	FullAdder FA201(a[9] & b[12], sum21[11], c20[12], c21[12], sum21[12]);
	FullAdder FA202(a[10] & b[12], sum22[11], c21[12], c22[12], sum22[12]);
	FullAdder FA203(a[11] & b[12], sum23[11], c22[12], c23[12], sum23[12]);
	FullAdder FA204(a[12] & b[12], sum24[11], c23[12], c24[12], sum24[12]);
	FullAdder FA205(a[13] & b[12], sum25[11], c24[12], c25[12], sum25[12]);
	FullAdder FA206(a[14] & b[12], sum26[11], c25[12], c26[12], sum26[12]);
	FullAdder FA207(a[15] & b[12], c26[11], c26[12], c27[12], sum27[12]);	
	
	// fourteenth row
	
	FullAdder FA208(a[0] & b[13], sum13[12], zero, c13[13], sum13[13]);
	FullAdder FA209(a[1] & b[13], sum14[12], c13[13], c14[13], sum14[13]);
	FullAdder FA210(a[2] & b[13], sum15[12], c14[13], c15[13], sum15[13]);
	FullAdder FA211(a[3] & b[13], sum16[12], c15[13], c16[13], sum16[13]);
	FullAdder FA212(a[4] & b[13], sum17[12], c16[13], c17[13], sum17[13]);
	FullAdder FA213(a[5] & b[13], sum18[12], c17[13], c18[13], sum18[13]);
	FullAdder FA214(a[6] & b[13], sum19[12], c18[13], c19[13], sum19[13]);
	FullAdder FA215(a[7] & b[13], sum20[12], c19[13], c20[13], sum20[13]);
	FullAdder FA216(a[8] & b[13], sum21[12], c20[13], c21[13], sum21[13]);
	FullAdder FA217(a[9] & b[13], sum22[12], c21[13], c22[13], sum22[13]);
	FullAdder FA218(a[10] & b[13], sum23[12], c22[13], c23[13], sum23[13]);
	FullAdder FA219(a[11] & b[13], sum24[12], c23[13], c24[13], sum24[13]);
	FullAdder FA220(a[12] & b[13], sum25[12], c24[13], c25[13], sum25[13]);
	FullAdder FA221(a[13] & b[13], sum26[12], c25[13], c26[13], sum26[13]);
	FullAdder FA222(a[14] & b[13], sum27[12], c26[13], c27[13], sum27[13]);
	FullAdder FA223(a[15] & b[13], c27[12], c27[13], c28[13], sum28[13]);
	
	// fifteenth row
	
	FullAdder FA224(a[0] & b[14], sum14[13], zero, c14[14], sum14[14]);
	FullAdder FA225(a[1] & b[14], sum15[13], c14[14], c15[14], sum15[14]);
	FullAdder FA226(a[2] & b[14], sum16[13], c15[14], c16[14], sum16[14]);
	FullAdder FA227(a[3] & b[14], sum17[13], c16[14], c17[14], sum17[14]);
	FullAdder FA228(a[4] & b[14], sum18[13], c17[14], c18[14], sum18[14]);
	FullAdder FA229(a[5] & b[14], sum19[13], c18[14], c19[14], sum19[14]);
	FullAdder FA230(a[6] & b[14], sum20[13], c19[14], c20[14], sum20[14]);
	FullAdder FA231(a[7] & b[14], sum21[13], c20[14], c21[14], sum21[14]);
	FullAdder FA232(a[8] & b[14], sum22[13], c21[14], c22[14], sum22[14]);
	FullAdder FA233(a[9] & b[14], sum23[13], c22[14], c23[14], sum23[14]);
	FullAdder FA234(a[10] & b[14], sum24[13], c23[14], c24[14], sum24[14]);
	FullAdder FA235(a[11] & b[14], sum25[13], c24[14], c25[14], sum25[14]);
	FullAdder FA236(a[12] & b[14], sum26[13], c25[14], c26[14], sum26[14]);
	FullAdder FA237(a[13] & b[14], sum27[13], c26[14], c27[14], sum27[14]);
	FullAdder FA238(a[14] & b[14], sum28[13], c27[14], c28[14], sum28[14]);
	FullAdder FA239(a[15] & b[14], c28[13], c28[14], c29[14], sum29[14]);
	
	// sixteenth row
	
	FullAdder FA240(a[0] & b[15], sum15[14], zero, c15[15], sum15[15]);
	FullAdder FA241(a[1] & b[15], sum16[14], c15[15], c16[15], sum16[15]);
	FullAdder FA242(a[2] & b[15], sum17[14], c16[15], c17[15], sum17[15]);
	FullAdder FA243(a[3] & b[15], sum18[14], c17[15], c18[15], sum18[15]);
	FullAdder FA244(a[4] & b[15], sum19[14], c18[15], c19[15], sum19[15]);
	FullAdder FA245(a[5] & b[15], sum20[14], c19[15], c20[15], sum20[15]);
	FullAdder FA246(a[6] & b[15], sum21[14], c20[15], c21[15], sum21[15]);
	FullAdder FA247(a[7] & b[15], sum22[14], c21[15], c22[15], sum22[15]);
	FullAdder FA248(a[8] & b[15], sum23[14], c22[15], c23[15], sum23[15]);
	FullAdder FA249(a[9] & b[15], sum24[14], c23[15], c24[15], sum24[15]);
	FullAdder FA250(a[10] & b[15], sum25[14], c24[15], c25[15], sum25[15]);
	FullAdder FA251(a[11] & b[15], sum26[14], c25[15], c26[15], sum26[15]);
	FullAdder FA252(a[12] & b[15], sum27[14], c26[15], c27[15], sum27[15]);
	FullAdder FA253(a[13] & b[15], sum28[14], c27[15], c28[15], sum28[15]);
	FullAdder FA254(a[14] & b[15], sum29[14], c28[15], c29[15], sum29[15]);
	FullAdder FA255(a[15] & b[15], c29[14], c29[15], c30[15], sum30[15]);

	assign outnice[0] = sum0[0];
	assign outnice[1] = sum1[1];
	assign outnice[2] = sum2[2];
	assign outnice[3] = sum3[3];
	assign outnice[4] = sum4[4];
	assign outnice[5] = sum5[5];
	assign outnice[6] = sum6[6];
	assign outnice[7] = sum7[7];
	assign outnice[8] = sum8[8];
	assign outnice[9] = sum9[9];
	assign outnice[10] = sum10[10];
	assign outnice[11] = sum11[11];
	assign outnice[12] = sum12[12];
	assign outnice[13] = sum13[13];
	assign outnice[14] = sum14[14];
	assign outnice[15] = sum15[15];
	assign outnice[16] = sum16[15];
	assign outnice[17] = sum17[15];
	assign outnice[18] = sum18[15];
	assign outnice[19] = sum19[15];
	assign outnice[20] = sum20[15];
	assign outnice[21] = sum21[15];
	assign outnice[22] = sum22[15];
	assign outnice[23] = sum23[15];
	assign outnice[24] = sum24[15];
	assign outnice[25] = sum25[15];
	assign outnice[26] = sum26[15];
	assign outnice[27] = sum27[15];	
	assign outnice[28] = sum28[15];	
	assign outnice[29] = sum29[15]; 
	assign outnice[30] = sum30[15];
	assign outnice[31] = c30[15];

	
	
endmodule
// --- END MULT1_32 ---


// --- BEGIN DIV1_32 ---
// Use behavioral code
module DIV1_32 (dividend, divisor, quotient, OUT2_2/*,remainder*/);
	input[15:0] dividend, divisor;
	output[31:0] quotient;
	output[1:0] OUT2_2;  //error code
	reg[31:0] quotient;
	reg[15:0] tempDividend;   //to be shifted 
	reg[15:0] tempDivisor;   //to be shifted
	reg[15:0] A;   //extension of dividend
	reg[31:0] i; //loop control
	
	assign OUT2_2 = {divisor == 0, 1'b0};   //checks for divide by zero
	
	//dividing using booths algorithm
	always @(*)
	begin
	//assign values
	tempDividend = dividend;	
	tempDivisor = divisor;
	A = 0;	//initialize A
	for(i = 0; i < 16; i = i + 1)
	begin
		A = A << 1;	//shift left
		A[0] = tempDividend[15]; //move bit from dividend to A
		tempDividend = tempDividend << 1;	//shift left
		A = A - tempDivisor;
		if(A[15] == 1) 
		begin	
			tempDividend[0] = 0;
			A = A + tempDivisor;
		end
		else
			tempDividend[0] = 1;
	
	end
	quotient = tempDividend;
	
	if (divisor == 0)
	begin
		quotient = 1'dx;
	end
	
	end
	
endmodule
// --- END DIV1_32 ---


// --- BEGIN MOD1_32 ---
// Use behavioral code
module MOD1_32 (dividend, divisor, remainder, OUT2_2);
	input[15:0] dividend, divisor;
	output[1:0] OUT2_2;   //Error code
	output[31:0] remainder;
	reg[31:0] remainder;
	reg[15:0] tempDividend;   //to be shifted
	reg[15:0] tempDivisor;    //to be shifted
	reg[15:0] A;   //extension of dividend
	reg[31:0] i; //loop control
	
	assign OUT2_2 = {divisor == 0, 1'b0};   //checks for divide by zero
	
	//dividing using booths algorithm
	always @(*)
	begin
	//assign values
	tempDividend = dividend;	
	tempDivisor = divisor;
	A = 0;	//initialize A
	for(i = 0; i < 16; i = i + 1)
	begin
		A = A << 1;	//shift left
		A[0] = tempDividend[15]; //move bit from dividend to A
		tempDividend = tempDividend << 1;	//shift left
		A = A - tempDivisor;
		if(A[15] == 1) 
		begin	
			tempDividend[0] = 0;
			A = A + tempDivisor;
		end
		else
			tempDividend[0] = 1;
	
	end

	remainder =A;
	if (divisor == 0)
	begin
		remainder = 1'dx;
	end
	
	end
	
endmodule
// --- END MOD1_32 ---


// --- BEGIN DEC1_16 ---
module DEC1_16(OP1_4, select);
	input  [3:0]  OP1_4;   //command code to be converted to onehot
	output [15:0] select;   //onehot indicating chosen channel
	
	assign select[ 0]=~OP1_4[3]&~OP1_4[2]&~OP1_4[1]&~OP1_4[0];
	assign select[ 1]=~OP1_4[3]&~OP1_4[2]&~OP1_4[1]& OP1_4[0];
	assign select[ 2]=~OP1_4[3]&~OP1_4[2]& OP1_4[1]&~OP1_4[0];
	assign select[ 3]=~OP1_4[3]&~OP1_4[2]& OP1_4[1]& OP1_4[0];
	assign select[ 4]=~OP1_4[3]& OP1_4[2]&~OP1_4[1]&~OP1_4[0];
	assign select[ 5]=~OP1_4[3]& OP1_4[2]&~OP1_4[1]& OP1_4[0];
	assign select[ 6]=~OP1_4[3]& OP1_4[2]& OP1_4[1]&~OP1_4[0];
	assign select[ 7]=~OP1_4[3]& OP1_4[2]& OP1_4[1]& OP1_4[0];
	assign select[ 8]= OP1_4[3]&~OP1_4[2]&~OP1_4[1]&~OP1_4[0];
	assign select[ 9]= OP1_4[3]&~OP1_4[2]&~OP1_4[1]& OP1_4[0];
	assign select[10]= OP1_4[3]&~OP1_4[2]& OP1_4[1]&~OP1_4[0];
	assign select[11]= OP1_4[3]&~OP1_4[2]& OP1_4[1]& OP1_4[0];
	assign select[12]= OP1_4[3]& OP1_4[2]&~OP1_4[1]&~OP1_4[0];
	assign select[13]= OP1_4[3]& OP1_4[2]&~OP1_4[1]& OP1_4[0];
	assign select[14]= OP1_4[3]& OP1_4[2]& OP1_4[1]&~OP1_4[0];
	assign select[15]= OP1_4[3]& OP1_4[2]& OP1_4[1]& OP1_4[0];
endmodule
// --- END DEC1_16 ---


// --- BEGIN MUX1_32 ---
module MUX1_32(channels, select, muxOut);
	input [15:0][31:0] channels;   
	input       [15:0] select;  //onehot indicating which channel is chosen
	output      [31:0] muxOut;   //outputs chosen channel
	
	//extends the select by number of bits of channel. It is then AND with the corresponding
	//channel. If 0, the channel will be AND with 32 bits of zeros and will become only zeros.
	//If 1, the channel will be AND with 32 ones and will copy the channel. Then all select 
	//channel combination is OR together to assign the chosen channel to muxOut.
	assign muxOut = ({32{select[15]}} & channels[15]) | 
        ({32{select[14]}} & channels[14]) |
		({32{select[13]}} & channels[13]) |
		({32{select[12]}} & channels[12]) |
		({32{select[11]}} & channels[11]) |
		({32{select[10]}} & channels[10]) |
		({32{select[ 9]}} & channels[ 9]) |
		({32{select[ 8]}} & channels[ 8]) |
		({32{select[ 7]}} & channels[ 7]) |
		({32{select[ 6]}} & channels[ 6]) |
		({32{select[ 5]}} & channels[ 5]) |
		({32{select[ 4]}} & channels[ 4]) |
		({32{select[ 3]}} & channels[ 3]) |
		({32{select[ 2]}} & channels[ 2]) | 
        ({32{select[ 1]}} & channels[ 1]) |
        ({32{select[ 0]}} & channels[ 0]) ;
endmodule
// --- END MUX1_32 ---

// --- BEGIN DFFn_1 ---
module DFFn_1(CLK, in, out);
	parameter n=1;
	input CLK;
	input [n-1:0] in;
	output [n-1:0] out;
	reg [n-1:0] out;
	
	always @(posedge CLK)
		out = in;
endmodule
// --- END DFFn_1 ---


// ---Logic Modules ---
module AND(FEEDBACK, IN1_16,andOut);
	input[15:0] FEEDBACK, IN1_16;
	output[15:0] andOut;
	wire[15:0] andOut;
	assign andOut = FEEDBACK & IN1_16;
endmodule

module NAND(FEEDBACK, IN1_16,nandOut);
	input[15:0] FEEDBACK, IN1_16;
	output[15:0] nandOut;
	wire[15:0] nandOut;
	assign nandOut = ~(FEEDBACK & IN1_16);
endmodule

module NOR(FEEDBACK, IN1_16,norOut);
	input[15:0] FEEDBACK, IN1_16;
	output[15:0] norOut;
	wire[15:0] norOut;
	assign norOut = ~(FEEDBACK | IN1_16);
endmodule

module NOT(FEEDBACK, IN1_16,notOut);
	input[15:0] FEEDBACK, IN1_16;
	output[15:0] notOut;
	wire[15:0] notOut;
	assign notOut = ~FEEDBACK;
endmodule

module OR(FEEDBACK, IN1_16,orOut);
	input[15:0] FEEDBACK, IN1_16;
	output[15:0] orOut;
	wire[15:0] orOut;
	assign orOut = FEEDBACK | IN1_16;
endmodule

module XNOR(FEEDBACK, IN1_16,xnorOut);
	input[15:0] FEEDBACK, IN1_16;
	output[15:0] xnorOut;
	wire[15:0] xnorOut;
	assign xnorOut = FEEDBACK ~^ IN1_16;
endmodule

module XOR(FEEDBACK, IN1_16,xorOut);
	input[15:0] FEEDBACK, IN1_16;
	output[15:0] xorOut;
	wire[15:0] xorOut;
	assign xorOut = FEEDBACK ^ IN1_16; 
endmodule

// ---End Of Logic Modules ---

module ALU (CLK, IN1_16, OP1_4, OUT1_32, OUT2_2);
	input CLK;
	input [15:0] IN1_16;   //16 bit input for modules
	input [3:0] OP1_4;     //command code
	output [31:0] OUT1_32; //32 bit output of breadboard
	output [1:0] OUT2_2;   //2 bit error code. Most significant bit represents divide by zero. Least significant represents overflow/underflow
	reg [1:0] OUT2_2;
	reg[31:0] OUT1_32;
	
	reg [31:0] newVal;
	wire [31:0] oldVal;
	
	//Local Variables
	//General
	wire[15:0] FEEDBACK;
	wire[31:0] outVal;
	
	//ADDSUB1_32
	wire[31:0] addSumOut;
	wire[1:0] addSumOut2;   //overflow error
	
	//Multiplier
	wire[31:0] multOut;
	
	//Divider
	wire[31:0] divOut;
	wire[1:0] divOut2;   //divide by zero error
	
	//Modulo
	wire[31:0] modOut;
	wire[1:0] modOut2;  //divide by zero error
	
	//Multiplexer
	wire[31:0] muxOut;
	
	//AND
	wire [15:0] andOut;
	
	//NAND
	wire[15:0] nandOut;

	//NOR
	wire[15:0] norOut;

	//NOT
	wire[15:0] notOut;

	//OR
	wire[15:0] orOut;

	//XNOR
	wire[15:0] xnorOut;

	//XOR
	wire[15:0] xorOut;
	
	//Modules
	// Prepare a 32-bit register of flip-flops
	DFFn_1 #(32) REG1_32(CLK, muxOut, outVal);

	//Arithmetic modules for input channels of multiplexor
	ADDSUB1_32 addsub(FEEDBACK, IN1_16, OP1_4, addSumOut, addSumOut2);  
	MULT1_32 mult(FEEDBACK, IN1_16, multOut);
	DIV1_32 div(FEEDBACK, IN1_16, divOut, divOut2);
	MOD1_32 mod(FEEDBACK, IN1_16, modOut, modOut2);
	
	//Logic Modules
	AND andMod(FEEDBACK, IN1_16, andOut);
	NAND nandMod(FEEDBACK, IN1_16, nandOut);
	NOR norMod(FEEDBACK, IN1_16, norOut);
	NOT notMod(FEEDBACK, IN1_16, notOut);
	OR orMod(FEEDBACK, IN1_16, orOut);
	XNOR xnorMod(FEEDBACK, IN1_16, xnorOut);
	XOR xorMod(FEEDBACK, IN1_16, xorOut);
	
	always @(*)
	begin
		if ((OP1_4 == 'b0001) || (OP1_4 == 'b0101) || (OP1_4 == 'b1110) || (OP1_4 == 'b1111))  //check if add/sub/div/mod
		begin
			OUT2_2 = addSumOut2 | divOut2 | modOut2;
		end
	end
	
	
	wire [15:0][31:0] channels;
	assign channels[0][31:0] = 32'd0; // OPCODE 0000  //reset
	assign channels[1][31:0] = addSumOut; // OPCODE 0001   Sum
	assign channels[2][31:0] = 'b111111111111111111111111111111111111111; // OPCODE 0010   //preset
	assign channels[3][31:0] = FEEDBACK; // OPCODE 0011   // NO-OP
	assign channels[5][31:0] = addSumOut; // OPCODE 0101   subtract
	assign channels[10][31:0] = multOut; // OPCODE 1010   multiply
	assign channels[14][31:0] = divOut; // OPCODE 1110   divide
	assign channels[15][31:0] = modOut; // OPCODE 1111   modulo
	
	
	//Assigning logic modules to channels
	assign channels[4][31:0] = andOut;
	assign channels[8][31:0] = nandOut;
	assign channels[9][31:0] = norOut;
	assign channels[7][31:0] = notOut;
	assign channels[6][31:0] = orOut;
	assign channels[12][31:0] = xnorOut;
	assign channels[11][31:0] = xorOut;
	
	wire [15:0] select;   //holds onehot select for multiplexor
	DEC1_16 dec(OP1_4, select);   //decoder to change command code to onehot
	MUX1_32 mux(channels, select, muxOut);   //multiplexor to output selected channel to muxOut
	
	assign FEEDBACK = outVal[15:0];  //assign lower 16 bits to FEEDBACK
	
	// reset error code on reset and preset
	always @(*)
	begin
		if ((OP1_4 == 'b0000) || (OP1_4 == 'b0011))   //check if reset or preset
		begin
			assign OUT2_2 = 'b00;   //reset error
		end
	end
	
	//Assigns output
	always @(*)  
	begin
	//-------------------------------------------------------------
	 
	 OUT1_32 = muxOut; //Next Value
	 newVal = OUT1_32;

	//-------------------------------------------------------------	   
	end

endmodule

// --- PlayableGrid ---
// 10 x 10 playable grid
// Only two bombs max at any time
// Each tile can take a value of:
// Empty : E  => 0
// P1 occupy : X => 1
// P2 occupy : Y => 2
// Destructible : D => 3
// wall : W => 4 
// bomb1 : B => 5
// bomb2 : B => 6
// Player 1 with bomb : J => 7
// Player 2 with bomb : K => 8 
// Explosion : C => 9
// P1_dead : O => 10
// P2_dead : O => 11
// END OF STATES
// May want to track bombs separately for timer
// 6 states => 4 bits
//DEFAULT STATE
/*
   0  0  3  0  0  0  3  0  0  0  
   0  4  4  0  0  0  0  4  4  0  
   3  4  0  4  3  0  4  0  4  3  
   0  0  0  3  3  3  0  0  0  0  
   0  3  4  0  3  0  4  3  3  0  
   0  0  0  4  0  4  0  0  0  0  
   0  0  0  4  0  4  0  0  0  0  
   0  0  4  0  0  0  4  0  0  0  
   0  0  0  0  0  0  0  0  0  0  
   0  0  0  0  0  0  0  0  0  0  
*/



// ---Calculate Grid ---
module calculateGrid(CLK, P1_action, P2_action,oldGrid, newGrid);
	input CLK;
	input[3:0] P1_action;
	input[3:0] P2_action;

	input[9:0][9:0][3:0] oldGrid;   // [x][y][value]   coordinate then state

	output[9:0][9:0][3:0] newGrid;
	reg[9:0][9:0][3:0] newGrid;
	reg[3:0] x;
	reg[3:0] y;
	
	reg[3:0] curState;
	
	//players coordinates
	reg[9:0] P1_x;
	reg[9:0] P1_y;
	reg[9:0] P2_x;
	reg[9:0] P2_y;
	
	//Bomb Coordinates
	reg[9:0] B1_x;
	reg[9:0] B1_y;
	reg[9:0] B2_x;
	reg[9:0] B2_y;
	
	//Bomb existence
	reg B1;
	reg B2;
	
	//bomb counters
	reg[2:0] B1Counter;
	reg[2:0] B2Counter;
	
	//for iterating grid
	reg[9:0][3:0] intermediate;
	
	
	//bomb actions
	always @(CLK)
	begin
		//initialize b1 counter or increment
		if(B1Counter === 3'bx || B1Counter === 'd3 || B1 !== 1)
			begin
				B1Counter = 0;
			end
		else
			begin
				B1Counter = B1Counter + 'd1;
			end
		
		//initialize b2 counter or increment
		if(B2Counter === 3'bx || B2Counter === 'd3 || B2 !== 1)
		
			begin
				B2Counter = 0;
			end
		else
			begin
				B2Counter = B2Counter + 'd1;
			end
	end
	
	//variables for checking bomb colliding with wall
	reg Bx1;
	reg By1;
	
	//end variables
	reg endGame;
	reg P1_died;
	reg P2_died;

	
		
	always @(*) 
	begin
		if(endGame !== 1)begin	//check if end
		//iterating through grid
		for (x = 0; x < 10; x = x + 1) begin//Open the code blook of the for loop
			intermediate = oldGrid[x];
			for(y = 0; y < 10; y = y + 1) begin
				curState = intermediate[y];
				if(curState === 'd1)begin	//p1 coordinate
					P1_x = x;
					P1_y = y;
				end
				if(curState === 'd2)begin	//p2 coordinate
					P2_x = x;
					P2_y = y;
				end
				
				if(curState === 'd5)begin	//B1 coordinate
					B1_x = x;
					B1_y = y;
					B1 = 1;
				end
				if(curState === 'd6)begin	//B2 coordinate
					B2_x = x;
					B2_y = y;
					B2 = 1;
				end
				if(curState === 'd9)begin	//finish explosion
					intermediate[y] = 'd0;
				end
			end	
			newGrid[x] = intermediate;
		end
		
		//conditionals
		//P1_action   
		//up
		if(P1_action === 'd0) begin
			if(P1_x -1 >= 0) begin
				intermediate = oldGrid[P1_x - 1];
				if(intermediate[P1_y] === 'd0) begin
					//move P1
					intermediate[P1_y] = 'd1;
					newGrid[P1_x - 1] = intermediate;
					//reset old space
					intermediate = oldGrid[P1_x];
					//Checking for bomb
					if(intermediate[P1_y] === 'd7) begin	//player 1 with bomb state
						intermediate[P1_y] = 'd5;			//bomb state
					end
					else begin
						intermediate[P1_y] = 'd0;
					end
					newGrid[P1_x] = intermediate;
					//set new coordinate
					P1_x = P1_x - 1;
				end
			end
		end
		
		//down
		if(P1_action === 'd1) begin
			if(P1_x + 1 <= 9) begin
				intermediate = oldGrid[P1_x + 1];
				if(intermediate[P1_y] === 'd0) begin
					//move P1
					intermediate[P1_y] = 'd1;
					newGrid[P1_x + 1] = intermediate;
					//reset old space
					intermediate = oldGrid[P1_x];
					//Checking for bomb
					if(intermediate[P1_y] === 'd7) begin	//player 1 with bomb state
						intermediate[P1_y] = 'd5;			//bomb state
					end
					else begin
						intermediate[P1_y] = 'd0;
					end
					newGrid[P1_x] = intermediate;
					//set new coordinate
					P1_x = P1_x + 1;
				end
			end
		end
		
		//left
		if(P1_action === 'd2) begin
			if(P1_y - 1 >= 0) begin
				intermediate = oldGrid[P1_x ];
				if(intermediate[P1_y - 1] === 'd0) begin
					//move P1
					intermediate[P1_y - 1] = 'd1;
					newGrid[P1_x] = intermediate;
					//reset old space
					intermediate = oldGrid[P1_x];
					//Checking for bomb
					if(intermediate[P1_y] === 'd7) begin	//player 1 with bomb state
						intermediate[P1_y] = 'd5;			//bomb state
					end
					else begin
						intermediate[P1_y] = 'd0;
					end
					newGrid[P1_x] = intermediate;
					//set new coordinate
					P1_y = P1_y - 1;
				end
			end
		end
		
		//right
		if(P1_action === 'd3) begin
			if(P1_y + 1 <= 9) begin
				intermediate = oldGrid[P1_x];
				if(intermediate[P1_y + 1] === 'd0) begin
					//move P1
					intermediate[P1_y + 1] = 'd1;
					newGrid[P1_x] = intermediate;
					//reset old space   HAVE TO CHECK FOR BOMB IN PREVIOUS SPOT
					intermediate = oldGrid[P1_x];
					//Checking for bomb
					if(intermediate[P1_y] === 'd7) begin	//player 1 with bomb state
						intermediate[P1_y] = 'd5;			//bomb state
					end
					else begin
						intermediate[P1_y] = 'd0;
					end
					
					newGrid[P1_x] = intermediate;
					//set new coordinate
					P1_y = P1_y + 1;
				end
			end
		end
		
		//bomb
		if(P1_action === 'd4 && B1Counter === 3'b0) begin	//if bomb action and no bombs on field
			intermediate = oldGrid[P1_x];
			intermediate[P1_y] = 'd7;		//player with bomb state
			newGrid[P1_x] = intermediate;
		end
		
		//P2 actions
		//up
		if(P2_action === 'd0) begin
			if(P2_x -1 >= 0) begin
				intermediate = oldGrid[P2_x - 1];
				if(intermediate[P2_y] === 'd0) begin
					//move P2
					intermediate[P2_y] = 'd2;
					newGrid[P2_x - 1] = intermediate;
					//reset old space
					intermediate = oldGrid[P2_x];
					//Checking for bomb
					if(intermediate[P2_y] === 'd8) begin	//player 1 with bomb state
						intermediate[P2_y] = 'd6;			//bomb state
					end
					else begin
						intermediate[P2_y] = 'd0;
					end
					newGrid[P2_x] = intermediate;
					//set new coordinate
					P2_x = P2_x - 1;
				end
			end
		end
		
		//down
		if(P2_action === 'd1) begin
			if(P2_x + 1 <= 9) begin
				intermediate = oldGrid[P2_x + 1];
				if(intermediate[P2_y] === 'd0) begin
					//move P2
					intermediate[P2_y] = 'd2;
					newGrid[P2_x + 1] = intermediate;
					//reset old space
					intermediate = oldGrid[P2_x];
					//Checking for bomb
					if(intermediate[P2_y] === 'd8) begin	//player 1 with bomb state
						intermediate[P2_y] = 'd6;			//bomb state
					end
					else begin
						intermediate[P2_y] = 'd0;
					end
					newGrid[P2_x] = intermediate;
					//set new coordinate
					P2_x = P2_x + 1;
				end
			end
		end
		
		//left
		if(P2_action === 'd2) begin
			if(P2_y - 1 >= 0) begin
				intermediate = oldGrid[P2_x ];
				if(intermediate[P2_y - 1] === 'd0) begin
					//move P2
					intermediate[P2_y - 1] = 'd2;
					newGrid[P2_x] = intermediate;
					//reset old space
					intermediate = oldGrid[P2_x];
					//Checking for bomb
					if(intermediate[P2_y] === 'd8) begin	//player 1 with bomb state
						intermediate[P2_y] = 'd6;			//bomb state
					end
					else begin
						intermediate[P2_y] = 'd0;
					end
					newGrid[P2_x] = intermediate;
					//set new coordinate
					P2_y = P2_y - 1;
				end
			end
		end
		
		//right
		if(P2_action === 'd3) begin
			if(P2_y + 1 <= 9) begin
				intermediate = oldGrid[P2_x];
				if(intermediate[P2_y + 1] === 'd0) begin
					//move P2
					intermediate[P2_y + 1] = 'd2;
					newGrid[P2_x] = intermediate;
					//reset old space  
					intermediate = oldGrid[P2_x];
					//Checking for bomb
					if(intermediate[P2_y] === 'd8) begin	//player 2 with bomb state
						intermediate[P2_y] = 'd6;			//bomb state
					end
					else begin
						intermediate[P2_y] = 'd0;
					end
					
					newGrid[P2_x] = intermediate;
					//set new coordinate
					P2_y = P2_y + 1;
				end
			end
		end
		
		//bomb
		if(P2_action === 'd4 && B2Counter === 3'b0) begin	//if bomb action and no bombs on field
			intermediate = oldGrid[P2_x];
			intermediate[P2_y] = 'd8;		//player with bomb state
			newGrid[P2_x] = intermediate;
		end
		
		//bomb actions
		if(B1 && B1Counter === 'd3)begin
			
			//adding explosion within bound
			if(B1_x + 1 <= 9) begin
				intermediate = oldGrid[B1_x + 1];
				if(intermediate[B1_y] === 'd4 || intermediate[B1_y] === 'd6) begin	//hit wall or bomb
					Bx1 = 0;
				end
				else begin
					intermediate[B1_y] = 'd9;		//Explosion state
					newGrid[B1_x + 1] = intermediate;
					Bx1 = 1;
				end
				
				if(P1_x === (B1_x + 1) && P1_y === B1_y)begin	//player died
					intermediate[B1_y] = 'd10;		//player 1 died state
					newGrid[B1_x + 1] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === (B1_x + 1) && P2_y === B1_y)begin	//player died
					intermediate[B1_y] = 'd11;		//player 2 died state
					newGrid[B1_x + 1] = intermediate;
					P2_died = 1;
				end
				
			end
			if(B1_x + 2 <= 9 && Bx1 === 1) begin
				intermediate = oldGrid[B1_x + 2];
				if(intermediate[B1_y] === 'd4 || intermediate[B1_y] === 'd6) begin	//hit wall or bomb
				end
				else begin
					intermediate[B1_y] = 'd9;		//Explosion state
					newGrid[B1_x + 2] = intermediate;
				end
				
				if(P1_x === (B1_x + 2) && P1_y === B1_y)begin	//player died
					intermediate[B1_y] = 'd10;		//player 1 died state
					newGrid[B1_x + 2] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === (B1_x + 2) && P2_y === B1_y)begin	//player died
					intermediate[B1_y] = 'd11;		//player 2 died state
					newGrid[B1_x + 2] = intermediate;
					P2_died = 1;
				end
				
			end
			if(B1_x - 1 >= 0) begin
				intermediate = oldGrid[B1_x - 1];
				if(intermediate[B1_y] === 'd4 || intermediate[B1_y] === 'd6) begin	//hit wall or bomb
					Bx1 = 0;
				end
				else begin
					intermediate[B1_y] = 'd9;		//Explosion state
					newGrid[B1_x - 1] = intermediate;
					Bx1 = 1;
				end
				
				if(P1_x === (B1_x - 1) && P1_y === B1_y)begin	//player died
					intermediate[B1_y] = 'd10;		//player 1 died state
					newGrid[B1_x - 1] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === (B1_x - 1) && P2_y === B1_y)begin	//player died
					intermediate[B1_y] = 'd11;		//player 2 died state
					newGrid[B1_x - 1] = intermediate;
					P2_died = 1;
				end
				
			end
			if(B1_x - 2 >= 0 && Bx1 === 1) begin
				intermediate = oldGrid[B1_x - 2];
				if(intermediate[B1_y] === 'd4  || intermediate[B1_y] === 'd6) begin	//hit wall or bomb
				end
				else begin
					intermediate[B1_y] = 'd9;		//Explosion state
					newGrid[B1_x - 2] = intermediate;
				end
				
				if(P1_x === (B1_x - 2) && P1_y === B1_y)begin	//player died
					intermediate[B1_y] = 'd10;		//player 1 died state
					newGrid[B1_x - 2] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === (B1_x - 2) && P2_y === B1_y)begin	//player died
					intermediate[B1_y] = 'd11;		//player 2 died state
					newGrid[B1_x - 2] = intermediate;
					P2_died = 1;
				end
			end
			if(B1_y + 1 <= 9) begin
				intermediate = oldGrid[B1_x ];
				if(intermediate[B1_y + 1] === 'd4 || intermediate[B1_y + 1] === 'd4) begin	//hit wall or bomb
					By1 = 0;
				end
				else begin
					intermediate[B1_y + 1] = 'd9;		//Explosion state
					newGrid[B1_x ] = intermediate;
					By1 = 1;
				end
				
				if(P1_x === B1_x && P1_y === (B1_y + 1))begin	//player died
					intermediate[B1_y + 1] = 'd10;		//player 1 died state
					newGrid[B1_x] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === B1_x && P2_y === (B1_y + 1))begin	//player died
					intermediate[B1_y + 1] = 'd11;		//player 2 died state
					newGrid[B1_x] = intermediate;
					P2_died = 1;
				end
				
			end
			if(B1_y + 2 <= 9 && By1 === 1) begin
				intermediate = oldGrid[B1_x ];
				if(intermediate[B1_y + 2] === 'd4 || intermediate[B1_y + 2] === 'd6) begin	//hit wall or bomb
				end
				else begin
					intermediate[B1_y + 2] = 'd9;		//Explosion state
					newGrid[B1_x ] = intermediate;
				end
				
				if(P1_x === B1_x && P1_y === (B1_y + 2))begin	//player died
					intermediate[B1_y + 2] = 'd10;		//player 1 died state
					newGrid[B1_x] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === B1_x && P2_y === (B1_y + 2))begin	//player died
					intermediate[B1_y + 2] = 'd11;		//player 2 died state
					newGrid[B1_x] = intermediate;
					P2_died = 1;
				end
			end
			if(B1_y - 1 >= 0) begin
				intermediate = oldGrid[B1_x ];
				if(intermediate[B1_y - 1] === 'd4 || intermediate[B1_y - 1] === 'd6) begin	//hit wall or bomb
					By1 = 0;
				end
				else begin
					intermediate[B1_y - 1] = 'd9;		//Explosion state
					newGrid[B1_x ] = intermediate;
					By1 = 1;
				end
				
				if(P1_x === B1_x && P1_y === (B1_y - 1))begin	//player died
					intermediate[B1_y - 1] = 'd10;		//player 1 died state
					newGrid[B1_x] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === B1_x && P2_y === (B1_y - 1))begin	//player died
					intermediate[B1_y - 1] = 'd11;		//player 2 died state
					newGrid[B1_x] = intermediate;
					P2_died = 1;
				end
				
			end
			if(B1_y - 2 >= 0 && By1) begin
				intermediate = oldGrid[B1_x];
				if(intermediate[B1_y - 2] === 'd4 || intermediate[B1_y - 2] === 'd6) begin	//hit wall or bomb
				end
				else begin
					intermediate[B1_y - 2] = 'd9;		//Explosion state
					newGrid[B1_x ] = intermediate;
				end
				
				if(P1_x === B1_x && P1_y === (B1_y - 2))begin	//player died
					intermediate[B1_y - 2] = 'd10;		//player 1 died state
					newGrid[B1_x] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === B1_x && P2_y === (B1_y - 2))begin	//player died
					intermediate[B1_y - 2] = 'd11;		//player 2 died state
					newGrid[B1_x] = intermediate;
					P2_died = 1;
				end
				
			end
			intermediate = oldGrid[B1_x];
			intermediate[B1_y] = 'd9;		//Explosion state
			newGrid[B1_x] = intermediate;
			
			if(P1_x === B1_x && P1_y === B1_y)begin	//player died
				intermediate[B1_y] = 'd10;		//player 1 died state
				newGrid[B1_x] = intermediate;
				P1_died = 1;
			end
				
			if(P2_x === B1_x && P2_y === B1_y)begin	//player died
				intermediate[B1_y ] = 'd11;		//player 2 died state
				newGrid[B1_x] = intermediate;
				P2_died = 1;
			end
			

		end
		
		//bomb 2
		if(B2 && B2Counter === 'd3)begin
			
			//adding explosion within bound
			if(B2_x + 1 <= 9) begin
				intermediate = oldGrid[B2_x + 1];
				if(intermediate[B2_y] === 'd4 || intermediate[B2_y] === 'd5) begin	//hit wall or bomb
					Bx1 = 0;
				end
				else begin
					intermediate[B2_y] = 'd9;		//Explosion state
					newGrid[B2_x + 1] = intermediate;
					Bx1 = 1;
				end
				
				if(P1_x === (B2_x + 1) && P1_y === B2_y)begin	//player died
					intermediate[B2_y] = 'd10;		//player 1 died state
					newGrid[B2_x + 1] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === (B2_x + 1) && P2_y === B2_y)begin	//player died
					intermediate[B2_y] = 'd11;		//player 2 died state
					newGrid[B2_x + 1] = intermediate;
					P2_died = 1;
				end
				
			end
			if(B2_x + 2 <= 9 && Bx1 === 1) begin
				intermediate = oldGrid[B2_x + 2];
				if(intermediate[B2_y] === 'd4 || intermediate[B2_y] === 'd5) begin	//hit wall or bomb
				end
				else begin
					intermediate[B2_y] = 'd9;		//Explosion state
					newGrid[B2_x + 2] = intermediate;
				end
				
				if(P1_x === (B2_x + 2) && P1_y === B2_y)begin	//player died
					intermediate[B2_y] = 'd10;		//player 1 died state
					newGrid[B2_x + 2] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === (B2_x + 2) && P2_y === B2_y)begin	//player died
					intermediate[B2_y] = 'd11;		//player 2 died state
					newGrid[B2_x + 2] = intermediate;
					P2_died = 1;
				end
				
			end
			if(B2_x - 1 >= 0) begin
				intermediate = oldGrid[B2_x - 1];
				if(intermediate[B2_y] === 'd4 || intermediate[B2_y] === 'd5) begin	//hit wall or bomb
					Bx1 = 0;
				end
				else begin
					intermediate[B2_y] = 'd9;		//Explosion state
					newGrid[B2_x - 1] = intermediate;
					Bx1 = 1;
				end
				
				if(P1_x === (B2_x - 1) && P1_y === B2_y)begin	//player died
					intermediate[B2_y] = 'd10;		//player 1 died state
					newGrid[B2_x - 1] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === (B2_x - 1) && P2_y === B2_y)begin	//player died
					intermediate[B2_y] = 'd11;		//player 2 died state
					newGrid[B2_x - 1] = intermediate;
					P2_died = 1;
				end
				
			end
			if(B2_x - 2 >= 0 && Bx1 === 1) begin
				intermediate = oldGrid[B2_x - 2];
				if(intermediate[B2_y] === 'd4  || intermediate[B2_y] === 'd5) begin	//hit wall or bomb
				end
				else begin
					intermediate[B2_y] = 'd9;		//Explosion state
					newGrid[B2_x - 2] = intermediate;
				end
				
				if(P1_x === (B2_x - 2) && P1_y === B2_y)begin	//player died
					intermediate[B2_y] = 'd10;		//player 1 died state
					newGrid[B2_x - 2] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === (B2_x - 2) && P2_y === B2_y)begin	//player died
					intermediate[B2_y] = 'd11;		//player 2 died state
					newGrid[B2_x - 2] = intermediate;
					P2_died = 1;
				end
			end
			if(B2_y + 1 <= 9) begin
				intermediate = oldGrid[B2_x ];
				if(intermediate[B2_y + 1] === 'd4 || intermediate[B2_y + 1] === 'd5) begin	//hit wall or bomb
					By1 = 0;
				end
				else begin
					intermediate[B2_y + 1] = 'd9;		//Explosion state
					newGrid[B2_x ] = intermediate;
					By1 = 1;
				end
				
				if(P1_x === B2_x && P1_y === (B2_y + 1))begin	//player died
					intermediate[B2_y + 1] = 'd10;		//player 1 died state
					newGrid[B2_x] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === B2_x && P2_y === (B2_y + 1))begin	//player died
					intermediate[B2_y + 1] = 'd11;		//player 2 died state
					newGrid[B2_x] = intermediate;
					P2_died = 1;
				end
				
			end
			if(B2_y + 2 <= 9 && By1 === 1) begin
				intermediate = oldGrid[B2_x ];
				if(intermediate[B2_y + 2] === 'd4 || intermediate[B2_y + 2] === 'd5) begin	//hit wall or bomb
				end
				else begin
					intermediate[B2_y + 2] = 'd9;		//Explosion state
					newGrid[B2_x ] = intermediate;
				end
				
				if(P1_x === B2_x && P1_y === (B2_y + 2))begin	//player died
					intermediate[B2_y + 2] = 'd10;		//player 1 died state
					newGrid[B2_x] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === B2_x && P2_y === (B2_y + 2))begin	//player died
					intermediate[B2_y + 2] = 'd11;		//player 2 died state
					newGrid[B2_x] = intermediate;
					P2_died = 1;
				end
			end
			if(B2_y - 1 >= 0) begin
				intermediate = oldGrid[B2_x ];
				if(intermediate[B2_y - 1] === 'd4 || intermediate[B2_y - 1] === 'd5) begin	//hit wall or bomb
					By1 = 0;
				end
				else begin
					intermediate[B2_y - 1] = 'd9;		//Explosion state
					newGrid[B2_x ] = intermediate;
					By1 = 1;
				end
				
				if(P1_x === B2_x && P1_y === (B2_y - 1))begin	//player died
					intermediate[B2_y - 1] = 'd10;		//player 1 died state
					newGrid[B2_x] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === B2_x && P2_y === (B2_y - 1))begin	//player died
					intermediate[B2_y - 1] = 'd11;		//player 2 died state
					newGrid[B2_x] = intermediate;
					P2_died = 1;
				end
				
			end
			if(B2_y - 2 >= 0 && By1) begin
				intermediate = oldGrid[B2_x];
				if(intermediate[B2_y - 2] === 'd4 || intermediate[B2_y - 2] === 'd5) begin	//hit wall
				end
				else begin
					intermediate[B2_y - 2] = 'd9;		//Explosion state
					newGrid[B2_x ] = intermediate;
				end
				
				if(P1_x === B2_x && P1_y === (B2_y - 2))begin	//player died
					intermediate[B2_y - 2] = 'd10;		//player 1 died state
					newGrid[B2_x] = intermediate;
					P1_died = 1;
				end
				
				if(P2_x === B2_x && P2_y === (B2_y - 2))begin	//player died
					intermediate[B2_y - 2] = 'd11;		//player 2 died state
					newGrid[B2_x] = intermediate;
					P2_died = 1;
				end
				
			end
			intermediate = oldGrid[B2_x];
			intermediate[B2_y] = 'd9;		//Explosion state
			newGrid[B2_x] = intermediate;
			
			if(P1_x === B2_x && P1_y === B2_y)begin	//player died
				intermediate[B2_y] = 'd10;		//player 1 died state
				newGrid[B2_x] = intermediate;
				P1_died = 1;
			end
				
			if(P2_x === B2_x && P2_y === B2_y)begin	//player died
				intermediate[B2_y ] = 'd11;		//player 2 died state
				newGrid[B2_x] = intermediate;
				P2_died = 1;
			end
			

		end

			//check end of game
			if(P1_died && P2_died)begin
				$display("NO ONE WINS!!!");
				endGame = 1;
			end
			else if(P1_died) begin
				$display("Player 2 wins!!!");
				endGame = 1;
			end
			else if(P2_died) begin
				$display("Player 1 wins!!!");
				endGame = 1;
			end
		//reset
		if(B1 !== 1)begin
			B1 = 0;
		end
		if(B2 !== 1)begin
			B2 = 0;
		end
		end
		else begin	//game ended
			$display("Game has ended!");
		end
	end	//end of code block
	 
endmodule


module Breadboard (CLK, P1_action, P2_action, reset);
	input CLK;
		
	
	input [3:0] reset;
	
	//Local Variables
	
	//GRID
	input[3:0] P1_action;
	input[3:0] P2_action;
	reg[9:0][9:0][3:0] oldGrid;
	
	 
	wire [9:0][9:0][3:0] newGrid;
	

	
	//timer 
	wire[15:0] timer_in;
	assign timer_in = 'd1;
	reg[3:0] OP1_4;
	wire [31:0] OUT1_32;
	wire[1:0]OUT2_2;
	
	ALU timer(CLK, timer_in, OP1_4, OUT1_32, OUT2_2);
	
	calculateGrid tester(CLK, P1_action, P2_action, oldGrid, newGrid);

	always @(*) begin
	
		if(reset === 'd1) begin
			assign OP1_4 = 0;
			assign oldGrid = 0;
			//Default Grid
			assign oldGrid[0][0] = 'd1;
			assign oldGrid[9][9] = 'd2;
			
            //Destructible ==> May want to remove for now
            assign oldGrid[0][2] = 'd3;
            assign oldGrid[0][7] = 'd3;
            
            assign oldGrid[2][0] = 'd3;
            assign oldGrid[2][4] = 'd3;
            assign oldGrid[2][9] = 'd3;
            
            assign oldGrid[3][3] = 'd3;
            assign oldGrid[3][4] = 'd3;
            assign oldGrid[3][5] = 'd3;
            
            assign oldGrid[4][1] = 'd3;
            assign oldGrid[4][4] = 'd3;
            assign oldGrid[4][7] = 'd3;
            assign oldGrid[4][8] = 'd3;
            
            assign oldGrid[7][0] = 'd3;
            assign oldGrid[7][4] = 'd3;
            assign oldGrid[7][9] = 'd3;
            
            assign oldGrid[9][2] = 'd3;
            assign oldGrid[9][7] = 'd3;

            
            //WALLS
            assign oldGrid[1][1] = 'd4;
            assign oldGrid[1][2] = 'd4;
            assign oldGrid[1][7] = 'd4;
            assign oldGrid[1][8] = 'd4;
            
            assign oldGrid[2][1] = 'd4;
            assign oldGrid[2][3] = 'd4;
            assign oldGrid[2][6] = 'd4;
            assign oldGrid[2][8] = 'd4;
            
            assign oldGrid[4][2] = 'd4 ; 
            assign oldGrid[4][6] = 'd4 ;
            
            assign oldGrid[5][3] = 'd4 ;
            assign oldGrid[5][5] = 'd4 ;
            
            assign oldGrid[6][3] = 'd4 ;
            assign oldGrid[6][5] = 'd4 ;
            
            assign oldGrid[7][1] = 'd4;
            assign oldGrid[7][3] = 'd4;
            assign oldGrid[7][6] = 'd4;
            assign oldGrid[7][8] = 'd4;
            
            assign oldGrid[8][1] = 'd4;
            assign oldGrid[8][2] = 'd4;
            assign oldGrid[8][7] = 'd4;
            assign oldGrid[8][8] = 'd4;
			
			
		end
		else begin
			assign oldGrid = newGrid;
		end
	end

endmodule


module testbench();
	reg [15:0] IN1_16;
	reg [3:0]  OP1_4;
	reg[3:0] P1_action;
	reg[3:0] P2_action;
	reg[3:0] reset;
	reg [9:0][9:0][3:0] grid;
	wire [31:0] OUT1_32;
	wire [1:0] OUT2_2;
	// Prepare a clock which flips every 40 units of time
	reg CLK ;
	reg[3:0] timer;
  initial
	begin
	timer = 0;
 			forever
				begin
					CLK=0;
					timer = timer + 1;
					//counter = counter + 1;
					#10;
					//$display("CLK:%b, Register:%b",CLK,zap.outVal);   //for checking clock
					#10;
					CLK=1;
					#10;  
					//$display("CLK:%b, Register:%b",CLK,zap.outVal);	//for checking clock			
					#10;
				end
	end
	
	reg[9:0] a;
	reg[9:0][3:0] intermediate;
	reg[9:0] b;
	
	reg[1:0] test;
	
	Breadboard zap(CLK,P1_action, P2_action, reset);
	always @(*)
	 begin
		assign grid = 'd0;
		assign grid[1][0] = 'd1;
		assign reset = 'd1;
		//$display("Timer:%d", timer);
		if(timer === 'd1) begin
			$display();
		end

		$display("RESET");
		#10
		//reset check
		
		for(a = 0; a < 10; a++)
		begin
			intermediate = zap.newGrid[a];
			for(b = 0; b < 10; b++)
			begin
			
				if(intermediate[b] === 'd0) begin
					$write(" E " );
				end
				if(intermediate[b] === 'd1) begin
					$write(" X " );
				end
				if(intermediate[b] === 'd2) begin
					$write(" Y " );
				end
				if(intermediate[b] === 'd3) begin
					$write(" D ");
				end
				if(intermediate[b] === 'd4) begin
					$write(" W " );
				end
				if(intermediate[b] === 'd5) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd6) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd7) begin
					$write(" J ");
				end
				if(intermediate[b] === 'd8) begin
					$write(" K " );
				end
				if(intermediate[b] === 'd9) begin
					$write(" C " );
				end
				if(intermediate[b] === 'd10) begin
					$write(" O " );
				end
				if(intermediate[b] === 'd11) begin
					$write(" O " );
				end
				//$write("%d " , intermediate[b]);
			end
			$display();
		end
		assign reset = 'd0;
		
/////////////////////-------------------- BOTH PLAYERS MOVE --------------------------////
		$display();
		$display("Player 1 moving down");
		$display("Player 2 moving up");
		assign P1_action = 'd1;
		assign P2_action = 'd0;
		#10
		for(a = 0; a < 10; a++)
		begin
			intermediate = zap.newGrid[a];
			for(b = 0; b < 10; b++)
			begin
			
				if(intermediate[b] === 'd0) begin
					$write(" E " );
				end
				if(intermediate[b] === 'd1) begin
					$write(" X " );
				end
				if(intermediate[b] === 'd2) begin
					$write(" Y " );
				end
				if(intermediate[b] === 'd3) begin
					$write(" D ");
				end
				if(intermediate[b] === 'd4) begin
					$write(" W " );
				end
				if(intermediate[b] === 'd5) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd6) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd7) begin
					$write(" J ");
				end
				if(intermediate[b] === 'd8) begin
					$write(" K " );
				end
				if(intermediate[b] === 'd9) begin
					$write(" C " );
				end
				if(intermediate[b] === 'd10) begin
					$write(" O " );
				end
				if(intermediate[b] === 'd11) begin
					$write(" O " );
				end
				//$write("%d " , intermediate[b]);
			end
			$display();
		end
		
		$display();
		$display("Player 1 moving up");
		$display("Player 2 moving down");
		assign P1_action = 'd0;
		assign P2_action = 'd1;
		#10
				for(a = 0; a < 10; a++)
		begin
			intermediate = zap.newGrid[a];
			for(b = 0; b < 10; b++)
			begin
			
				if(intermediate[b] === 'd0) begin
					$write(" E " );
				end
				if(intermediate[b] === 'd1) begin
					$write(" X " );
				end
				if(intermediate[b] === 'd2) begin
					$write(" Y " );
				end
				if(intermediate[b] === 'd3) begin
					$write(" D ");
				end
				if(intermediate[b] === 'd4) begin
					$write(" W " );
				end
				if(intermediate[b] === 'd5) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd6) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd7) begin
					$write(" J ");
				end
				if(intermediate[b] === 'd8) begin
					$write(" K " );
				end
				if(intermediate[b] === 'd9) begin
					$write(" C " );
				end
				if(intermediate[b] === 'd10) begin
					$write(" O " );
				end
				if(intermediate[b] === 'd11) begin
					$write(" O " );
				end
				//$write("%d " , intermediate[b]);
			end
			$display();
		end
		
		$display();
		$display("Player 1 moving right");
		$display("Player 2 moving left");
		assign P1_action = 'd3;
		assign P2_action = 'd2;
		#10
				for(a = 0; a < 10; a++)
		begin
			intermediate = zap.newGrid[a];
			for(b = 0; b < 10; b++)
			begin
			
				if(intermediate[b] === 'd0) begin
					$write(" E " );
				end
				if(intermediate[b] === 'd1) begin
					$write(" X " );
				end
				if(intermediate[b] === 'd2) begin
					$write(" Y " );
				end
				if(intermediate[b] === 'd3) begin
					$write(" D ");
				end
				if(intermediate[b] === 'd4) begin
					$write(" W " );
				end
				if(intermediate[b] === 'd5) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd6) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd7) begin
					$write(" J ");
				end
				if(intermediate[b] === 'd8) begin
					$write(" K " );
				end
				if(intermediate[b] === 'd9) begin
					$write(" C " );
				end
				if(intermediate[b] === 'd10) begin
					$write(" O " );
				end
				if(intermediate[b] === 'd11) begin
					$write(" O " );
				end
				//$write("%d " , intermediate[b]);
			end
			$display();
		end
		
		$display();
		$display("Player 1 moving left");
		$display("Player 2 moving right");
		assign P1_action = 'd2;
		assign P2_action = 'd3;
		#10
				for(a = 0; a < 10; a++)
		begin
			intermediate = zap.newGrid[a];
			for(b = 0; b < 10; b++)
			begin
			
				if(intermediate[b] === 'd0) begin
					$write(" E " );
				end
				if(intermediate[b] === 'd1) begin
					$write(" X " );
				end
				if(intermediate[b] === 'd2) begin
					$write(" Y " );
				end
				if(intermediate[b] === 'd3) begin
					$write(" D ");
				end
				if(intermediate[b] === 'd4) begin
					$write(" W " );
				end
				if(intermediate[b] === 'd5) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd6) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd7) begin
					$write(" J ");
				end
				if(intermediate[b] === 'd8) begin
					$write(" K " );
				end
				if(intermediate[b] === 'd9) begin
					$write(" C " );
				end
				if(intermediate[b] === 'd10) begin
					$write(" O " );
				end
				if(intermediate[b] === 'd11) begin
					$write(" O " );
				end
				//$write("%d " , intermediate[b]);
			end
			$display();
		end
		
		$display();
		$display("Player 1 placing bomb");
		$display("Player 2 placing bomb");
		assign P1_action = 'd4;
		assign P2_action = 'd4;
		#10
				for(a = 0; a < 10; a++)
		begin
			intermediate = zap.newGrid[a];
			for(b = 0; b < 10; b++)
			begin
			
				if(intermediate[b] === 'd0) begin
					$write(" E " );
				end
				if(intermediate[b] === 'd1) begin
					$write(" X " );
				end
				if(intermediate[b] === 'd2) begin
					$write(" Y " );
				end
				if(intermediate[b] === 'd3) begin
					$write(" D ");
				end
				if(intermediate[b] === 'd4) begin
					$write(" W " );
				end
				if(intermediate[b] === 'd5) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd6) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd7) begin
					$write(" J ");
				end
				if(intermediate[b] === 'd8) begin
					$write(" K " );
				end
				if(intermediate[b] === 'd9) begin
					$write(" C " );
				end
				if(intermediate[b] === 'd10) begin
					$write(" O " );
				end
				if(intermediate[b] === 'd11) begin
					$write(" O " );
				end
				//$write("%d " , intermediate[b]);
			end
			$display();
		end
		
		$display();
		$display("Player 1 moving down");
		$display("Player 2 moving up");
		assign P1_action = 'd1;
		assign P2_action = 'd0;
		#10
				for(a = 0; a < 10; a++)
		begin
			intermediate = zap.newGrid[a];
			for(b = 0; b < 10; b++)
			begin
			
				if(intermediate[b] === 'd0) begin
					$write(" E " );
				end
				if(intermediate[b] === 'd1) begin
					$write(" X " );
				end
				if(intermediate[b] === 'd2) begin
					$write(" Y " );
				end
				if(intermediate[b] === 'd3) begin
					$write(" D ");
				end
				if(intermediate[b] === 'd4) begin
					$write(" W " );
				end
				if(intermediate[b] === 'd5) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd6) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd7) begin
					$write(" J ");
				end
				if(intermediate[b] === 'd8) begin
					$write(" K " );
				end
				if(intermediate[b] === 'd9) begin
					$write(" C " );
				end
				if(intermediate[b] === 'd10) begin
					$write(" O " );
				end
				if(intermediate[b] === 'd11) begin
					$write(" O " );
				end
				//$write("%d " , intermediate[b]);
			end
			$display();
		end
		
		$display();
		$display("Player 1 moving up");
		$display("Player 2 moving down");
		assign P1_action = 'd0;
		assign P2_action = 'd1;
		#10
				for(a = 0; a < 10; a++)
		begin
			intermediate = zap.newGrid[a];
			for(b = 0; b < 10; b++)
			begin
			
				if(intermediate[b] === 'd0) begin
					$write(" E " );
				end
				if(intermediate[b] === 'd1) begin
					$write(" X " );
				end
				if(intermediate[b] === 'd2) begin
					$write(" Y " );
				end
				if(intermediate[b] === 'd3) begin
					$write(" D ");
				end
				if(intermediate[b] === 'd4) begin
					$write(" W " );
				end
				if(intermediate[b] === 'd5) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd6) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd7) begin
					$write(" J ");
				end
				if(intermediate[b] === 'd8) begin
					$write(" K " );
				end
				if(intermediate[b] === 'd9) begin
					$write(" C " );
				end
				if(intermediate[b] === 'd10) begin
					$write(" O " );
				end
				if(intermediate[b] === 'd11) begin
					$write(" O " );
				end
				//$write("%d " , intermediate[b]);
			end
			$display();
		end
		
		$display();
		$display("Player 1 moving right");
		$display("Player 2 moving left");
		assign P1_action = 'd3;
		assign P2_action = 'd2;
		#10
				for(a = 0; a < 10; a++)
		begin
			intermediate = zap.newGrid[a];
			for(b = 0; b < 10; b++)
			begin
			
				if(intermediate[b] === 'd0) begin
					$write(" E " );
				end
				if(intermediate[b] === 'd1) begin
					$write(" X " );
				end
				if(intermediate[b] === 'd2) begin
					$write(" Y " );
				end
				if(intermediate[b] === 'd3) begin
					$write(" D ");
				end
				if(intermediate[b] === 'd4) begin
					$write(" W " );
				end
				if(intermediate[b] === 'd5) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd6) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd7) begin
					$write(" J ");
				end
				if(intermediate[b] === 'd8) begin
					$write(" K " );
				end
				if(intermediate[b] === 'd9) begin
					$write(" C " );
				end
				if(intermediate[b] === 'd10) begin
					$write(" O " );
				end
				if(intermediate[b] === 'd11) begin
					$write(" O " );
				end
				//$write("%d " , intermediate[b]);
			end
			$display();
		end
		
		$display();
		$display("Player 1 moving left");
		$display("Player 2 moving right");
		assign P1_action = 'd2;
		assign P2_action = 'd3;
		#10
				for(a = 0; a < 10; a++)
		begin
			intermediate = zap.newGrid[a];
			for(b = 0; b < 10; b++)
			begin
			
				if(intermediate[b] === 'd0) begin
					$write(" E " );
				end
				if(intermediate[b] === 'd1) begin
					$write(" X " );
				end
				if(intermediate[b] === 'd2) begin
					$write(" Y " );
				end
				if(intermediate[b] === 'd3) begin
					$write(" D ");
				end
				if(intermediate[b] === 'd4) begin
					$write(" W " );
				end
				if(intermediate[b] === 'd5) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd6) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd7) begin
					$write(" J ");
				end
				if(intermediate[b] === 'd8) begin
					$write(" K " );
				end
				if(intermediate[b] === 'd9) begin
					$write(" C " );
				end
				if(intermediate[b] === 'd10) begin
					$write(" O " );
				end
				if(intermediate[b] === 'd11) begin
					$write(" O " );
				end
				//$write("%d " , intermediate[b]);
			end
			$display();
		end
		
		$display();
		$display("Player 1 placing bomb");
		$display("Player 2 placing bomb");
		assign P1_action = 'd4;
		assign P2_action = 'd4;
		#10
				for(a = 0; a < 10; a++)
		begin
			intermediate = zap.newGrid[a];
			for(b = 0; b < 10; b++)
			begin
			
				if(intermediate[b] === 'd0) begin
					$write(" E " );
				end
				if(intermediate[b] === 'd1) begin
					$write(" X " );
				end
				if(intermediate[b] === 'd2) begin
					$write(" Y " );
				end
				if(intermediate[b] === 'd3) begin
					$write(" D ");
				end
				if(intermediate[b] === 'd4) begin
					$write(" W " );
				end
				if(intermediate[b] === 'd5) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd6) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd7) begin
					$write(" J ");
				end
				if(intermediate[b] === 'd8) begin
					$write(" K " );
				end
				if(intermediate[b] === 'd9) begin
					$write(" C " );
				end
				if(intermediate[b] === 'd10) begin
					$write(" O " );
				end
				if(intermediate[b] === 'd11) begin
					$write(" O " );
				end
				//$write("%d " , intermediate[b]);
			end
			$display();
		end
		
		$display();
		$display("Waiting for explosion");
		#10
		for(a = 0; a < 10; a++)
		begin
			intermediate = zap.newGrid[a];
			for(b = 0; b < 10; b++)
			begin
			
				if(intermediate[b] === 'd0) begin
					$write(" E " );
				end
				if(intermediate[b] === 'd1) begin
					$write(" X " );
				end
				if(intermediate[b] === 'd2) begin
					$write(" Y " );
				end
				if(intermediate[b] === 'd3) begin
					$write(" D ");
				end
				if(intermediate[b] === 'd4) begin
					$write(" W " );
				end
				if(intermediate[b] === 'd5) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd6) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd7) begin
					$write(" J ");
				end
				if(intermediate[b] === 'd8) begin
					$write(" K " );
				end
				if(intermediate[b] === 'd9) begin
					$write(" C " );
				end
				if(intermediate[b] === 'd10) begin
					$write(" O " );
				end
				if(intermediate[b] === 'd11) begin
					$write(" O " );
				end
				//$write("%d " , intermediate[b]);
			end
			$display();
		end
		
		$display();
		$display("Explosion");
		#10
		for(a = 0; a < 10; a++)
		begin
			intermediate = zap.newGrid[a];
			for(b = 0; b < 10; b++)
			begin
			
				if(intermediate[b] === 'd0) begin
					$write(" E " );
				end
				if(intermediate[b] === 'd1) begin
					$write(" X " );
				end
				if(intermediate[b] === 'd2) begin
					$write(" Y " );
				end
				if(intermediate[b] === 'd3) begin
					$write(" D ");
				end
				if(intermediate[b] === 'd4) begin
					$write(" W " );
				end
				if(intermediate[b] === 'd5) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd6) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd7) begin
					$write(" J ");
				end
				if(intermediate[b] === 'd8) begin
					$write(" K " );
				end
				if(intermediate[b] === 'd9) begin
					$write(" C " );
				end
				if(intermediate[b] === 'd10) begin
					$write(" O " );
				end
				if(intermediate[b] === 'd11) begin
					$write(" O " );
				end
				//$write("%d " , intermediate[b]);
			end
			$display();
		end
		
		$display();
		$display("After Explosion");
		#20
		for(a = 0; a < 10; a++)
		begin
			intermediate = zap.newGrid[a];
			for(b = 0; b < 10; b++)
			begin
			
				if(intermediate[b] === 'd0) begin
					$write(" E " );
				end
				if(intermediate[b] === 'd1) begin
					$write(" X " );
				end
				if(intermediate[b] === 'd2) begin
					$write(" Y " );
				end
				if(intermediate[b] === 'd3) begin
					$write(" D ");
				end
				if(intermediate[b] === 'd4) begin
					$write(" W " );
				end
				if(intermediate[b] === 'd5) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd6) begin
					$write(" B " );
				end
				if(intermediate[b] === 'd7) begin
					$write(" J ");
				end
				if(intermediate[b] === 'd8) begin
					$write(" K " );
				end
				if(intermediate[b] === 'd9) begin
					$write(" C " );
				end
				if(intermediate[b] === 'd10) begin
					$write(" O " );
				end
				if(intermediate[b] === 'd11) begin
					$write(" O " );
				end
				//$write("%d " , intermediate[b]);
			end
			$display();
		end
		
		
		$finish;
	end
endmodule