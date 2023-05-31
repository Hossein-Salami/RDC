function lhs = R_data_preparation(sample,n) % n = 24 is a very! detailed PSD (1-3 is sufficient) 
clc

if sample == 1
    load Rdata_ReliZyme.mat Diameters;
elseif sample == 2
    load Rdata_Immobead.mat Diameters;
elseif sample == 3
    load Rdata_sample.mat Diameters;
elseif sample == 4
    load Rdata_sample2.mat Diameters; 
elseif sample == 5
    load Rdata_sample3.mat Diameters;     
end

Rs = Diameters ./ 2;                % each bead R
Vs = (4/3) * pi * (Rs.^3);          % each bead volume
Ms = 1.1 * Vs;                      % each bead mas

R_Number = mean(Rs);                 % number-based R
R_Vol = sum(Rs .* Vs) / sum(Vs);     % volume-based
R_Mass = sum(Rs .* Ms) / sum(Ms);    % mass-based

[h r] = hist(Rs,n);
vol_percentage = 100 * (h .* (r.^3)) ./ sum((h .* (r.^3)));
num_percentage = 100 * (h .* (r.^0)) ./ sum((h .* (r.^0)));

% figure(9)
% hold on
% b1 = bar(r,h/max(h),'r');
% b1.FaceAlpha = 0.4;
% font = 18;
% xlabel('Radius, {\mu}m','fontsize',font)
% ylabel('Frequency','fontsize',font)
% set(gca,'FontSize',18)
% title('Number-based PSD','fontsize',14)
% grid on
% xlim([0 800])

% 
% figure(10)
% y = h .* (r.^3);
% bar(r, y ./ max(y) )
% font = 18;
% xlabel('Radius, {\mu}m','fontsize',font)
% ylabel('Frequency','fontsize',font)
% set(gca,'FontSize',18)
% title('Volume-based PSD','fontsize',14)
% grid on
% xlim([0 400])

length(Rs);
std(Rs);

lhs = [vol_percentage ; r];
end
