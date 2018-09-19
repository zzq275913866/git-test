classdef ServExpEv1 < Event
    
    properties
        packetBeingServed = [];
        q1 = [];
        q2 = [];
        fid;
        format_spec;
    end
    
    methods
        
        function execute(obj, sim)
            soj_t = obj.time - obj.packetBeingServed.created;
            fprintf(obj.fid, obj.format_spec, soj_t);
            %disp(num2str(soj_t));
            obj.q2.insertQ(obj.packetBeingServed, sim);
            obj.packetBeingServed = [];
            
            
            if (~isempty(obj.q1.queue1))
                packet = remove(obj.q1);
                obj.insertServ(packet, sim);
            end
            
        end
        
        function insertServ(obj, packet, sim)
            
            obj.packetBeingServed = packet;
            serviceTime = exprnd(1);
            obj.time = sim.now() + serviceTime;
            sim.insertEv(obj);
            
        end
    end
end
