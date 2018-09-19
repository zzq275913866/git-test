classdef Queue1 < handle
    
    properties
        queue1 = [];
        s1 = [];
    end
    
    methods
        
        function insertQ(obj, packet, sim)
            
            if (isempty(obj.s1.packetBeingServed))
                 obj.s1.insertServ(packet, sim);
            else
                obj.queue1 = [obj.queue1 packet];
            end
            
        end

        function packet = remove(obj)            
            packet = obj.queue1(1);
            obj.queue1 = obj.queue1(2:end);
        end
    end
    
end
