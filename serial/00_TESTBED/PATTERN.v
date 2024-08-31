`define clk_PERIOD 1
`define End_CYCLE 10000
module PATTERN(
	clk,
	rst_n,
	in_valid,
	In_IFM00,
	In_IFM01,
	In_IFM02,
	In_IFM03,
	In_IFM04,
	In_IFM05,
	In_IFM06,
	In_IFM07,
	In_IFM08,
	In_IFM09,
	In_IFM0A,
	In_IFM0B,
	In_IFM0C,
	In_IFM0D,
	In_IFM0E,
	In_IFM0F,
	In_IFM10,
	In_IFM11,
	In_IFM12,
	In_IFM13,
	In_IFM14,
	In_IFM15,
	In_IFM16,
	In_IFM17,
	In_IFM18,
	In_IFM19,
	In_IFM1A,
	In_IFM1B,
	In_IFM1C,
	In_IFM1D,
	In_IFM1E,
	In_IFM1F,
	out_valid,
	Out_OFM
);

input out_valid;
input [12:0] Out_OFM;

output reg clk;
output reg rst_n;

output reg in_valid;
output reg In_IFM00;
output reg In_IFM01;
output reg In_IFM02;
output reg In_IFM03;
output reg In_IFM04;
output reg In_IFM05;
output reg In_IFM06;
output reg In_IFM07;
output reg In_IFM08;
output reg In_IFM09;
output reg In_IFM0A;
output reg In_IFM0B;
output reg In_IFM0C;
output reg In_IFM0D;
output reg In_IFM0E;
output reg In_IFM0F;
output reg In_IFM10;
output reg In_IFM11;
output reg In_IFM12;
output reg In_IFM13;
output reg In_IFM14;
output reg In_IFM15;
output reg In_IFM16;
output reg In_IFM17;
output reg In_IFM18;
output reg In_IFM19;
output reg In_IFM1A;
output reg In_IFM1B;
output reg In_IFM1C;
output reg In_IFM1D;
output reg In_IFM1E;
output reg In_IFM1F;


