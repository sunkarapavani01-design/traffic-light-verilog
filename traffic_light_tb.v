module tb_traffic_light;

reg clk;
reg reset;
wire red, yellow, green;

// Instantiate the main module
traffic_light uut (
    .clk(clk),
    .reset(reset),
    .red(red),
    .yellow(yellow),
    .green(green)
);

// Clock generation (10 time units period)
always #5 clk = ~clk;

initial begin
    // Initialize
    clk = 0;
    reset = 1;

    // Release reset after some time
    #10 reset = 0;

    // Run simulation
    #100 $finish;
end

// Display output
initial begin
    $monitor("Time=%0t | RED=%b YELLOW=%b GREEN=%b",
              $time, red, yellow, green);
end

endmodule
