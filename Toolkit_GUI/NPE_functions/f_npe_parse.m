function opts = f_npe_parse(Files, varargin)

%%
mpath = mfilename ('fullpath'); 
[mdir,~] = fileparts (mpath);
%% Set all options to sensible defaults. Note these shouldn't refer to the data YET.

opts.subject_num = size(Files,2);
opts.mode = false;
opts.poolsize = 20;
opts.threshold = 0.05;
opts.num_dims = 'auto_estimation';
opts.th_estimation = false;
opts.randomise = false;
opts.outdir = mdir;
opts.maskdir = [mdir filesep 'parcels' filesep 'Schaefer2018_100Parcels_17Networks_order_FSLMNI152_3mm.nii' ];
opts.reconstruction = false;

if nargin==0
    disp 'No arguments given, displaying usage info instead instead!'
    clear opts; return
end

%% Convert arguments in a structure S:
if isempty(varargin)
    S = struct();
    
elseif length(varargin) == 1 && isstruct(varargin{1})
    S = varargin{1};
    
else % assume it's "'fieldname', value," pairs
    for i=1:2:length(varargin)
        if isfield(S, varargin{i})
            error('Duplicate option: %s', varargin{i}); 
        end
        S.(varargin{i}) = varargin{i+1};
    end
end

%% Apply these options to the default-options structure
fs = fieldnames(S);
for i = 1:length(fs)
    f = fs{i};
    if ~isfield(opts, f)
        error('Unrecognized option: %s', f)
    else
        opts.(f) = S.(f);
    end
end

%% Return opts!
return