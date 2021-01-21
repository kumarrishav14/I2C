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

//  Class: i2c_slave_seq_item
//
class i2c_slave_seq_item extends uvm_sequence_item;
    typedef i2c_slave_seq_item this_type_t;
    `uvm_object_utils(i2c_slave_seq_item);

    //  Group: Variables
    rand bit [7:0] data [];
    // more variables can be added as per the specs of the peripheral

    //  Group: Constraints
    constraint data_size {
        /*  solve order constraints  */
    
        /*  rand variable constraints  */
        data.size() inside { [1:5] };
    }
    
    //  Group: Functions
    //  Constructor: new
    function new(string name = "i2c_slave_seq_item");
        super.new(name);
    endfunction: new

    //  Function: do_copy
    extern function void do_copy(uvm_object rhs);
    //  Function: do_compare
    // extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    //  Function: convert2string
    extern function string convert2string();
    //  Function: do_print
    // extern function void do_print(uvm_printer printer);
    //  Function: do_record
    // extern function void do_record(uvm_recorder recorder);
    //  Function: do_pack
    // extern function void do_pack();
    //  Function: do_unpack
    // extern function void do_unpack();

endclass: i2c_slave_seq_item


/*----------------------------------------------------------------------------*/
/*  Constraints                                                               */
/*----------------------------------------------------------------------------*/




/*----------------------------------------------------------------------------*/
/*  Functions                                                                 */
/*----------------------------------------------------------------------------*/

function void i2c_slave_seq_item::do_copy(uvm_object rhs);
    this_type_t rhs_;

    if (!$cast(rhs_, rhs)) begin
        `uvm_error({this.get_name(), ".do_copy()"}, "Cast failed!");
        return;
    end
    // `uvm_info({this.get_name(), ".do_copy()"}, "Cast succeded.", UVM_HIGH);

    /*  chain the copy with parent classes  */
    super.do_copy(rhs);

    /*  list of local properties to be copied  */
    // modify the list as per the properties
    this.data = rhs_.data;
endfunction: do_copy

function string i2c_slave_seq_item::convert2string();
    string s;

    /*  chain the convert2string with parent classes  */
    s = super.convert2string();

    /*  list of local properties to be printed:  */
    //  guide          0---4---8--12--16--20--24--28--32--36--40--44--48--
    s = {s, $sformatf("data    :   %0p\n", data)};
    return s;
endfunction: convert2string


