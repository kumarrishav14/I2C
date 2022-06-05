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

//  Class: test_config
//
import uvm_pkg::*;
class i2c_test_config extends uvm_object;
    `uvm_object_utils(i2c_test_config);

    //  Group: Variables
    int no_of_cases;
    int no_of_error_cases;


    protected address_mode addr_mode  = SHORT;
    protected speed_mode speed        = STANDARD;

    protected bit[9:0] no_slv = 2;

    //  Group: Constraints


    //  Group: Functions
    extern function void set_addr_mode(address_mode mode);
    extern function void set_speed(speed_mode mode);
    extern function void set_no_slv(bit[9:0] no_slv);

    //  Constructor: new
    function new(string name = "i2c_test_config");
        super.new(name);
    endfunction: new    
endclass: i2c_test_config

function void i2c_test_config::set_addr_mode(address_mode mode);
    this.addr_mode = mode;
endfunction: set_addr_mode

function void i2c_test_config::set_speed(speed_mode mode);
    this.speed = mode;
endfunction: set_speed

function void i2c_test_config::set_no_slv(bit[9:0] no_slv);
    if(no_slv >= 10) begin
        `uvm_warning(get_name(), "Max 10 slaves are supported. Setting no of slaves to 10")
        no_slv = 10;
    end
    this.no_slv = no_slv;
endfunction: set_no_slv

