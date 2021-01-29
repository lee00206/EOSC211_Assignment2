function error = checkinit(so, vo, Rp)
% checkinit implements the following checks: 1)the starting position vector
% is such that the spacecraft starts out above the planetary surface 2)the
% starting velocity is in the positive y-direction (spacecraft flying
% toward the planet not away from it). If inputs do not met either of
% these 2 conditions, it will return an error message.

% INPUTS:
% so: initial position vector, so = (sxo, syo)
% vo: initial velocity vector, vo = (vxo, vyo)
% Rp: radius of the planet

if sqrt(so(1)^2+so(2)^2) < Rp
    error('The spacecraft does not start out above the planetary surface');
end

if vo(2) < 0
    error('The starting velocity is not in the positive y-direction (spacecraft is not flying toward the planet)')
end

end