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
