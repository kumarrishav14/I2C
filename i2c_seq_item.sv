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

//  Class: i2c_seq_item
//
class i2c_seq_item extends uvm_sequence_item;
    typedef i2c_seq_item this_type_t;
    `uvm_object_utils(i2c_seq_item);

    //  Group: Variables
    bit [10:0] id;
    rand bit [9:0] addr[];
    rand bit [7:0] data[][];
    rand bit rw[];

    i2c_test_config cfg;

    //  Group: Constraints
    //  Constraint: data_size
    extern constraint data_size;
    extern constraint addr_rw_size;
    extern constraint addr_val;;
    
    //  Group: Functions
    //  Constructor: new
    function new(string name = "i2c_seq_item");
        super.new(name);
    endfunction: new

    //  Function: do_copy
    extern function void do_copy(uvm_object rhs);
    //  Function: do_compare
    extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    //  Function: convert2string
    extern function string convert2string();
    //  Function: do_print
    extern function void do_print(uvm_printer printer);
    //  Function: do_record
    // extern function void do_record(uvm_recorder recorder);
    //  Function: do_pack
    // extern function void do_pack();
    //  Function: do_unpack
    // extern function void do_unpack();
    
endclass: i2c_seq_item

/*----------------------------------------------------------------------------*/
/*  Constraints                                                               */
/*----------------------------------------------------------------------------*/
constraint i2c_seq_item::data_size {
    /*  solve order constraints  */
    solve addr before data;
    /*  rand variable constraints  */
    data.size() == addr.size();
    foreach(data[i]) 
        data[i].size() inside { [1:4] };
    
}

constraint i2c_seq_item::addr_rw_size {
    /*  solve order constraints  */
    solve addr before rw;
    /*  rand variable constraints  */
    addr.size() inside { [1:4] };
    rw.size() == addr.size();
}

constraint i2c_seq_item::addr_val {
    /*  rand variable constraints  */
    // if(cfg.addr_mode == SHORT)
    //     addr[9:8] == 0;
}

/*----------------------------------------------------------------------------*/
/*  Functions                                                                 */
/*----------------------------------------------------------------------------*/
function void i2c_seq_item::do_copy(uvm_object rhs);
    this_type_t rhs_;

    if (!$cast(rhs_, rhs)) begin
        `uvm_fatal({this.get_name(), ".do_copy()"}, "Cast failed!");
    end
    // `uvm_info({this.get_name(), ".do_copy()"}, "Cast succeded.", UVM_HIGH);

    /*  chain the copy with parent classes  */
    super.do_copy(rhs);

    /*  list of local properties to be copied  */
    this.id     = rhs_.id;
    this.addr   = rhs_.addr;
    this.data   = rhs_.data;
    this.rw    = rhs_.rw;
endfunction: do_copy

function bit i2c_seq_item::do_compare(uvm_object rhs, uvm_comparer comparer);
    this_type_t rhs_;

    if (!$cast(rhs_, rhs)) begin
        `uvm_fatal({this.get_name(), ".do_compare()"}, "Cast failed!");
    end
    // `uvm_info({this.get_name(), ".do_compare()"}, "Cast succeded.", UVM_HIGH);

    /*  chain the compare with parent classes  */
    do_compare = super.do_compare(rhs, comparer);

    /*  list of local properties to be compared:  */
    do_compare &= (
        this.id     == rhs_.id &&
        this.addr   == rhs_.addr &&
        this.rw    == rhs_.rw
    );
    foreach (this.data[i]) begin
        do_compare &= this.data[i] == rhs_.data[i];
    end
endfunction: do_compare

function void i2c_seq_item::do_print(uvm_printer printer);
    /*  chain the print with parent classes  */
    super.do_print(printer);

    /*  list of local properties to be printed:  */
    printer.print_field("id", id, $bits(id), UVM_UNSIGNED);
    printer.print_generic("addr", "dynamic array", $bits(addr), $sformatf("%p", addr));
    printer.print_generic("read/write", "dynamic array", $bits(rw), $sformatf("%p", rw));
    printer.print_generic("data", "dynamic array", $bits(data), $sformatf("%p", data));
endfunction: do_print

function string i2c_seq_item::convert2string();
    string s;

    /*  chain the convert2string with parent classes  */
    s = super.convert2string();

    /*  list of local properties to be printed:  */
    //  guide           0---4---8--12--16--20--24--28--32--36--40--44--48--
    s = {s, $sformatf("id       : 0x%0h\n", id)};                   
    s = {s, $sformatf("addr     : 0x%0p\n", addr)};
    s = {s, $sformatf("data     :   %0p\n", data)};
    s = {s, $sformatf("rw      :   %0p\n", rw)};
    return s;
endfunction: convert2string
