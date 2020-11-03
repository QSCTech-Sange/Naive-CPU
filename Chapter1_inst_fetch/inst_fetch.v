// 取指模块
module inst_fetch(

	input wire			    clk,    // 时钟信号
	input wire      	    rst,    // 复位信号

	output wire[31:0]       inst_o  // 取出来的指令
	
);

	wire[5:0]               pc;     // PC 给 ROM 传递的 pc 值
	wire                    rom_ce; // PC 给 ROM 传递的使能信号
	
 
    //pc_reg 例化，点号即表示连接关系
    pc_reg pc_reg0(
		.clk(clk),            // pc 的时钟信号与外部时钟信号相连，括号内的是信号，点后的是端口
		.rst(rst),
		.pc(pc),
		.ce(rom_ce)
			
	);

    // rom 例化
    rom rom0(
        .ce(rom_ce),
        .addr(pc),
        .inst(inst_o)
  );
	


endmodule