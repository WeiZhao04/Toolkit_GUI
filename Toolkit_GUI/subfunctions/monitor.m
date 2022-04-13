function t = monitor(app)

t = timer;
% t.StartFcn = @TimerStart;
t.TimerFcn = @takeBreak;
t.StopFcn = @ergoTimerCleanup;
t.Period = 1;
t.StartDelay = 1;
t.ExecutionMode = 'fixedSpacing';
t.UserData = app;
end




% function TimerStart(~,~)
%
% end

function takeBreak(mTimer,~)
diary off
app = get(mTimer,'UserData');
fid = fopen([app.edit_output.String filesep 'log.txt'],'r');
C = textscan(fid,'%s %s %s','Delimiter',',');
fclose(fid);
diary([app.edit_output.String filesep 'log.txt'])
if length(C{3}) >=2 
    marker = strfind(C{3}(end,:),'...','ForceCellOutput',true);
    if marker{1}
        cjob = C{1}{end,:};
        tjob = strsplit(C{2}{end,:},'/');
        
        app.edit_job.String = cjob;
        per = roundn(str2double(tjob{1})/str2double(tjob{2}),-2);
        curbar = round(per*340);
        app.push_waitbar.CData = permute(repmat([0.94,0.94,0.94],22,1,340),[1,3,2]);
        app.push_waitbar.CData(1:end-1, 1:curbar+1, 1) = 0.39;
        app.push_waitbar.CData(1:end-1, 1:curbar+1, 2) = 0.83;
        app.push_waitbar.CData(1:end-1, 1:curbar+1, 3) = 0.07;
        app.push_waitbar.String = [num2str(per*100) '%'];
        drawnow();
    end
end
% if isequal(app.push_run.String,'...')
%     terminateExecution()
% end

end

function ergoTimerCleanup(mTimer,~)
delete(mTimer);
diary off;
end

function stopRunning()
import java.awt.event.KeyEvent
import java.util.Calendar
import java.lang.reflection.*

cmdwin = handle(com.mathworks.mde.cmdwin.CmdWin.getInstance().getComponent(0).getComponent(0).getComponent(0),'CallbackProperties');

argSig = javaArray('java.lang.Class',1);
argSig(1) = java.lang.Class.forName('java.awt.event.KeyEvent');
method = cmdwin.getClass().getDeclaredMethod('processKeyEvent',argSig);
method.setAccessible(true);

cal = Calendar.getInstance();
args = javaArray('java.lang.Object',1);
args(1) = KeyEvent(cmdwin,KeyEvent.KEY_PRESSED,cal.getTime().getTime(),KeyEvent.CTRL_DOWN_MASK,KeyEvent.VK_C,KeyEvent.CHAR_UNDEFINED);
method.invoke(cmdwin,args);
end
