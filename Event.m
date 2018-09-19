classdef Event < handle
    
    properties
        time = 0;
    end
    
    methods
        function tf = lt(obj, obj2)  % less than function
            tf =  (obj.time < obj2.time);
        end
    end
    
    methods (Abstract)
        execute(obj, sim);
    end
    
end