//------------------------------
//	Parameter & Integer
//------------------------------
real	CYCLE = `clk_PERIOD;
parameter Delay = 2.5;
parameter Pattern_num = 50;
parameter Conv_size = 4;

integer seed = 2177;
integer j;
integer i;
integer k;
integer l;
integer pat;
integer ans_count;
integer ans_row, ans_col;
integer output_num = 50;
integer sparse;

//------------------------------
//	Register
//------------------------------
reg [3:0] I1 [0:49];
reg [3:0] I2 [0:49];
reg [3:0] I3 [0:49];
reg [3:0] I4 [0:49];
reg [3:0] I5 [0:49];
reg [3:0] I6 [0:49];
reg [3:0] I7 [0:49];
reg [3:0] I8 [0:49];
reg [3:0] I9 [0:49];
reg [3:0] I10 [0:49];
reg [3:0] I11 [0:49];
reg [3:0] I12 [0:49];
reg [3:0] I13 [0:49];
reg [3:0] I14 [0:49];
reg [3:0] I15 [0:49];
reg [3:0] I16 [0:49];
reg [3:0] I17 [0:49];
reg [3:0] I18 [0:49];
reg [3:0] I19 [0:49];
reg [3:0] I20 [0:49];
reg [3:0] I21 [0:49];
reg [3:0] I22 [0:49];
reg [3:0] I23 [0:49];
reg [3:0] I24 [0:49];
reg [3:0] I25 [0:49];
reg [3:0] I26 [0:49];
reg [3:0] I27 [0:49];
reg [3:0] I28 [0:49];
reg [3:0] I29 [0:49];
reg [3:0] I30 [0:49];
reg [3:0] I31 [0:49];
reg [3:0] I32 [0:49];
reg [12:0] Pattern_ofm [0:49];
reg [12:0] Golden_OFM;


reg [20:0] ans_array [0:24];
reg [20:0] result;
reg [5:0] out_count;

reg [30:0] latency;
reg [30:0] total_latency;

integer tt1,tt2,tt3,tt4,tt5,tt6,tt7,tt8,tt9,tt10,tt11,tt12,tt13,tt14,tt15,tt16,tt17,tt18,tt19,tt20,tt21,tt22,tt23,tt24,tt25,tt26,tt27,tt28,tt29,tt30,tt31,tt32;
integer t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31,t32;
integer out1, outt1;


//------------------------------
//	Clock
//------------------------------
initial clk =0;
always #(CYCLE/2) clk = ~clk;

//------------------------------
//	Read file
//------------------------------
initial begin
	t1 = $fopen("../00_TESTBED/t1.txt","r");
	t2 = $fopen("../00_TESTBED/t2.txt","r");
	t3 = $fopen("../00_TESTBED/t3.txt","r");
	t4 = $fopen("../00_TESTBED/t4.txt","r");
	t5 = $fopen("../00_TESTBED/t5.txt","r");
	t6 = $fopen("../00_TESTBED/t6.txt","r");
	t7 = $fopen("../00_TESTBED/t7.txt","r");
	t8 = $fopen("../00_TESTBED/t8.txt","r");
	t9 = $fopen("../00_TESTBED/t9.txt","r");
	t10 = $fopen("../00_TESTBED/t10.txt","r");
	t11 = $fopen("../00_TESTBED/t11.txt","r");
	t12 = $fopen("../00_TESTBED/t12.txt","r");
	t13 = $fopen("../00_TESTBED/t13.txt","r");
	t14 = $fopen("../00_TESTBED/t14.txt","r");
	t15 = $fopen("../00_TESTBED/t15.txt","r");
	t16 = $fopen("../00_TESTBED/t16.txt","r");
	t17 = $fopen("../00_TESTBED/t17.txt","r");
	t18 = $fopen("../00_TESTBED/t18.txt","r");
	t19 = $fopen("../00_TESTBED/t19.txt","r");
	t20 = $fopen("../00_TESTBED/t20.txt","r");
	t21 = $fopen("../00_TESTBED/t21.txt","r");
	t22 = $fopen("../00_TESTBED/t22.txt","r");
	t23 = $fopen("../00_TESTBED/t23.txt","r");
	t24 = $fopen("../00_TESTBED/t24.txt","r");
	t25 = $fopen("../00_TESTBED/t25.txt","r");
	t26 = $fopen("../00_TESTBED/t26.txt","r");
	t27 = $fopen("../00_TESTBED/t27.txt","r");
	t28 = $fopen("../00_TESTBED/t28.txt","r");
	t29 = $fopen("../00_TESTBED/t29.txt","r");
	t30 = $fopen("../00_TESTBED/t30.txt","r");
	t31 = $fopen("../00_TESTBED/t31.txt","r");
	t32 = $fopen("../00_TESTBED/t32.txt","r");
	out1 = $fopen("../00_TESTBED/gloden_ofm.txt","r");

	for(i =0; i<50; i=i+1) begin
		tt1 = $fscanf(t1,"%d",I1[i]);
		tt2 = $fscanf(t2,"%d",I2[i]);
		tt3 = $fscanf(t3,"%d",I3[i]);
		tt4 = $fscanf(t4,"%d",I4[i]);
		tt5 = $fscanf(t5,"%d",I5[i]);
		tt6 = $fscanf(t6,"%d",I6[i]);
		tt7 = $fscanf(t7,"%d",I7[i]);
		tt8 = $fscanf(t8,"%d",I8[i]);
		tt9 = $fscanf(t9,"%d",I9[i]);
		tt10 = $fscanf(t10,"%d",I10[i]);
		tt11 = $fscanf(t11,"%d",I11[i]);
		tt12 = $fscanf(t12,"%d",I12[i]);
		tt13 = $fscanf(t13,"%d",I13[i]);
		tt14 = $fscanf(t14,"%d",I14[i]);
		tt15 = $fscanf(t15,"%d",I15[i]);
		tt16 = $fscanf(t16,"%d",I16[i]);
		tt17 = $fscanf(t17,"%d",I17[i]);
		tt18 = $fscanf(t18,"%d",I18[i]);
		tt19 = $fscanf(t19,"%d",I19[i]);
		tt20 = $fscanf(t20,"%d",I20[i]);
		tt21 = $fscanf(t21,"%d",I21[i]);
		tt22 = $fscanf(t22,"%d",I22[i]);
		tt23 = $fscanf(t23,"%d",I23[i]);
		tt24 = $fscanf(t24,"%d",I24[i]);
		tt25 = $fscanf(t25,"%d",I25[i]);
		tt26 = $fscanf(t26,"%d",I26[i]);
		tt27 = $fscanf(t27,"%d",I27[i]);
		tt28 = $fscanf(t28,"%d",I28[i]);
		tt29 = $fscanf(t29,"%d",I29[i]);
		tt30 = $fscanf(t30,"%d",I30[i]);
		tt31 = $fscanf(t31,"%d",I31[i]);
		tt32 = $fscanf(t32,"%d",I32[i]);
		outt1 = $fscanf(out1,"%d",Pattern_ofm[i]);
	end
end



//------------------------------
//	Initial
//------------------------------

initial begin
	reset_task;
	repeat(10) begin
		@(negedge clk);
	end
	ans_count <= 0;
	j <= 0;
	for(pat=0; pat<Pattern_num; pat=pat+1) begin
		for(i=0; i<4; i=i+1) begin
			@(negedge clk);
			in_valid <= 1;
			In_IFM00 <= I1[pat][i] ;
			In_IFM01 <= I2[pat][i] ;
			In_IFM02 <= I3[pat][i] ;
			In_IFM03 <= I4[pat][i] ;
			In_IFM04 <= I5[pat][i] ;
			In_IFM05 <= I6[pat][i] ;
			In_IFM06 <= I7[pat][i] ;
			In_IFM07 <= I8[pat][i] ;
			In_IFM08 <= I9[pat][i] ;
			In_IFM09 <= I10[pat][i] ;
			In_IFM0A <= I11[pat][i] ;
			In_IFM0B <= I12[pat][i] ;
			In_IFM0C <= I13[pat][i] ;
			In_IFM0D <= I14[pat][i] ;
			In_IFM0E <= I15[pat][i] ;
			In_IFM0F <= I16[pat][i] ;
			In_IFM10 <= I17[pat][i] ;
			In_IFM11 <= I18[pat][i] ;
			In_IFM12 <= I19[pat][i] ;
			In_IFM13 <= I20[pat][i] ;
			In_IFM14 <= I21[pat][i] ;
			In_IFM15 <= I22[pat][i] ;
			In_IFM16 <= I23[pat][i] ;
			In_IFM17 <= I24[pat][i] ;
			In_IFM18 <= I25[pat][i] ;
			In_IFM19 <= I26[pat][i] ;
			In_IFM1A <= I27[pat][i] ;
			In_IFM1B <= I28[pat][i] ;
			In_IFM1C <= I29[pat][i] ;
			In_IFM1D <= I30[pat][i] ;
			In_IFM1E <= I31[pat][i] ;
			In_IFM1F <= I32[pat][i] ;
			j <= j + 1;	
		end
		//@(negedge clk);
	end
	@(negedge clk)
	in_valid <= 1'd0;
	In_IFM00 <= 0;
	In_IFM01 <= 0;
	In_IFM02 <= 0;
	In_IFM03 <= 0;
	In_IFM04 <= 0;
	In_IFM05 <= 0;
	In_IFM06 <= 0;
	In_IFM07 <= 0;
	In_IFM08 <= 0;
	In_IFM09 <= 0;
	In_IFM0A <= 0;
	In_IFM0B <= 0;
	In_IFM0C <= 0;
	In_IFM0D <= 0;
	In_IFM0E <= 0;
	In_IFM0F <= 0;
	In_IFM10 <= 0;
	In_IFM11 <= 0;
	In_IFM12 <= 0;
	In_IFM13 <= 0;
	In_IFM14 <= 0;
	In_IFM15 <= 0;
	In_IFM16 <= 0;
	In_IFM17 <= 0;
	In_IFM18 <= 0;
	In_IFM19 <= 0;
	In_IFM1A <= 0;
	In_IFM1B <= 0;
	In_IFM1C <= 0;
	In_IFM1D <= 0;
	In_IFM1E <= 0;
	In_IFM1F <= 0;
	wait(ans_count == 50);
	repeat(1) #(CYCLE);
	PASS;
end

always@(negedge clk) begin
	if(out_valid) begin
		Golden_OFM = Pattern_ofm[ans_count];
		if(Golden_OFM !== Out_OFM) begin
			fail;
		end
		ans_count = ans_count + 1;
	end
end

// always@(negedge out_valid) begin
// 	if(ans_count != 49) begin
// 		$display("-----------------------------------------------------");
// 		$display("Error!!! out_valid cycle is less than 50...!!");
// 		$display("-------------------------FAIL------------------------");
// 		$display("-----------------------------------------------------");
// 		$finish;
// 	end
// end

initial begin
	#(`clk_PERIOD * `End_CYCLE);
	$display("-----------------------------------------------------");
	$display("Error!!! Somethings' wrong with your code ...!!");
	$display("-------------------------FAIL------------------------");
	$display("-----------------------------------------------------");
	$finish;
end

task reset_task; begin
	force clk = 0;
	rst_n = 1;
	in_valid = 0;
	In_IFM00 <= 0;
	In_IFM01 <= 0;
	In_IFM02 <= 0;
	In_IFM03 <= 0;
	In_IFM04 <= 0;
	In_IFM05 <= 0;
	In_IFM06 <= 0;
	In_IFM07 <= 0;
	In_IFM08 <= 0;
	In_IFM09 <= 0;
	In_IFM0A <= 0;
	In_IFM0B <= 0;
	In_IFM0C <= 0;
	In_IFM0D <= 0;
	In_IFM0E <= 0;
	In_IFM0F <= 0;
	In_IFM10 <= 0;
	In_IFM11 <= 0;
	In_IFM12 <= 0;
	In_IFM13 <= 0;
	In_IFM14 <= 0;
	In_IFM15 <= 0;
	In_IFM16 <= 0;
	In_IFM17 <= 0;
	In_IFM18 <= 0;
	In_IFM19 <= 0;
	In_IFM1A <= 0;
	In_IFM1B <= 0;
	In_IFM1C <= 0;
	In_IFM1D <= 0;
	In_IFM1E <= 0;
	In_IFM1F <= 0;

	#(CYCLE*10) rst_n = 0;
   	#(CYCLE*10) rst_n = 1;
	
	if (out_valid!==0) begin
        $display("                                                                                                     ");
        $display("                                                                                                     ");
        $display("                                _ .___.-''.-=-.                                                      ");
        $display("                    __.-- _ _.-'_)_  (''`'-._\\ `.                                                   ");
        $display("                 _.'  __ |.' .-' __)  .-     /. |                                                    ");
        $display("               .'_.--'   |     -'  _)/         `\\                                                   ");
        $display("             .'.'      .'       .-'_.`           :                                                   ");
        $display("             .'     .-'       .(.-(              :                                                   ");
        $display("                  .'       .-' .    _            ;                                                   ");
        $display("                 /        .-._/`---'            /                                                    ");
        $display("                /        (____)(----. )       .'                                                     ");
        $display("               /         (      `.__.     / \\ /.           Output signals should be 0               ");
        $display("              :           ;-.___         /__ \\/|                                                    ");
        $display("              |         .'      `--.      -. \\ |           after the reset singal is asserted ......");
        $display("              :        /            \\    .__/                                                       ");
        $display("               \\      (__            \\    |_               at %4d ps                               ", $time*1000);
        $display("                \\       .`-. *       /   _|.\                                                       ");
        $display("                 \\    .'   `-.     .'_.-'   \\                                                      ");
        $display("                (_\\.-'    .'\')--.'-'       __\\                                                    ");
        $display("                 \\       /  // .'|      .--'  `-.                                                   ");
        $display("                  `-.    `-/ \\'  |   _.'         `.                                                 ");
        $display("                     `-._ /      `--'/             \\                                                ");
        $display("                        .'           |              \\                                               ");
        $display("                       /             |               \\                                              ");
        $display("                    .-'              |               /                                               ");
        $display("                   /                 |             -'                                                ");
        $display("                                                                                                     ");
        $display("                                                                                                     ");
        //$fclose(file);
        repeat(5) #(CYCLE);
        $finish;
	end

	#(CYCLE/2.0) release clk;
