function [ ] = f_coca_RqIndexout(varargin)
%  
% cMapPath:     (string) the folder of cMaps
% Comp:         (vector) the model order to be selected    
% 'save':       (string) optional, default is not save the paired high
%                correlation index - hcInd
% 'off':        (string) optional, default is show the figure of the
%                paired high correlation index map
%
%  Example
%  if no optional parameters are inputed, the default hcInd won't be save
%  and there will be one figure pump out for each model order
%  f_cMapDeOrder([pwd filesep 'cMaps'],5:10). 
%  
%  One or Two optional parameters
%  f_cMapDeOrder([pwd filesep 'cMaps'],5:10,'save'). 
%  f_cMapDeOrder([pwd filesep 'cMaps'],5:10,'save','off'). 

% ver 1.0 120520 Weir Zhao
%%
if nargin < 2
    error('Not enough input arguments');
elseif nargin > 4
    error('Too much input arguments');
elseif nargin == 3
    switch lower(varargin{3})
        case 'save'
            SaveOn = 1;
            ShowOff = 0;
        case 'off'
            ShowOff = 1;
            SaveOn = 0;
        otherwise
            error('Input argument does not exsist');
    end
elseif nargin == 4
    jugment = strcmpi({varargin{3:4}},{'save','off'}) | strcmpi({varargin{3:4}},{'off','save'});
    if jugment
        SaveOn = 1;
        ShowOff = 1;
    else
        error('Input argument does not exsist');
    end
else
    SaveOn = 0;
    ShowOff = 0;
end
%%
cMapPath = varargin{1};
MORange =  varargin{2};
N  = length(MORange);
cd(cMapPath);
%%
for k_Src = 1:N
    load(['cMap#' num2str(MORange(k_Src))]);
    [ExNum,maxExNum,RefNum] = size(cMap);
    ExSerial = sum(abs(cMap(:,:,1)) > 0,2);
    flag = 1;
    overflag = maxExNum-RefNum;
    hcInd = zeros(RefNum,ExNum);
    hcMap = zeros(RefNum,ExNum);
    while flag > 0
        %%
        Ind_hcRef = zeros(ExNum,maxExNum,RefNum);
        %% find the highest related comp in the same reference number
        temp = abs(cMap);
        Max_cRef = squeeze(max(temp,[],3));
        for k_row = 1:ExNum
            for k_col = 1:maxExNum
                Ind_hcRef(k_row,k_col,:) = (temp(k_row,k_col,:) < Max_cRef(k_row,k_col));
            end
        end
        temp(Ind_hcRef > 0) = 0;
        % find the max and remove it for next loop
        [C,I] = max(temp,[],2);
        Max_Sig = squeeze(C);
        Max_Ind = squeeze(I);
        Btemp = squeeze(sum(temp > 0,2));
        cMap = abs(cMap) - temp;
        %%
        if flag > 1
            Max_Sig(CheckIndex==0,:) = 0;
            Max_Sig(hcMap>0) = 0;
            for k = 1:size(Max_Sig,1)
                Row_Sig = Max_Sig(k,:);
                Row_Sig(Row_Sig < max(Max_Sig(k,:)) ) = 0;
                Max_Sig(k,:) = Row_Sig;
            end
            hcMap = hcMap + Max_Sig;
            Max_Ind(Max_Sig == 0) = 0;
            hcInd = hcInd + Max_Ind;
        else
            hcMap = Max_Sig;
            Max_Ind(Max_Sig == 0) = 0;
            hcInd = Max_Ind;
        end
        flag = flag + 1;
        %% validate completeness of the hcMap
        ChSerial  = sum(abs(hcMap) > 0,2);
        CheckIndex = zeros(size(ExSerial));
        CheckIndex(1:k_Src) = (ExSerial(1:k_Src) - ChSerial(1:k_Src)) > 0;
        CheckIndex(k_Src+1:end) = (MORange(k_Src) - ChSerial(k_Src+1:end)) > 0;
        if sum(CheckIndex) == 0 || (overflag < flag)
            flag = 0;
        end
    end
    %%
    hcInd(hcMap ==0) = 0;
    hcMap = hcMap';
    disp( ['Eliminate Order Indetermination ' num2str(k_Src) ' done, ' num2str(N-k_Src) ' to go ...'])    
    %%
%     if ShowOff == 1
%         figure
%         set(gcf,'visible','off');
%         %%
%         hcMap = hcMap';
%         ssize = get(0,'screensize');
%         x = min(ssize(3:4));
%         y = max(ssize(3:4));
%         rect = floor([(y/2-x*3/8),(x*1/8),x*3/4,x*3/4 ]);
%         set(gcf,'OuterPosition',rect)
%         imagesc(hcMap),colorbar,caxis([0 1])
%         hold on
%         line([k_Src,k_Src],[0,MORange(k_Src)+1],'linewidth',2,'color',[ 0 0 0])
%         ylabel(['IC Number in ' num2str(MORange(k_Src))],'fontsize',12)
%         xlabel('Model Order','fontsize',12)
%         set(gca,'XTick',[1:N],'XTickLabel',[MORange],'FontSize',12);
%         saveas(gcf,['hcMap#' num2str(MORange(k_Src))],'png')
%     end
    %%
    hcInd = hcInd';
    save(['hcInd#' num2str(MORange(k_Src))],'hcInd');   
    if SaveOn == 1
        save(['hcMap#' num2str(MORange(k_Src))],'hcMap');
    else
        fprintf(['hcMap#' num2str(MORange(k_Src)) ' are not saved.\n'])
    end
end
disp('******************** Done! ********************');
%%
cd('..');
cd('..');










