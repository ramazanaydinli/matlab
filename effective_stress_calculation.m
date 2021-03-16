function [effective_stress] = effective_stress_calculation(depth,layer_number,starting_depth,end_depth,saturated_unit_weight,diameter)
    effective_stress=0;
    if depth > (15*diameter)
       depth=15*diameter;
    end %if ends
    for i=1:layer_number
        if depth > end_depth(1,i)
               effective_stress = effective_stress + (saturated_unit_weight(1,i)-9.81)*(end_depth(1,i)-starting_depth(1,i));
        elseif depth <= end_depth(1,i)
               effective_stress = effective_stress + (saturated_unit_weight(1,i)-9.81)*(depth - starting_depth(1,i));
               break
        end %if ends
    end %for ends
    