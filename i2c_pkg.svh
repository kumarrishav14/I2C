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

package i2c_pkg;
    // uvm packages
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    //  Global level Enums
    typedef enum bit        { STORAGE, PERIPHERAL } slave_mode;
    typedef enum bit[4:0]   { SHORT = 7, LONG = 10 } address_mode;
    typedef enum bit[1:0]   { 
        STANDARD, 
        FAST, 
        FAST_PLUS, 
        HIGH 
    } speed_mode;


    //  Global Level structures
    typedef struct {
        bit [9:0] start_addr;
        bit [9:0] last_addr;
    } slave_address;


    // UVM components & objects
    `include "i2c_config_objs.svh"
    `include "i2c_m_config.sv"

    `include "i2c_seq_item.sv"
    // `include "i2c_m_seq.sv"

    // `include "i2c_slave_seq_item.sv"
    // `include "i2c_slave_seq.sv"

    `include "i2c_m_agent.sv"

    `include "i2c_seq_lib.svh"
    `include "i2c_env.sv"
    `include "i2c_base_test.sv"
endpackage