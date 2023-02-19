function [NotStruct] = destruct(Struct,Field)
if length(strsplit(Field,'.')) == 1
    if isfield(Struct,Field)
        try
            NotStruct = cat(1,Struct.(Field));
        catch
            for N = 1:length(Struct)
                if isempty(Struct(N).(Field))
                    Struct(N).(Field) = nan;
                end
            end
            NotStruct = cat(1,Struct.(Field));
        end
    else
        warning('No such field exists')
    end
else
    TempField = strsplit(Field,'.');
    NotStruct = Struct;
    for I = 1:length(strsplit(Field,'.')) - 1
        NotStruct = cat(1,NotStruct.(TempField{I}));
    end
    NotStruct = cat(1,NotStruct.(TempField{end}));
end
