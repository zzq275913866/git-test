classdef GenePoisEv < Event
    
    properties
        q1= [];
        sim_limit = 0;
    end
    
    methods
        
       
        
        function execute(obj, sim)
            
            packet = Packet(obj.time);
            obj.q1.insertQ(packet, sim);
            
            interarrivalTime = exprnd(0.5);
            obj.time = obj.time + interarrivalTime;
            
            if (obj.time < obj.sim_limit)
            sim.insertEv(obj);
            end
            
        end
        
    end
end