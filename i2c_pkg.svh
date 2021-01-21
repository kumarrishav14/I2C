package i2c_pkg
    // uvm packages
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // Enums
    typedef enum bit { STORAGE, PERIPHERAL } slv_mode;

    // UVM components & objects
    `include "i2c_transaction.sv"
endpackage