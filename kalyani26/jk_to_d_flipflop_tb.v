`timescale 1ns/1ps

// Testbench for JK to D Flip-Flop Conversion

module tb;

    reg clk;
    reg D;

    wire Q;
    wire Qbar;

    // Instantiate converted flip-flop
    d_from_jk uut (
        .clk(clk),
        .D(D),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Generate waveform
        $dumpfile("flipflop.vcd");
        $dumpvars(0, tb);

        // Initial values
        clk = 0;
        D = 0;
        uut.Q = 0;

        $display("Time\tCLK\tD\tJ\tK\tQ\tQbar");

        $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b",
                 $time, clk, D, uut.J, uut.K, Q, Qbar);

        // D = 0 -> Q = 0
        #10;
        D = 0;

        // D = 1 -> Q = 1
        #10;
        D = 1;

        // D = 0 -> Q = 0
        #10;
        D = 0;

        // D = 1 -> Q = 1
        #10;
        D = 1;

        // D = 1 -> Q remains 1
        #10;
        D = 1;

        // D = 0 -> Q becomes 0
        #10;
        D = 0;

        #10;

        $finish;
    end

endmodule