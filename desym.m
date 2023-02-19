function [MatrixOut] = desym(Matrix,Diag)
MatrixOut = nan(size(Matrix,1));

for R = 1:length(Matrix)
    for C = R:length(Matrix)
        MatrixOut(R,C) = Matrix(R,C);
    end
end

if ~Diag
    MatrixOut(1:length(MatrixOut)+1:end) = nan;
end