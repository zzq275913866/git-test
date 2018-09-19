classdef ServExpEv2 < Event
    
    properties
        packetBeingServed = [];
        q2 = [];
        fid;
        format_spec;
    end
    
    methods
        
        function execute(obj, sim)
            soj_t = obj.time - obj.packetBeingServed.created;
            fprintf(obj.fid, obj.format_spec, soj_t);
            %disp(num2str(soj_t));
            obj.packetBeingServed = [];
            
            if (~isempty(obj.q2.queue2))
                packet = remove(obj.q2);
                obj.insertServ(packet, sim);
            end
            
        end
        
        function insertServ(obj, packet, sim)
            
            obj.packetBeingServed = packet;
            serviceTime = exprnd(1/1.2);
            obj.time = sim.now() + serviceTime;
            sim.insertEv(obj);
            
        end
    end
end