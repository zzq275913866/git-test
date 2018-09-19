classdef Simulator < handle
    
    properties
        time = 0;
        sim_limit;
        event_list = [];
    end
    
    methods
        
        function now_time = now(obj)
            now_time = obj.time;
        end
        
        function insertEv(obj, ev)
            obj.event_list.insert(ev);
        end
        
        function doAllEvents(obj)
            
            ev = obj.event_list.removeFirst();
            while ~isempty(ev)
                obj.time = ev.time;
                
              
                
                ev.execute(obj);
                ev = obj.event_list.removeFirst();
            end
            
        end
    end
end
