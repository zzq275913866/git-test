classdef Packet
    
    properties
        created;    % creation time -- set be constructor
        sent;       % time of sending & delivery -- set internally
        delivd;
    end
    
    methods
        
        function obj = Packet(created)
            obj.created = created;            
        end
        
    end
    
end

