function fluorophoreSave( fName, fl, comment )
% Save fluorophore structure into a Matlab .mat file. 
%
% Syntax
%   fluorophoreSave( fName, flStruct, ...)
%
% Description
%  The fluorophore structure is defined in the fluorophoreCreate function.
%  It must contain the following fields
%
%    .name
%    .solvent
%    .excitation
%    .emission
%    .comment
%    .wave
%
% )Needs updating). Saves the fluorophore data with the emission and
% excitation spectra normalizeds to unit amplitude (for comparison
% convenience).  It does not include the quantum efficiency parameter,
% which is a scaling factor depending on many physical parameters (for
% example concentration).
%
% Inputs:
%   fName   - path to where the fluorophore is to be saved.
%   fl      - the fluorophore structure.
%   comment - a required comment string.
%
% Copyright, Henryk Blasinski 2016

%%
p = inputParser;
p.addRequired('fName',@ischar);
p.addRequired('fl',@isstruct);
p.addRequired('comment',@ischar);

p.parse(fName,fl,comment);
inputs = p.Results;

%% We assume that the fluorophore already contains all the necessary fields.

% I think I would use fluorophoreCreate here and then do a series of
% fluorophoreSet commands, checking the inputs to make sure the data are
% there. (BW)

name       = inputs.fl.name;
solvent    = inputs.fl.solvent;
excitation = inputs.fl.excitation/max(inputs.fl.excitation);
emission   = inputs.fl.emission/max(inputs.fl.emission);
comment    = inputs.comment;
wave       = inputs.fl.spectrum.wave;

save(fName,'name','solvent','excitation','emission','comment','wave');

end

