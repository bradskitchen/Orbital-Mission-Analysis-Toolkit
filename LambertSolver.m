function [v1,v2] = LambertSolver(R1,R2,t,mu,mode)
    R1=R1(:);
    R2=R2(:);
    r1=norm(R1);
    r2=norm(R2);

    if t <= 0 || mu <= 0 || r1 == 0 || r2 == 0
        error("Time, gravitational parameter, and position magnitudes must be positive.");
    end

    cosTheta=max(-1,min(1,dot(R1,R2)/(r1*r2)));
    theta=acos(cosTheta);
    c12=cross(R1,R2);

    if mode == 1
        if c12(3) < 0
            theta=2*pi-theta;
        end
    elseif mode == 2
        if c12(3) >= 0
            theta=2*pi-theta;
        end
    else
        error("Mode must be 1 for prograde or 2 for retrograde.");
    end

    A=sin(theta)*sqrt(r1*r2/(1-cos(theta)));
    if abs(A) < 1e-12
        error("Lambert solution is singular for this transfer angle.");
    end

    zGrid=linspace(-4*pi^2+1e-6,4*pi^2-1e-6,2000);
    residuals=arrayfun(@timeResidual,zGrid);
    bracket=[];

    for k=1:numel(zGrid)-1
        if isfinite(residuals(k)) && isfinite(residuals(k+1)) && ...
           residuals(k)*residuals(k+1) <= 0
            bracket=[zGrid(k),zGrid(k+1)];
            break
        end
    end

    if isempty(bracket)
        error("No zero-revolution Lambert solution was found for these inputs.");
    end

    z=fzero(@timeResidual,bracket);
    [~,y]=timeResidual(z);
    f=1-y/r1;
    g=A*sqrt(y/mu);
    gdot=1-y/r2;

    if abs(g) < 1e-12
        error("Lambert solution produced a singular Lagrange coefficient.");
    end

    v1=(R2-f*R1)/g;
    v2=(gdot*R2-R1)/g;

    function [F,y] = timeResidual(zValue)
        C=stumpC(zValue);
        S=stumpS(zValue);
        if C <= 0
            F=NaN;
            y=NaN;
            return
        end

        y=r1+r2+A*(zValue*S-1)/sqrt(C);
        if y <= 0
            F=NaN;
            return
        end

        F=(y/C)^1.5*S+A*sqrt(y)-sqrt(mu)*t;
    end

    function s = stumpS(zValue)
        if zValue > 1e-8
            s=(sqrt(zValue)-sin(sqrt(zValue)))/(sqrt(zValue))^3;
        elseif zValue < -1e-8
            s=(sinh(sqrt(-zValue))-sqrt(-zValue))/(sqrt(-zValue))^3;
        else
            s=1/6-zValue/120+zValue^2/5040;
        end
    end

    function c = stumpC(zValue)
        if zValue > 1e-8
            c=(1-cos(sqrt(zValue)))/zValue;
        elseif zValue < -1e-8
            c=(cosh(sqrt(-zValue))-1)/(-zValue);
        else
            c=1/2-zValue/24+zValue^2/720;
        end
    end
end
