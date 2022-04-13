function [user_thres] = f_Dim_Est(distbook,Gs,outdir)




%% typical thresholds
dist = [0.2 0.17 0.14 0.11 0.08 0.05 0.02];
%% sampling 
for k = 1:length(dist)
    [NH] = f_Sample_N(distbook,Gs,dist(k));
    mLen(k) = round(mean(NH.Len));
    disp(['Dimension estimation for sample ' num2str(k) ' ...'])
end

%% fiting the curve
TP = length(NH.INX);
p = polyfit(mLen', 1./dist', 1);
y = polyval(p,min(mLen):TP);
y1 = 1./y;
%% calculating recommed value
delta = -diff(dist)./diff(mLen);
delta(isinf(delta)) = 1;
[s_delta,ID] = sort(delta,'descend');
r_ind = find(s_delta>(0.015/round(TP/10)),1,'last');
r_value = y1(find(-diff(y1)<s_delta(ID(r_ind)),1,'first'));
r_value = roundn(r_value,-3);
%% show the fitting curve and sampling value
h = figure;
OP = get(0,'ScreenSize');
h.Position = [OP(3)/2-279 OP(4)/2+19 560 420];
plot(min(mLen):length(NH.INX),y1,'color',[0 0.4470 0.7410]),hold on
plot(mLen,dist,'color',[0.8500 0.3250 0.0980])
scatter(mLen,dist,[],[0.9290 0.6940 0.1250],'filled')
xlim([min(mLen)-1 length(NH.INX)])
ylim([0 0.25])
c_edit = uicontrol('Parent',gcf,'Style','edit');
c_edit.Units = 'normalized';
c_edit.Position = [0.5 0.85 0.1 0.05];
c_edit.String = num2str(r_value);

c_push = uicontrol('Parent',gcf,'Style','push');
c_push.Units = 'normalized';
c_push.Position = [0.62 0.85 0.15 0.05];
c_push.String = 'confirm';
c_push.Callback = 'uiresume(gcf)';
uiwait(h)
disp("Threshold confirmed ... ")
user_thres = str2double(c_edit.String);
user_thres = roundn(user_thres,-3);
mkdir([outdir filesep 'figures'])
saveas(h,[outdir filesep 'figures' filesep 'fig_dim_est.tif'])
close(h)
%%
% user_thres = inputdlg(['recommend thresholds ' num2str(r_value)],'',[1 36],{num2str(max(recom))});
% set(h,'DefaultUicontrolFontsize',12)
%%


end



function NH = f_Sample_N(distbook,Gs,dist)

RN = randperm(Gs);
if Gs > 100
    RN = RN(1:10);
else
    RN = RN(1:5);
end

TP = size(distbook{Gs},1);
L = TP*Gs;
%%
RN = randperm(Gs);
if Gs > 20
    RN = RN(1:5);
else
    RN = RN(1);
end

nh_index = cell(1,TP);
nh_weigh = zeros(1,TP);
for ks = 1:length(RN)
    tempbook = cell(Gs,1);
    for kk = 1:Gs
        if isempty(tempbook{kk})
            tempbook{kk} = double(distbook{kk,RN(ks)}); %tril
        end
    end
    for kk = 1:Gs
        if isempty(tempbook{kk})
            tempbook{kk} = double(distbook{RN(ks),kk}'); % triu
        end
    end
    for kk = 1:Gs
        if isempty(tempbook{kk})
            tempbook{kk} = zeros(TP,TP); % add up zeros
        end
    end
    tempbook = cell2mat(tempbook);
    tempbook(tempbook<dist) = 0;
    [tempbook,sInd] = sort(abs(tempbook),'descend');
    
    for kt = 1:TP
        % neigborhood ruling out
        NHtemp = tempbook(1:10*Gs,kt);
        cutoff = find(NHtemp>0,1,'last');
        NHtemp = NHtemp(1:cutoff);
        if sum(NHtemp)>Gs && cutoff >  floor(Gs*0.5)
            NumNH = sInd(1:cutoff,kt);
        else
            cutoff = f_assemNH(NHtemp,Gs);
            NumNH = sInd(1:cutoff,kt);
        end
        nh_index{kt} = sort(NumNH);
        nh_weigh(kt) = sum(NHtemp(1:length(NumNH)));
    end
    NH.INX(:,ks) = nh_index;
    NH.SOW(:,ks) = nh_weigh;
end


%

for kr = 1:length(RN)
    NH.KI{kr} = find(cellfun(@isempty,NH.INX(:,kr))==0);
    NH.Len(kr) = length(NH.KI{kr});
end

end




%%
% search NH size with criterion of group size and sum-of-dist

function sumK = f_assemNH(D,Gs)
sumK = 0;
cutoff = find(D>0,1,'last');
D = D(1:cutoff);
if ~isempty(cutoff)
    if cutoff>floor(Gs*0.5) && sum(D)>1
        sumK = cutoff;
    else
        return
    end
end
end











