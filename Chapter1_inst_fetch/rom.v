// 指令存储器ROM
module rom(

	input  wire			ce,		// ce   使能信号
	input  wire[5:0]	addr,	// addr 要读取的指令所在的地址，使用6位即可寻址64个不同的地址
	output reg[31:0]	inst	// inst 读取的指令，定义宽度为 32
	
);

	reg[31:0]  rom[63:0];		// rom 使用二维向量定义存储器，深度为64，每个元素的宽度是32，即一次最多存储64个指令,每个指令长度为 32

	initial $readmemh ( "rom.data", rom );	// 初始化，读取 rom.data 里的值为 rom 赋值

	always @ (*) begin
		if (ce == 1'b0) begin
			inst <= 32'h0;		// 使能信号无效时，给出的数据是0
	    end else begin
			inst <= rom[addr];	// 使能信号有效时，给出地址 addr 对应的指令
		end
	end

endmodule