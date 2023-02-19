function [Out] = decell(In)
if length(In) == 1
Out = In{1};

else
   for K = 1:length(In)
       Out(:,K) = In{K};
   end
end