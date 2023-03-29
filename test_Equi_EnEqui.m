% test Equidistribution and Enhanced Equidistribution
imax = 254;
h = 512;
w = 512;

% generate random sequence
u = randi(imax,[h,w]);

% Equidistribution
ue = equidistribution(u,imax);

% Enhanced Equidistribution
uee = enhanced_equidistribution(u,imax);

% plot
fz = 35;
figure;
subplot(131);
histogram(u,imax);
xlim([1,imax]);
xlabel('Values','FontSize',fz);
ylabel('Frequency','FontSize',fz);
title('Standard Uniform Distribution','FontSize',fz);
set(gca,'FontSize',fz);
set(gca,'FontName','Times New Roman');

subplot(132);
histogram(ue,imax);
xlim([1,imax]);
xlabel('Values','FontSize',fz);
ylabel('Frequency','FontSize',fz);
title('Equidistribution','FontSize',fz);
set(gca,'FontSize',fz);
set(gca,'FontName','Times New Roman');

subplot(133);
histogram(uee,imax);
xlim([1,imax]);
xlabel('Values','FontSize',fz);
ylabel('Frequency','FontSize',fz);
title('Enhanced Equidistribution','FontSize',fz);
set(gca,'FontSize',fz);
set(gca,'FontName','Times New Roman');
