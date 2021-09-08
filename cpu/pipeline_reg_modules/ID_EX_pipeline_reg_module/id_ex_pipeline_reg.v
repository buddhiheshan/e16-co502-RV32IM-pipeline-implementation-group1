module id_ex_pipeline_reg(
    IN_INSTRUCTION, // INSTRUCTION [11:7]
    IN_PC,
    IN_DATA1, 
    IN_DATA2, 
    IN_IMMEDIATE,
    IN_DATA1ALUSEL,
    IN_DATA2ALUSEL,
    IN_DATA1BJSEL,
    IN_DATA2BJSEL,
    IN_ALU_OP,
    IN_BRANCH_JUMP,
    IN_DATAMEMSEL,
    IN_READ_WRITE,
    IN_WB_SEL,
    IN_REG_WRITE_EN,
    OUT_INSTRUCTION,
    OUT_PC,
    OUT_DATA1,
    OUT_DATA2,
    OUT_IMMEDIATE, 
    OUT_DATA1ALUSEL,
    OUT_DATA2ALUSEL,
    OUT_DATA1BJSEL,
    OUT_DATA2BJSEL,
    OUT_ALU_OP,
    OUT_BRANCH_JUMP,
    OUT_DATAMEMSEL,
    OUT_READ_WRITE,
    OUT_WB_SEL,
    OUT_REG_WRITE_EN,
    CLK, 
    RESET,
    BUSYWAIT);

    //declare the ports
    input [4:0] IN_ALU_OP, IN_INSTRUCTION;
    input [2:0] IN_BRANCH_JUMP;
    input [1:0] IN_WB_SEL, IN_DATA1ALUSEL, IN_DATA2ALUSEL, IN_DATA1BJSEL, IN_DATA2BJSEL;
    input [3:0] IN_READ_WRITE;
    
    input [31:0] IN_PC,
            IN_DATA1,
            IN_DATA2,
            IN_IMMEDIATE;   
                
    input IN_DATAMEMSEL,
        IN_REG_WRITE_EN,
        CLK, 
        RESET, 
        BUSYWAIT;

    output reg [4:0] OUT_ALU_OP, OUT_INSTRUCTION;
    output reg [2:0] OUT_BRANCH_JUMP;
    output reg [1:0] OUT_WB_SEL, OUT_DATA1ALUSEL, OUT_DATA2ALUSEL, OUT_DATA1BJSEL, OUT_DATA2BJSEL;
    output reg [3:0] OUT_READ_WRITE;
 
    output reg [31:0] OUT_PC,
                    OUT_DATA1,
                    OUT_DATA2,
                    OUT_IMMEDIATE; 

    output reg OUT_DATAMEMSEL,
            OUT_REG_WRITE_EN;

    //RESETTING output registers
    always @ (*) begin
        if (RESET) begin
            #1;
            OUT_INSTRUCTION = 5'dx;
            OUT_PC = 32'd0;
            OUT_DATA1 = 32'd0;
            OUT_DATA2 = 32'd0;
            OUT_IMMEDIATE =  32'd0;
            OUT_DATA1ALUSEL = 2'd0;
            OUT_DATA2ALUSEL = 2'd0;
            OUT_DATA1BJSEL = 2'd0;
            OUT_DATA2BJSEL = 2'd0;
            OUT_ALU_OP = 4'd0;
            OUT_BRANCH_JUMP = 3'd0;
            OUT_DATAMEMSEL  = 0;
            OUT_READ_WRITE = 4'd0;
            OUT_WB_SEL = 2'd0;
            OUT_REG_WRITE_EN = 0;
        end
    end

    //Writing the input values to the output registers, 
    //when the RESET is low and when the CLOCK is at a positive edge and BUSYWAIT is low 
    always @(posedge CLK)
    begin
        #0
        if (!RESET & !BUSYWAIT) begin
            OUT_INSTRUCTION <= #1 IN_INSTRUCTION;
            OUT_PC <= #1 IN_PC;
            OUT_DATA1 <= #1 IN_DATA1;
            OUT_DATA2 <= #1 IN_DATA2;
            OUT_IMMEDIATE <= #1  IN_IMMEDIATE;
            OUT_DATA1ALUSEL <= #1 IN_DATA1ALUSEL;
            OUT_DATA2ALUSEL <= #1 IN_DATA2ALUSEL;
            OUT_DATA1BJSEL <= #1 IN_DATA1BJSEL;
            OUT_DATA2BJSEL <= #1 IN_DATA2BJSEL;
            OUT_ALU_OP <= #1 IN_ALU_OP;
            OUT_BRANCH_JUMP <= #1 IN_BRANCH_JUMP;
            OUT_DATAMEMSEL  <= #1 IN_DATAMEMSEL;
            OUT_READ_WRITE <= #1 IN_READ_WRITE;
            OUT_WB_SEL <= #1 IN_WB_SEL;
            OUT_REG_WRITE_EN <= #1 IN_REG_WRITE_EN;
        end
    end

endmodule