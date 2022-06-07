interface i2c_if(input bit clk);
    logic scl;
    logic sda_in;
    logic sda_out;
    logic sda;
    logic oen;
    
    clocking mst_drv_cb @(posedge clk);
        output #1 scl, sda_out, oen;
    endclocking
    
    clocking mst_mon_cb @(posedge clk);
        input #1step scl, sda_out, oen;
    endclocking
    
    clocking slv_drv_cb @(posedge clk);
        input scl, sda_in, oen;
    endclocking
    
    clocking slv_mon_cb @(posedge clk);
        input scl, sda_out, oen;
    endclocking


    
endinterface