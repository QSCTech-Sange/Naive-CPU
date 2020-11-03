
module inst_fetch_tb;

  reg           CLOCK_50;     // 激励信号 CLOCK，这是时钟信号
  reg           rst;          // 激励信号 rst，这是复位信号
  wire[31:0]    inst;         // 显示信号 int，取出的指令
  
  // 定义 CLOCK 信号，每隔10个时间单位，CLOCK 的值翻转，由此得到一个周期信号。
  // 在仿真的时候，一个时间单位默认是 1ns，所以 CLOCK 的值每10ns翻转一次，对应就是 50MHz 的时钟     
  initial begin
    CLOCK_50 = 1'b0;
    forever #10 CLOCK_50 = ~CLOCK_50;
  end
      
  // 设置 rst 信号，最开始为1，表示复位信号有效，过了 195 个时间单位，即195ns
  // 设置 rst 信号的值为0，复位信号无效，复位结束，再运行1000ns，暂停仿真
  initial begin
    rst = 1'b1;
    #195 rst= 1'b0;
    #1000 $stop;
  end

  // 待测试模块实例化  
  inst_fetch inst_fetch0(
		.clk(CLOCK_50),
		.rst(rst),
		.inst_o(inst)	
	);

endmodule