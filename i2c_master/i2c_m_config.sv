//  Class: i2c_m_config
//
class i2c_m_config extends uvm_object;
    `uvm_object_utils(i2c_m_config);

    //  Group: Variables
    protected bit isActive = 1;
    protected bit hasCoverage = 1;

    protected virtual i2c_if i2c_vif;

    //  Group: Constraints


    //  Group: Functions

    //  Constructor: new
    function new(string name = "i2c_m_config");
        super.new(name);
    endfunction: new


    /*--- Getter and setter for isActive ---*/
    /*--------------------------------------*/
    
    function bit getIsActive();
        return isActive;
    endfunction

    function void setIsActive(bit isActive);
        this.isActive = isActive;
    endfunction

    /*--- Getter and setter for hasCoverage ---*/
    /*-----------------------------------------*/

    function bit getHasCoverage();
        return hasCoverage;
    endfunction

    function void setHasCoverage(bit hasCoverage);
        this.hasCoverage = hasCoverage;
    endfunction

    function virtual i2c_if getVif();
        if(i2c_vif == null)
            `uvm_fatal(get_name(), "I2C Vif not defined")
        return i2c_vif;
    endfunction

    function void setVif(virtual i2c_if vif);
        this.i2c_vif = vif;
    endfunction
endclass: i2c_m_config
