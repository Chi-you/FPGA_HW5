module BRAM0(
	input clk,
	//input rst_a,
	input [11:0] ADDRARDADDR,
	input ENARDEN,
	input [3:0] WEA,
	input [31:0] DIADI,
	input [9:0] ADDRBWRADDR,
	input ENBWREN,
	output [31:0] DOBDO
);

RAMB36E1 #(
	// Address Collision Mode: "PERFORMANCE" or "DELAYED_WRITE"
	.RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
	// Collision check: Values ("ALL", "WARNING_ONLY", "GENERATE_X_ONLY" or "NONE")
	.SIM_COLLISION_CHECK("ALL"),
	// DOA_REG, DOB_REG: Optional output register (0 or 1)
	.DOA_REG(0),
	.DOB_REG(0),
	.EN_ECC_READ("FALSE"), // Enable ECC decoder,
	// FALSE, TRUE
	.EN_ECC_WRITE("FALSE"), // Enable ECC encoder,
	// FALSE, TRUE
	// INITP_00 to INITP_0F: Initial contents of the parity memory array
	.INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
	// INIT_00 to INIT_7F: Initial contents of the data memory array
	.INIT_00(256'h0000000000000531000000000000000000000000000012010000000100000023),
	.INIT_01(256'h00000000000000000000000000000000FFFFFF23000000000000000000000000),
	.INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_03(256'h0000223600000000000000000000000000000000000000000000000000000000),
	.INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
	.INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
	// INIT_A, INIT_B: Initial values on output ports
	.INIT_A(36'h000000000),
	.INIT_B(36'h000000000),
	// Initialization File: RAM initialization file
	.INIT_FILE("NONE"),
	// RAM Mode: "SDP" or "TDP"
	.RAM_MODE("TDP"),
	// RAM_EXTENSION_A, RAM_EXTENSION_B: Selects cascade mode ("UPPER", "LOWER", or "NONE")
	.RAM_EXTENSION_A("NONE"),
	.RAM_EXTENSION_B("NONE"),
	// READ_WIDTH_A/B, WRITE_WIDTH_A/B: Read/write width per port
	.READ_WIDTH_A(36), // 0-72
	.READ_WIDTH_B(36), // 0-36
	.WRITE_WIDTH_A(36), // 0-36
	.WRITE_WIDTH_B(36), // 0-72
	// RSTREG_PRIORITY_A, RSTREG_PRIORITY_B: Reset or enable priority ("RSTREG" or "REGCE")
	.RSTREG_PRIORITY_A("RSTREG"),
	.RSTREG_PRIORITY_B("RSTREG"),
	// SRVAL_A, SRVAL_B: Set/reset value for output
	.SRVAL_A(36'h000000000),
	.SRVAL_B(36'h000000000),
	// Simulation Device: Must be set to "7SERIES" for simulation behavior
	.SIM_DEVICE("7SERIES"),
	// WriteMode: Value on output upon a write ("WRITE_FIRST", "READ_FIRST", or "NO_CHANGE")
	.WRITE_MODE_A("WRITE_FIRST"),
	.WRITE_MODE_B("WRITE_FIRST")
	)
	RAMB36E1_inst (
	// Cascade Signals: 1-bit (each) output: BRAM cascade ports (to create 64kx1)
	.CASCADEOUTA(), // 1-bit output: A port cascade
	.CASCADEOUTB(), // 1-bit output: B port cascade
	// ECC Signals: 1-bit (each) output: Error Correction Circuitry ports
	.DBITERR(), // 1-bit output: Double bit error status
	.ECCPARITY(), // 8-bit output: Generated error correction parity
	.RDADDRECC(), // 9-bit output: ECC read address
	.SBITERR(), // 1-bit output: Single bit error status
	// Port A Data: 32-bit (each) output: Port A data
	.DOADO(), // 32-bit output: A port data/LSB data
	.DOPADOP(), // 4-bit output: A port parity/LSB parity
	// Port B Data: 32-bit (each) output: Port B data
	.DOBDO(DOBDO), // 32-bit output: B port data/MSB data
	.DOPBDOP(), // 4-bit output: B port parity/MSB parity
	// Cascade Signals: 1-bit (each) input: BRAM cascade ports (to create 64kx1)
	.CASCADEINA(), // 1-bit input: A port cascade
	.CASCADEINB(), // 1-bit input: B port cascade
	// ECC Signals: 1-bit (each) input: Error Correction Circuitry ports
	.INJECTDBITERR(), // 1-bit input: Inject a double bit error
	.INJECTSBITERR(), // 1-bit input: Inject a single bit error
	// Port A Address/Control Signals: 16-bit (each) input: Port A address and control signals (read port
	// when RAM_MODE="SDP")
	.ADDRARDADDR({1'b0, ADDRARDADDR[11:0], 3'b000}), // 16-bit input: A port address/Read address
	.CLKARDCLK(clk), // 1-bit input: A port clock/Read clock
	.ENARDEN(ENARDEN), // 1-bit input: A port enable/Read enable
	.REGCEAREGCE(ENARDEN), // 1-bit input: A port register enable/Register enable
	.RSTRAMARSTRAM(), // 1-bit input: A port set/reset
	.RSTREGARSTREG(), // 1-bit input: A port register set/reset
	.WEA(WEA), // 4-bit input: A port write enable
	// Port A Data: 32-bit (each) input: Port A data
	.DIADI(DIADI), // 32-bit input: A port data/LSB data
	.DIPADIP(), // 4-bit input: A port parity/LSB parity
	// Port B Address/Control Signals: 16-bit (each) input: Port B address and control signals (write port
	// when RAM_MODE="SDP")
	.ADDRBWRADDR({1'b0, ADDRBWRADDR[9:0], 5'b00000}), // 16-bit input: B port address/Write address
	.CLKBWRCLK(clk), // 1-bit input: B port clock/Write clock
	.ENBWREN(ENBWREN), // 1-bit input: B port enable/Write enable
	.REGCEB(ENBWREN), // 1-bit input: B port register enable
	.RSTRAMB(), // 1-bit input: B port set/reset
	.RSTREGB(), // 1-bit input: B port register set/reset
	.WEBWE(), // 8-bit input: B port write enable/Write enable
	// Port B Data: 32-bit (each) input: Port B data
	.DIBDI(), // 32-bit input: B port data/MSB data
	.DIPBDIP() // 4-bit input: B port parity/MSB parity
);
// End of RAMB36E1_inst instantiation

endmodule
