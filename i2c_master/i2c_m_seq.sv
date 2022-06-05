/**************************************************************************************
    VIP for I2C Protocol

    Copyright (C) 2021  Rishav Kumar

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    License:    GPL v3, as found and defined in www.gnu.org
                See: https://www.gnu.org/licenses/gpl-3.0.html. 

    Author's intent:Any modifications made to this code, should be shared with
                    the author in github.
                    Code can be used for any high level verification.
                    This code should not be redistributed as proprietary VIP

***************************************************************************************/

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
        if (!uvm_config_db#(test_config)::get(null, "uvm_test_top.seq", "config", test_cfg))
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

        #1;
    end
endtask: body
