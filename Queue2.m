classdef Queue2 < handle
    
    properties
        queue2 = [];
        s2 = [];
    end
    
    methods
        
        function insertQ(obj, packet, sim)
            
            if (isempty(obj.s2.packetBeingServed))
                obj.s2.insertServ(packet, sim);
            else
                obj.queue2 = [obj.queue2 packet];
            end
            
        end

        function packet = remove(obj)            
            packet = obj.queue2(1);
            obj.queue2 = obj.queue2(2:end);
        end
    end
    
end