end
endtask 

task PASS;begin
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8OOOOOOO8@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O               .o8@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:.                   .o@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o                         :O@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                           .o8@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@888888@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@88888888OOO88@@@@@@@@@@                             :@@@@@@@");
$display("@@@@@@@@@@@@8o:.          .o8@@@@@@@@@@@@@@@@@@@88Oo:.                      .:ooo                              o@@@@@@");
$display("@@@@@@@@@@8                  .8@@@@@@@@@@@@8O:.           ..::::::ooo:.                                        .8@@@@@");
$display("@@@@@@@O.                      8@@@@@8O:.        .:O88@@@@@@@@@@@@@@@@@@@@@@@88Oo.                             :8@@@@@");
$display("@@@@@@o                        :8@@8.      .:o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OO:                         o@@@@@@");
$display("@@@@@8                          :o.     .O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@88@@8o.                      8@@@@@@");
$display("@@@@:                               o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:          :OO.                  o@@@@@8@");
$display("@@@o.                             :O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.              OO:              :8@@@@@@@@");
$display("@@8.                           O8@@@@@@@@@@O:.    .oO@@@@@@@@@@@@@@@@@@@@@@@.                o88          O@@@@@@@@@@@");
$display("@@O.                         :O@@@@@@@@@@:           o@@@@@@@@@@@@@@@@@@@@@@.                 .88o.     oO@@@@@@@@@@@@");
$display("@@O.                       :8@@@@@@@@@@8:            .O@@@@@@@@@@@@@@@@@@@@@o                  .@@8O:   o8@@@@@8@@@@@@");
$display("@@@:                      8@@@@@@@@@@O.               :8@@@@@@@@@@@@@@@@@@@@8o                  O@@@@.    8@@@@@@@@@8@");
$display("@@@@o                    :@@@@@@@@@@o                 :8@@@@@@@@@@@@@@@@@@@@@@o                 O@@@@O:   .O@@@@@@@@@@");
$display("@@@@@@.                .O@@@@@@@@@@8                  O@@@@@@@@@@@@@@@@@@@@@@@@@O             .O@@@@@@@@o   :@@@@@@@@@");
$display("@@@@@@@O:.           .O@@@@@@@@@@@@o                 .8@@@@@@@@@@@@888O8@@@@@@@@@o.         .o8@@@@@@@@@@o   o8@@@@@@@");
$display("@@@@@@@@@@8.         o@@@@@@@@@@@@@:                 o@@@@@@@O:.         :O@@@@@@@@Oo.   .:8@@@@@@@@@@@@@8     @@@@@@@");
$display("@@@@@@@@@@@@@@@@:    8@@@@@@@@@@@@@8               :8@@@@8:              .O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     @@@@@@");
$display("@@@@@@@@@@@@@@@@    :@@@@@@@@@@@@@@@O.             8@@@@@8:              o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8@@@    @@@@@@");
$display("@@@@@@@@@@@@@@@O   :@@@@@@@@@@@@@@@@@@@8O:....:O8@@@@@@@@@@@o          O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8@@@@    @@@@@");
$display("@@@@@@@@@@@@@@8:  :O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Oo.    .o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@@@");
$display("@@@@@@@@@@@@@8:   o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8  :@@@@@@@@@@@@@@@@@@@@@@@8Ooo\033[0;40;31m:::::\033[0;40;37moOO8@@8OOo   o@@@");
$display("@@@@@@@@@@@@@O   O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8. .8@@8o:O@@@@@@@@@@@@@8O\033[0;40;31m:::::::::::::::\033[0;40;37mO@@@O   :@@@");
$display("@@@@@@@@@@@@@O   O@@@@@@@@@@@@@@@@@@88888@@@@@@@@@@@@@@@@@@O:oO8@8.  .:    o@@@@@@@@@@@@O\033[0;40;31m::::::::::::::::::\033[0;40;37mo8@O   :8@@");
$display("@@@@@@@@@@@@@O   O@@@@@@@@@@@@@\033[1;40;31mO\033[0;40;31m:::::::::::::\033[0;40;37mo8@@@@@@@@@@@@8.              :@@@@@@@@@@8o\033[0;40;31m::::::::::::::::::::\033[0;40;37mo8@:   .@@");
$display("@@@@@@@@@@@@O.  .8@@@@@@@@@@8Oo\033[0;40;31m.:::::::::::::::\033[0;40;37moO@@@@@@@@@@8:              .@@@@@@@@@@O\033[0;40;31m::::::::::::::::::::::\033[0;40;37mo8O    @@");
$display("@@@@@@@@@@@@o   O@@@@@@@@@@8o\033[0;40;31m::::::::::::::::::::\033[0;40;37mo8@@@@@@@@@O              .@@@@@@@@@@O\033[0;40;31m::::::::::::::::::::::\033[0;40;37mo8O    @@");
$display("@@@@@@@@@@@@O.  :8@@@@@@@@o\033[0;40;31m::::::::::::::::::::::::\033[0;40;37m8@@@@@@@@@              :@@@@@@@@@@8o\033[0;40;31m:::::::::::::::::::::\033[0;40;37mO@o    @@");
$display("@@@@@@@@@@@@8:  :8@@@@@@@8\033[0;40;31m:::::::::::::::::::::::::\033[0;40;37m8@@@@@@@@@              O@@@@@@@@@@@O\033[0;40;31m::::::::::::::::::::\033[0;40;37mo8@:   :@@");
$display("@@@@@@@@@@@@@O   O@@@@@@8O\033[0;40;31m:::::::::::::::::::::::::\033[0;40;37mo8@@@@@@@@O           .8@@@@@@@@@@@@@8o\033[0;40;31m::::::::::::::::\033[0;40;37mo8@@@   .O@@");
$display("@@@@@@@@@@@@@O   O8@@@@@8O\033[0;40;31m:::::::::::::::::::::::::\033[0;40;37mo8@@@@@@@@@8:       .O@@@@@@@@@@@@@@@@@O\033[0;40;31m::::::::::::::\033[0;40;37mo@@@@8   .8@@");
$display("@@@@@@@@@@@@@O   O@@@@@@@O\033[0;40;31m::::::::::::::::::::::::.\033[0;40;37mO8@@@@8OOooo:.     :@@@@@@@@@@@@@@@@@@@@8OOo\033[0;40;31m::::::\033[0;40;37mooO8@@@@@o   :@@@");
$display("@@@@@@@@@@@@@8.  o8@@@@@@@\033[0;40;31m:::::::::::::::::::::::::\033[0;40;37m8@8O.                  .:O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8o   o@@@@");
$display("@@@@@@@@@@@@@8:  .O@@@@@@@O\033[0;40;31m:::::::::::::::::::::::\033[0;40;37mo@O.    .:oOOOo::.           .:OO8@@@@@@@@@@@@@@@@@@@@@@@@O.  :8@@@@");
$display("@@@@@@@@@@@@@@8.  :8@@@@@@@8o\033[0;40;31m:::::::::::::::::::\033[0;40;37mO8@O    8@@@@@@@@@@@@@@@@@8O..         :oO8@@@@@@@@@@@@@@@8o.  .8@@@@@");
$display("@@@@@@@@@@@@@@@O   :8@@@@@@@@8O\033[0;40;31m:::::::::::::::\033[0;40;37mO8@@@:   .@@@@@@@@@@@@@@@@@@@@@@88Oo:.       .:O8@@@@@@@@@@@.    O@@@@@@");
$display("@@@@@@@@@@@@@@@8    O@@@@@@@@@@8Oo\033[0;40;31m::::::::\033[0;40;37mooO8@@@@@O.   O@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:.      .o@@@@@@@@@o    O@@@@@@@");
$display("@@@@@@@@@@@@@@@@o    8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:    :O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o.    :O@@@8o.  .o@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@:    :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:      ...:oO8@@@@@@@@@@@@@@@@@@@@@@@@@O:   .O8.    .O@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@O:    :@@@@@@@@@@@@@@@@@@@@@@@@@@@O.   \033[0;40;33m...\033[0;40;37m          O@@@@@@@@@@@@@@@@@@@@@@@O       .O8@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@:    :O@@@@@@@@@@@@@@@@@@@@@@@@@O   \033[0;40;33m:O888Ooo:..\033[0;40;37m    :8@@@@@@@@@@@@@@@@@@@@O:     :O@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@8o     .O8@@@@@@@@@@@@@@@@@@@@@O:  \033[0;40;33m.o8888888888O.\033[0;40;37m  .O@@@@@@@@@@@OO888@8O:.    :O@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@O        o8@@@@@@@@@@@@@@@@@@@o   \033[0;40;33m:88888888888o\033[0;40;37m   o8@@@@@@@:              o8@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@:          .:88@@@@@@@@@@@@@8:   \033[0;40;33mo8888O88888O.\033[0;40;37m  .8@@@@@@@O    \033[1;40;33m..\033[0;40;37m     .::O@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@O.                  .:o          \033[0;40;33m8888\033[0;40;37m@@@@\033[0;40;33m888o.\033[0;40;37m  o8@@@@@8o   \033[0;40;33mo88o.\033[0;40;37m   @@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@o        .OOo:.                 \033[0;40;33mO88\033[0;40;37m@@@@@\033[0;40;33m888o.\033[0;40;37m  :8@@@@@o   \033[0;40;33m:O88.\033[0;40;37m   .@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@8o         :@@@@@O:             \033[0;40;33m.O8\033[0;40;37m@@@@\033[0;40;33m8888O:\033[0;40;37m   .O88O:   \033[0;40;33m.O88O\033[0;40;37m    O@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@:                             \033[0;40;33m.o8\033[0;40;37m@@@@\033[0;40;33m\033[0;40;33m888888O:\033[0;40;37m         \033[0;40;33m.888O:\033[0;40;37m   o8@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@8o                            \033[0;40;33m.O\033[0;40;37m@@@@\033[0;40;33m\888888888Oo:...ooO8888:   \033[0;40;37m:8@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8o                         \033[0;40;33mo8\033[0;40;37m@@@@\033[0;40;33m888888888888888888888O.\033[0;40;37m  :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o.                      \033[0;40;33m.8\033[0;40;37m@@@@\033[0;40;33m888888888888888888888O:\033[0;40;37m   o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O:.                 \033[0;40;33m.o8\033[0;40;37m@@@@@\033[0;40;33m88888888888888888888Oo\033[0;40;37m   :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8OOo::::::.   \033[0;40;33mo888\033[0;40;37m@@@@@\033[0;40;33m88888888888888888888o.\033[0;40;37m   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:   \033[0;40;33mo888\033[0;40;37m@@@@@\033[0;40;33m88888888888888888888.\033[0;40;37m   .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:   \033[0;40;33mo888\033[0;40;37m@@@@@\033[0;40;33m88888888888888888888O\033[0;40;37m   .O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.   \033[0;40;33mO8888\033[0;40;37m@@@\033[0;40;33m88888888888888888888O.\033[0;40;37m   O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o    \033[0;40;33m8888888888888888888888888888o\033[0;40;37m   o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.    \033[0;40;33m. ..:oOO8888888888888888888o.\033[0;40;37m  .8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.           \033[0;40;33m..:oO8888888888888O.\033[0;40;37m  .O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8OO.             \033[0;40;33m.oOO88O.\033[0;40;37m   O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@88:..          \033[0;40;33m...\033[0;40;37m    8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@88Ooo:.          @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8OoOO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display ("----------------------------------------------------------------------------------------------------------------------");
$display ("                                                  Congratulations!                						            ");
$display ("                                           You have passed all patterns!          						            ");
$display ("----------------------------------------------------------------------------------------------------------------------");
$finish;	
end endtask

task fail;begin
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8Oo::::ooOOO8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o:   ..::..       .:o88@@@@@@@@@@@8OOoo:::..::oooOO8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8.   :8@@@@@@@@@@@@Oo..                   ..:.:..      .:O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8.  .8@@@@@@@@@@@@@@@@@@@@@@88888888888@@@@@@@@@@@@@@@@@8.    :O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:. .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8.   :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O  O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8.   :o@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o  8@@@@@@@@@@@@@8@@@@@@@@8o::o8@@@@@8ooO88@@@@@@@@@@@@@@@@@@@@@@@@8:.  .:ooO8@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o  :@@@@@@@@@@O      :@@@O   ..  :O@@@:       :@@@@OoO8@@@@@@@@@@@@@@@@Oo...     ..:o@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  :8@@@@@@@@@:  .@@88@@@8:  o@@o  :@@@. 0@@@.  O@@@      .O8@@@@@@@@@@@@@@@@@@8OOo.    O8@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  o@@@@@@@@@@O.      :8@8:  o@@O. .@@8  000o  .8@@O  O8O:  .@@o .O@@@@@@@@@@@@@@@@@@@o.  .o@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@. :8@@@@@@@@@@@@@@@:  .o8:  o@@o. .@@O  ::  .O@@@O.  o0o.  :@@O. :8@8::8@@@@@@@@@@@@@@@8O  .:8@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  o8@@@@@@@@@@@OO@@8.  o@8   ''  .O@@o  O@:  :O@@:  ::   .8@@@O. .:   .8@@@@@@@@@@@@@@@@@@O   8@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@. .O@@@@@@@@@@O      .8@@@@Oo::oO@@@@O  8@8:  :@8  :@O. :O@@@@8:   .o@@@@@@@@@@@@@@@@@@@@@@o  :8@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:  8@@@@@@@@@@@@8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o:8@8:  :@@@@:  .O@@@@@@@@@@@@@@@@@@@@@@@@8:  o@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:  .8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OoO@@@O  :8@@@@@@@@@@@@@@@@@@@@@@@@@@8o  8@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8.   o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@88@@@@@@@@@@@@@@@@@@@8::@@@@@88@@@@@@@@@@@@@@@@@@@@@@@  :8@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.  .:8@@@@@@@@@@@@@@@@@@@88OOoo::....:O88@@@@@@@@@@@@@@@@@@@@8o .8@@@@@@@@@@@@@@@@@@@@@@:  o@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o.   ..:o8888888OO::.      ....:o:..     oO@@@@@@@@@@@@@@@@8O..@@ooO@@@@@@@@@@@@@@@@@@O. :@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Oo::.          ..:OO@@@@@@@@@@@@@@@@O:  .o@@@@@@@@@@@@@@@@@@@O   8@@@@@@@@@@@@@@@@@. .O@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8O   .8@@@@@@@@@@@@@@@@@@@@@O  O@@@@@@@@@@@@@. o8@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O    .O@@@@@@@@@@@@@@@@@@8..8@@@@@@@@@@@@@. .O@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O:           ..:O88@888@@@@@@@@@@@@@@@@@@@@@@@O  O@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o.                          ..:oO@@@@@@@@@@@@@@@o  @@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.                      .o@@8O::.    o8@@@@@@@@@@@O  8@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o                         :O@@@@@@@o.  :O8@@@@@@@@8  o8@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@88OO888@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8888OOOOO8@@8888@@@@@O.                          .@@@@@@@@@:.  :@@@@@@@@@. .O@");
$display("@@@@@@@@@@@@@@@@@@@@8o:           O8@@@@@@@@@@@@@@@@@@@8OO:.                     .::                            :8@@@@@@@@@.  .O@@@@@@@o. o@");
$display("@@@@@@@@@@@@@@@@@@.                 o8@@@@@@@@@@@O:.         .::oOOO8Oo:..::::..                                 o@@@@@@@@@@8:  8@@@@@@o. o@");
$display("@@@@@@@@@@@@@@@@:                    .@@@@@Oo.        .:OO@@@@@@@@@@@@@@@@@@@@@@@@@o.                            O@@@@@@@@@@@@  o8@@@@@O. o@");
$display("@@@@@@@@@@@@@@:                       o88.     ..O88@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@888O.                     .8@@@@@@@@@@@@  o8@@@@@: .O@");
$display("@@@@@@@@@@@@O:                             :o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:                  .8@@@@@@@@@@@8o  8@@@@@O  O@@");
$display("@@@@@@@@@@@O.                            :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o.              :8@@@@@@@@@@8.  .O@@@@o.  :@@@");
$display("@@@@@@@@@@@:                          :O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O:          .o@@@@@@@@@8o   .o@@@8:.  .@@@@@");
$display("@@@@@@@@@@@.                        O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.    .o8@@@@@@@@@@O  :O@@8o:   .O@@@@@@@");
$display("@@@@@@@@@@@.                      :O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O:   o8@@@@@@@@8           oO@@@@@@@@@@");
$display("@@@@@@@@@@@:                     o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.   .@@@@@@@O.      .:o8@@@@@@@@@@@@@");
$display("@@@@@@@@@@@8o                   8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o   :@@@@O     o8@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@8.               .O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:   .@@@8..:8@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@8:            .o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.  :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@8O.        8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   :@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@8o   o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o   O@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@O   O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O   :@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@8   :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:   8@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@8o  :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:..   .:o@@@@@@@@@@@@@@@@@@8.  O@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@8o  :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.         .:@@@@@@@@@@@@@@@@@:  :O@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@O.  o@@@@@@@@@@@@@@@@@@@@@@8OOO8@@@@@@@@@@@@@@@@@@@@@@@@@@@8.             .@@@@@@@@@@@@@@@@.  .O@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@o.  .@@@@@@@@@@@@@@@@@@@8:.       :8@@@@@@@@@@@@@@@@@@@@@@@@8.               o8@@@@@@@@@@@@@o. .:@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@o.  :@@@@@@@@@@@@@@@@@O            .@@@@@@@@@@@@@@@@@@@@@@@@@:                .8@@@@@@@@@@@@O.  :@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@O.  .@@@@@@@@@@@@@@@@:             .8@@@@@@@@@@@@@@@@@@@@@@@@O:                o@@@@@@@@@@@@O:  .@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@O.  .@@@@@@@@@@@@@@8:               8@@@@@@@@@@@@@@@@@@@@@@@@@@.               o@@@@@@@@@@@@O:  .@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@O.  .@@@@@@@@@@@@@o.                8@@@@@@@@@@@@@@@@@@@@@@@@@@8o             .8@@@@@@@@@@@@O.  .@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@8:  .@@@@@@@@@@@@@                 :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:.        O8@@@@@@@@@@@@@@o.  :@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@o   8@@@@@@@@@@@@.               :8@@@@@@@@@          :8@@@@@@@@@@@8OoooO@@@@@@@@@@@@@@@@@@.  .o@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@88O:   O@@@@@@@@@@@@O:             .@@@@@@@@O             .8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8   :8@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@O:.       :O8@@@@@@@@@@8o           :O@@@@@@@8:             :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:       :o@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@o              ..:8@@@@@@@@@8o:::.:O8@@@@@@@@@@@8.           :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O:.             o@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@8o                   :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:.     .o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8                  o8@@@@@@@@@@@@@@@");
$display("8OOOooooOOoo:.                    :OOOOOOOOOO8888OOOOOOOOOOOoo:ooOOOo: .OOOOOOOOOO888OOooOO888OOOOOooO8:                   .:OOOOOOOOOOO88@@");
$display("            .                                                                                                                               ");
$display("@@@@@@@@@@@@@@8o                 .8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8                    :8@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@8O.             o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8o                 .@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@::.       :O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O..         .:8@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@88O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@88@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
$display ("                                                                        OUTPUT FAIL!                                                        ");
$display ("                                                           Ans(OUT): %d,  Your output : %4d  at %8t                           ",Golden_OFM,Out_OFM,$time);
$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
repeat(90) #(CYCLE);
$finish;
end
endtask

endmodule