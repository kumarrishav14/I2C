import uvm_pkg::*;
import i2c_pkg::*;
`include "uvm_macros.svh"
module hdl_top();
    i2c_test_config test_cfg;

    initial begin
        test_cfg = new("test_cfg");
        test_cfg.set_addr_mode(SHORT);
        test_cfg.set_no_slv(4);

        uvm_config_db#(i2c_test_config)::set(null, "uvm_test_top*", "test_cfg", test_cfg);
        
    end
endmodule