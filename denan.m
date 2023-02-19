function [Out] = denan(In)
if size(In,1) == 1 || size(In,2) == 1
    Out = In(~isnan(In));
else
    RemoveRow = false(size(In,1),1);
    RemoveColumn = false(size(In,2),1);
    % remove rows
    for K = 1:size(In,1)
        if all(isnan(In(K,:)))
            RemoveRow(K) = true;
        end
    end
    % remove columns
    for K = 1:size(In,2)
        if all(isnan(In(:,K)))
            RemoveColumn(K) = true;
        end
    end
    In(RemoveRow,:)= [];
    In(:,RemoveColumn) = [];
    
    if any(isnan(In(:)))
        sprintf('not all nans were removed!')
    end
    Out = In;
end