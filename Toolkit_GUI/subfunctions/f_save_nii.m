function f_save_nii(data,fname,tempelate)

%% read the tpm header

Header = load_nii(tempelate);
%% change the header
[dims] = size(data);
voxel_size = Header.hdr.dime.pixdim(2:4);
origin = Header.hdr.hist.originator(1:3);
newHD = make_nii(data,[voxel_size],[origin]);
newHD.hdr.hist = Header.hdr.hist;
%% save the nii file
save_nii(newHD, fname)
end