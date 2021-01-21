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
class test_config extends uvm_object;
    `uvm_object_utils(test_config);

    //  Group: Variables
    int no_of_cases;
    int no_of_error_cases;

    //  Group: Constraints


    //  Group: Functions

    //  Constructor: new
    function new(string name = "test_config");
        super.new(name);
    endfunction: new
    
endclass: test_config
