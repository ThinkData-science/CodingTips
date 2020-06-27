%% Plotting Tips
% This file collects some helpful tips for plotting in MATLAB. 
%
%
%% Tip 1 - Adjust font sizes

f = figure()
subplot( 1, 3, 1 );
t = 0:0.1:(2*pi);
plot( t, sin( t ) );
xlim( [0, 2*pi] );
title( 'FontSize=10' );
set( gca, 'fontsize', 10 );
subplot( 1, 3, 2 );
plot( t, sin( t ) );
xlim( [0, 2*pi] );
title( 'FontSize=14' );
set( gca, 'fontsize', 14 );
subplot( 1, 3, 3 );
plot( t, sin( t ) );
xlim( [0, 2*pi] );
title( 'FontSize=18' );
set( gca, 'fontsize', 18 );
set( f, 'position', [808   742   988   219] );

keyboard
close( f )

%% Tip 2 - Use different line widths

f = figure();
subplot( 1, 3, 1 );
plot( 0:4, 0:4, 'linewidth', 1 );
hold on;
plot( 0:4, 2*(0:4), 'linewidth', 2 );
plot( 0:4, 3*(0:4), 'linewidth', 3 );
plot( 0:4, 4*(0:4), 'linewidth', 4 );
plot( 0:4, 5*(0:4), 'linewidth', 5 );
plot( 0:4, 6*(0:4), 'linewidth', 6 );
hold off;
xlim( [0, 4 ] );
grid on;
title( 'Adjust Linewidth' );
set( gca, 'fontsize', 12 );
subplot( 1, 3, 2 );
t = randn( 100, 1000 );
plot( t, 'linewidth', 0.2, 'color', [0.5 0.5 0.5] );
hold on;
plot( mean( t, 2 ), 'linewidth', 3, 'color', [0, 1, 0] );
hold off;
grid on;
title( 'Statistics' );
set( gca, 'fontsize', 12 );
subplot( 1, 3, 3 );
x = 0:6;
y1 = 10 + -3*x;
y2 = -10 + 3*x;
z = 10*log10( 10.^(y1/10) + 10.^(y2/10) )
plot( x, y1, 'r--', 'linewidth', 2 );
hold on;
plot( x, y2, 'g--', 'linewidth', 2 );
plot( x, z, 'k', 'linewidth', 4 );
hold off;
title( 'Components' );
legend( 'Comp 1', 'Comp 2', 'Total', 'location', 'north' );
grid on;
set( gca, 'fontsize', 12 );
set( f, 'position', [808   742   988   219] );

keyboard
close( f )

%% Tip 3 - Use multiple subplots

f = figure()
subplot( 2, 2, 1 );


set( gca, 'fontsize', 14 );
subplot( 2, 2, 2 );


set( gca, 'fontsize', 14 );
subplot( 2, 2, [ 3:4 ] );


set( gca, 'fontsize', 14 );
set( f, 'position', [916   526   866   420] );

%% Tip 4 - Change the figure size



%% Tip 5 - Plot vertical and horizontal lines


%% Tip 6 - Manually set the legend position


%% Tip 7 - Copy/paste lines onto the same plot


%% Tip 8 - Use gcf and gca to match figure and axis properties


%% Tip 9 - Use gco to adjust lines


%% Tip 10 - Use findobj() to loop over plot objects


%% end of file
