function button_state(app,button,state)
if state
    switch lower(button)
        case 'npe'
            app.push_npe.String = 'on';
            app.push_npe.BackgroundColor = [0.39,0.83,0.07];
            app.push_npe.ForegroundColor = [1,1,1];
            app.panel_npe.BackgroundColor = [0.94,0.94,0.94];
        case 'ica'
            app.push_ica.String = 'on';
            app.push_ica.BackgroundColor = [0.39,0.83,0.07];
            app.push_ica.ForegroundColor = [1,1,1];
            app.panel_ica.BackgroundColor = [0.94,0.94,0.94];
        case 'coca'
            app.push_coca.String = 'on';
            app.push_coca.BackgroundColor = [0.39,0.83,0.07];
            app.push_coca.ForegroundColor = [1,1,1];
            app.panel_coca.BackgroundColor = [0.94,0.94,0.94];
    end
else
    switch lower(button)
        case 'npe'
            app.push_npe.String = 'off';
            app.push_npe.BackgroundColor = [1,1,1];
            app.push_npe.ForegroundColor = [0.15,0.15,0.15];
            app.panel_npe.BackgroundColor = [1,1,1];
        case 'ica'
            app.push_ica.String = 'off';
            app.push_ica.BackgroundColor = [1,1,1];
            app.push_ica.ForegroundColor = [0.15,0.15,0.15];
            app.panel_ica.BackgroundColor = [1,1,1];
        case 'coca'
            app.push_coca.String = 'off';
            app.push_coca.BackgroundColor = [1,1,1];
            app.push_coca.ForegroundColor = [0.15,0.15,0.15];
            app.panel_coca.BackgroundColor = [1,1,1];
    end
end
drawnow();
end