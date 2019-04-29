function plot_signals(file, filebasename, folder, output_folder, index, export_type, rangeY)
    f = figure('visible', 'off');
    plot(1:length(file),file);
    xlim([0 length(file)]);
    if (rangeY > 0)
        ylim([-rangeY rangeY]);
    end
    xlabel('Amostra');
    ylabel('Amplitude (mV)');
    str_title = [export_type ' EEG - Dataset ' folder ' - Channel ' int2str(index)];
    title(str_title);
    saveas(f,[output_folder '/' export_type '/' filebasename '.png']);
    close(f);
end