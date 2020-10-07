// PC寄存器（Program Counter）
module pc_reg(

    input  wire			clk,    // 时钟信号
    input  wire			rst,    // 复位信号
    
    output reg[5:0]		pc,     // 要读取的指令地址
    output reg          ce      // 指令存储器使能信号
    
);

    always @ (posedge clk) begin    // 在时钟信号上升沿触发
        if (ce == 1'b0) begin       // 当指令存储器使能信号无效的时候，pc 保持为 0
            pc <= 6'h00;
        end else begin              // 当指令存储器使能信号有效的时候，pc + 1
            pc <= pc + 1'b1;
        end
    end
    
    always @ (posedge clk) begin    // 在时钟信号上升沿触发
        if (rst == 1'b1) begin      // 当复位信号有效的时候，指令存储器使能信号无效
            ce <= 1'b0;
        end else begin              // 当复位信号无效的时候，指令存储器使能信号有效
            ce <= 1'b1;
        end
    end

endmodule