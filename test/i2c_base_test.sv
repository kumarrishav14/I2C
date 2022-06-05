//  Class: i2c_base_test
//
class i2c_base_test extends uvm_test;
    `uvm_component_utils(i2c_base_test);

    //  Group: Configuration Object(s)

    //  Var: config_obj
    i2c_test_config cfg;


    //  Group: Components
    i2c_base_seq base_seq;
    uvm_sequencer#(i2c_seq_item) seqr;
    //  Group: Variables


    //  Group: Functions

    //  Constructor: new
    function new(string name = "i2c_base_test", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);

    //  Function: run_phase
    extern task run_phase(uvm_phase phase);
    
endclass: i2c_base_test


function void i2c_base_test::build_phase(uvm_phase phase);
    
    if (!uvm_config_db#(i2c_test_config)::get(this, "uvm_test_top", "test_cfg", cfg))
        `uvm_fatal(get_name(), "i2c_test_config cannot be found in ConfigDB!")
    base_seq = new("seq", cfg);    
    seqr = uvm_sequencer#(i2c_seq_item)::type_id::create("seqr", this);
endfunction: build_phase


task i2c_base_test::run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_info(get_name(), "base_test started, objection raised.", UVM_NONE)

    base_seq.start(seqr);

    phase.drop_objection(this);
    `uvm_info(get_name(), "base_test finished, objection dropped.", UVM_NONE)
endtask: run_phase
