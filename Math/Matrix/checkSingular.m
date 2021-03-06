function [ out, A ] = checkSingular( A, repair )
%CHECKSINGULAR Check if a matrix is singular by comparing its eigen values.
%If the smallest eigenvalue must be at least 0.001 times the biggest one.

% WARNING, v can also be singular.......

[v e] = eig(A);

[emin imin] = min(diag(e));
[emax imax] = max(diag(e));

out = 0;

if emin/emax < 0.001
    % in this case the matrix is singular
    out = 1;
else
    return
end


if nargin > 1 && repair == 1
    %we want to se the smallest eigen values to be 0.001 times the biggest one
    while emin/emax < 0.001

        A=A+eye(2)*0.0001;
        
        [v e] = eig(A);

        [emin imin] = min(diag(e));
        [emax imax] = max(diag(e));        
%         e(imin,imin) = e(imax,imax) * 0.0001;
%         A = (v*e)\v;
    end
end


end

