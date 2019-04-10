%http://dx.doi.org/10.1016/j.compbiomed.2013.04.002
function [IMF] = emd_old(signal, nsamples, fs)
    time2=(1:nsamples)/fs;
    threshouldSifting=0.3; %0.1
    monotone=0;
    indexIMF=0; %m = 0
    %signalmem=signal;
    while (not(monotone))
        h=signal; %r(t) = x(t)
        SD=1;
        while(SD>threshouldSifting)
            disp('SD_old: ');
            disp(SD);
            %% upper
            [pksMax,locsMax] = findpeaks(h);
            pksMax=[h(1), pksMax, h(end)]; 
            locsMax=[1, locsMax, length(h)]; 
            upperSpline=spline(time2(locsMax),pksMax); % interpola
            spmax=ppval(upperSpline,time2);

            %% lower
            [pksMin,locsMin] = findpeaks(-1*h);
            pksMin=-1*pksMin;
            pksMin=[h(1), pksMin, h(end)];
            locsMin=[1, locsMin, length(h)];
            lowerSpline=spline(time2(locsMin),pksMin);
            spmin=ppval(lowerSpline,time2);

            %% evaluate the mean

            mspline=(spmax+spmin)/2;

            hprec=h;
            h=h-mspline;
            SD=sum((hprec-h).^2)/sum(hprec.^2);  %criterio di stop proposto da by Huang et al. (1998)
        end
        indexIMF=indexIMF+1;
        IMF(indexIMF,:)=h;
        signal=signal-h;
        monotone=all(diff(signal)>0)||all(diff(signal)<0);
    end
end