//  Class: i2c_m_seq
//
class i2c_m_seq extends uvm_sequence#(i2c_transaction);
    `uvm_object_utils(i2c_m_seq);

    //  Group: Variables
    int no_of_cases;
    i2c_transaction trans;
    test_config test_cfg;

    //  Group: Constraints


    //  Group: Functions

    //  Constructor: new
    function new(string name = "i2c_m_seq");
        super.new(name);
        if (!uvm_config_db#(test_config)::get(null, "uvm_test_top.seq", config, test_cfg))
            `uvm_fatal(get_name(), "test_config cannot be found in ConfigDB!")
        no_of_cases = test_cfg.no_of_cases;
    endfunction: new

    //  Task: pre_start
    //  This task is a user-definable callback that is called before the optional 
    //  execution of <pre_body>.
    // extern virtual task pre_start();

    //  Task: pre_body
    //  This task is a user-definable callback that is called before the execution 
    //  of <body> ~only~ when the sequence is started with <start>.
    //  If <start> is called with ~call_pre_post~ set to 0, ~pre_body~ is not called.
    // extern virtual task pre_body();

    //  Task: pre_do
    //  This task is a user-definable callback task that is called ~on the parent 
    //  sequence~, if any. The sequence has issued a wait_for_grant() call and after
    //  the sequencer has selected this sequence, and before the item is randomized.
    //
    //  Although pre_do is a task, consuming simulation cycles may result in unexpected
    //  behavior on the driver.
    // extern virtual task pre_do(bit is_item);

    //  Function: mid_do
    //  This function is a user-definable callback function that is called after the 
    //  sequence item has been randomized, and just before the item is sent to the 
    //  driver.
    // extern virtual function void mid_do(uvm_sequence_item this_item);

    //  Task: body
    //  This is the user-defined task where the main sequence code resides.
    extern virtual task body();

    //  Function: post_do
    //  This function is a user-definable callback function that is called after the 
    //  driver has indicated that it has completed the item, using either this 
    //  item_done or put methods. 
    // extern virtual function void post_do(uvm_sequence_item this_item);

    //  Task: post_body
    //  This task is a user-definable callback task that is called after the execution 
    //  of <body> ~only~ when the sequence is started with <start>.
    //  If <start> is called with ~call_pre_post~ set to 0, ~post_body~ is not called.
    // extern virtual task post_body();

    //  Task: post_start
    //  This task is a user-definable callback that is called after the optional 
    //  execution of <post_body>.
    // extern virtual task post_start();

endclass: i2c_m_seq

task i2c_m_seq::body();
    repeat(no_of_cases) begin
        trans = i2c_transaction::type_id::create("trans");
        trans.randomize();
        trans.print();
    end
endtask: body
