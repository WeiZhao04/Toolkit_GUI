function doneflag = f_CoCA_GUI(data,opts)


%% checking and initial parse
disp(['initializing ICA parameters'])
MOrange = eval(['[',opts.morange,']']);
refMO = eval(['[',opts.refmo,']']);
%%
if opts.cocasucession
    % run ica first
    for k_mo = 1:length(MOrange)
        opts.modelorder = MOrange(k_mo);
        f_ICA_GUI(data,opts);
        disp(['ICA decompostion, ' num2str(k_mo) '/' num2str(length(MOrange)) ', ...'])
    end
end
%%
ROdir = [opts.outdir filesep 'ICA_results'];
cocadir = [opts.outdir filesep 'CoCA_results'];
Th = 0.8;
mkdir(cocadir)
disp('Indexing out the Rq for consistency index calculation ...');
N = length(refMO);
for k_ref = 1:N
    cMap = f_STcorr_ergodic(refMO(k_ref),ROdir,MOrange,opts.domain);
    save([cocadir filesep 'cMap#' num2str(refMO(k_ref))],'cMap');
    %
    f_coca_RqIndexout(cocadir,refMO(k_ref),'save','off')
    Cqs = f_coca_CqIndex(cocadir,refMO(k_ref),MOrange,'CC');
    cval = nanmean(Cqs,2);
    CqCC.cval{k_ref} = cval;
    CqCC.Hq(k_ref) = sum(cval>=Th);
    CqCC.Lq(k_ref) = sum(cval<Th);
    MO_CqCC{refMO(k_ref)} = Cqs;
    saveas(gca,[cocadir filesep 'Cq#' num2str(refMO(k_ref))],'tiff');
end
save([cocadir filesep 'CqCC'],'CqCC','MO_CqCC');


%%
figure('visible','off')
b = bar([CqCC.Hq;CqCC.Lq]','stacked');
xticklabels(mat2cell(refMO,1,N))
set(b(1),'FaceColor',[0.85,0.33,0.10])
set(b(2),'FaceColor',[0.00,0.45,0.74])
set(gca,'fontsize',12)
legend('good','bad')
ylabel(['IC number'],'fontsize',12)
xlabel(['Model Order number'],'fontsize',12)
saveas(gca,[cocadir filesep 'CsNum.png']);
%%
[~,recIdx] = max(CqCC.Hq);
figure('visible','off')
hold on
for k = 1:N
    [scval,~] = sort(CqCC.cval{k},'ascend');
    h1 = plot([1:refMO(k)],scval,'-*','linewidth',1);
    h2 = plot([CqCC.Lq(k)+1:refMO(k)],scval(CqCC.Lq(k)+1:end),'o','linewidth',2,'color',get(h1,'color'));
    set(h2,'MarkerFaceColor',get(h1,'color'))
end
set(gca,'FontSize',12);
xlabel(['IC Number'],'fontsize',12)
ylabel(['Consistency Index'],'fontsize',12)
saveas(gca,[cocadir filesep 'CqLines.png']);
%%
[scval,sIdx] = sort(CqCC.cval{recIdx},'ascend');
dlmwrite([cocadir filesep 'sIC_number.txt'],[sIdx,scval])
%%
load([cocadir filesep 'hcMap#' num2str(refMO(recIdx))],'hcMap');
figure('visible','off')
set(gcf,'unit','centimeters','innerposition',[10 6 min(N*2.5,20) min(N*1.1,9)])
imagesc(hcMap(sIdx,:)')
colormap('parula')
c = colorbar('eastoutside');
ax = gca;
axpos = ax.Position;
c.Position(3) = 0.5*c.Position(3);
ax.Position = axpos;
hold on
line([0,refMO(recIdx)+1],[recIdx,recIdx],'linewidth',2,'color',[ 0 0 0])
set(gca,'YTick',[1:N],'YTickLabel',[refMO],'FontSize',12);
xlabel(['Sorted IC Number'],'fontsize',12)
ylabel(['Recommended ICs in MO' num2str(refMO(recIdx))],'fontsize',12)
saveas(gca,[cocadir filesep 'hcMap.png']);
%%
figure('visible','off')
a = area([1:refMO(recIdx)],scval);
a.FaceAlpha = 0.5;
a.FaceColor = '#E0E0E0';
hold on
plot([1:refMO(recIdx)],scval,'-*','linewidth',2,'color',[0.85,0.33,0.10]);
plot([1:CqCC.Lq(recIdx)],scval(1:CqCC.Lq(recIdx)),'-*','linewidth',2,'color',[0.00,0.45,0.74]);
ylim([0 1])
xlim([1 refMO(recIdx)])
set(gcf,'unit','centimeters','innerposition',[10 5 min(N*2.5,20) 2.5])
set(gca,'FontSize',12);
saveas(gca,[cocadir filesep 'Cq.png']);
%%
doneflag = 1;
disp('******************** Done! ********************');



end
