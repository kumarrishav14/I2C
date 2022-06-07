//  Class: i2c_m_agent
//
class i2c_m_agent extends uvm_agent;
    `uvm_component_utils(i2c_m_agent);

    //  Group: Configuration Object(s)

    //  Var: config_obj
    i2c_m_config m_cfg;

    virtual i2c_if vif;

    //  Group: Components
    // i2c_m_driver m_drv;
    // uvm_sequencer#(i2c_seq_item) m_seqr;

    //  Group: Variables


    //  Group: Functions

    //  Constructor: new
    function new(string name = "i2c_m_agent", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    
        
endclass: i2c_m_agent

function void i2c_m_agent::build_phase(uvm_phase phase);
    /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
    /*  For more information see UVM Cookbook v1800.2 p.503  */
    //super.build_phase(phase);

    if (uvm_config_db#(i2c_m_config)::exists(this, "", "m_cfg")) begin
        void'(uvm_config_db#(i2c_m_config)::get(this, "", "m_cfg", m_cfg));
    end
    else begin
        `uvm_warning(get_name(), "m_cfg not found in ConfigDB! Using default configuration")
        m_cfg = new("m_cfg");
    end

    if(!uvm_config_db#(virtual i2c_if)::get(this, "", "i2c_vif", vif))
        `uvm_fatal(get_name(), "i2c_vif is not present in ConfigDB.")

    m_cfg.setVif(vif);
endfunction: build_phase

