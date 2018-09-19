classdef EventList < handle
    
    properties
        elements = {};
    end
    
    methods
        
        function insert(obj, x)
            
            i = 1;
            len = length(obj.elements);
            while (i <= len && (obj.elements{i} < x))
                i = i + 1;
            end
            obj.elements = {obj.elements{1:i-1} x obj.elements{i:end}};
        end
        
        function ev = removeFirst(obj)
            
            if isempty(obj.elements)
                ev = [];
                return;
            end
            
            ev = obj.elements{1};
            obj.elements = obj.elements(2:end);
        end
        
        function num = size(obj)
            num = length(obj.elements);
        end
        
    end
    
end

