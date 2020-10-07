// 指令存储器ROM
module rom(

	input  wire			ce,		// 使能信号
	input  wire[5:0]	addr,	// 要读取的指令地址，使用6位地址即可寻址64
	output reg[31:0]	inst	// 读出的指令，定义宽度为 32
	
);

	reg[31:0]  rom[63:0];		// 使用二维向量定义存储器，深度为64，每个元素的宽度是32，即一次最多存储64个指令

	initial $readmemh ( "rom.data", rom );

	always @ (*) begin
		if (ce == 1'b0) begin
			inst <= 32'h0;		// 使能信号无效时，给出的数据是0
	    end else begin
			inst <= rom[addr];	// 使能信号有效时，给出地址 addr 对应的指令
		end
	end

endmodule