%% Legendary Legends in MATLAB
% This file demonstrates several nice ways to improve how your legend looks in 
% plots. 
%
%% Basic use of legends

% Create a figure and save its handle. For consistancy, the figures will be 
% sized in inches. 
f = figure();
set( f, 'units', 'inches' );
pause( 0.1 );
set( f, 'position', [1   1    5.8257    4.3693] );

% Make a simple plot to demostrate the plot legend
x = 0 : 0.1 : ( 2*pi );
plot( x, sin( x ), 'rx', 'linewidth', 2 );
hold on;
plot( x, cos( x/3 ) - 0.25, 'bs', 'linewidth', 2 );
plot( x, cos( 4*x )/3, '^g', 'linewidth', 2 );
hold off;
xlim( [ 0, 2*pi ] );
grid on;
title( 'Sample Plot' );
set( gca, 'fontsize', 16 );

% Use the basic legend commands
% The simplest way to use the legend() function is to pass in a character
% string for each line on the plot. 
legend( 'Line 1', 'Line 2', 'Line 3' );
keyboard();

% Another convenient way to set the legend strings using a cell array. This
% is convenient when you are programatically creating your label strings.
legStr = { 'Line 1', 'Line 2', 'Line 3' };
legend( legStr, 'location', 'north' );

% Adjust the location of the legend
legend( legStr, 'location', 'north' );
title( 'Location: north' );
keyboard();
legend( legStr, 'location', 'northwest' );
title( 'Location: northwest' );
keyboard();
legend( legStr, 'location', 'west' );
title( 'Location: west' );
keyboard();
legend( legStr, 'location', 'southwest' );
title( 'Location: southwest' );
keyboard();
legend( legStr, 'location', 'south' );
title( 'Location: south' );
keyboard();
legend( legStr, 'location', 'southeast' );
title( 'Location: southeast' );
keyboard();
legend( legStr, 'location', 'east' );
title( 'Location: east' );
keyboard();

% Move the legend outside
legend( legStr, 'location', 'eastoutside' );
title( 'Location: eastoutside' );
keyboard();
legend( legStr, 'location', 'westoutside' );
title( 'Location: westoutside' );
keyboard();

% Adjust the legend orientation
legend( legStr, 'orientation', 'horizontal', ...
  'location', 'southoutside' );
title( 'Location: southoutside' );
keyboard();

close( f );

%% Set legend properties manually
% It is also useful to set the legend properties using set() and get().

% Create a figure and save its handle. For consistancy, the figures will be 
% sized in inches. 
f = figure();
set( f, 'units', 'inches' );
pause( 0.1 );
set( f, 'position', [1   1    5.8257    4.3693] );

% Make a simple plot to demostrate the plot legend
x = 0 : 0.1 : ( 2*pi );
plot( x, sin( x ), 'rx', 'linewidth', 2 );
hold on;
plot( x, cos( x/3 ) - 0.25, 'bs', 'linewidth', 2 );
plot( x, cos( 4*x )/3, '^g', 'linewidth', 2 );
hold off;
xlim( [ 0, 2*pi ] );
grid on;
title( 'Sample Plot' );
set( gca, 'fontsize', 16 );

% Use the legend handle to adjust settings. The legend properties can also be 
% set using the handle. 
hl = legend( legStr );
set( hl, 'orientation', 'vertical' );
set( hl, 'location', 'northeast' );
set( hl, 'fontsize', 16 );
set( hl, 'box', 'off' );
title( 'Location: northwest' );
keyboard();

close( f )

% Create a figure
f = figure();
set( f, 'units', 'inches' );
pause( 0.1 );
set( f, 'position', [ 1, 1, 6, 4 ] );

% Set positions manually
set( f, 'units', 'normalized' );
a = subplot( 'position', [ 0.1, 0.1, 0.5, 0.8 ] );
x = 0 : 0.1 : ( 2*pi );
plot( x, sin( x ), 'rx', 'linewidth', 2 );
hold on;
plot( x, cos( x/3 ) - 0.25, 'bs', 'linewidth', 2 );
plot( x, cos( 4*x )/3, '^g', 'linewidth', 2 );
hold off;
xlim( [ 0, 2*pi ] );
grid on;
title( 'Sample Plot' );
set( a, 'fontsize', 16 );
hl = legend( 'Line 1', 'Line 2', 'Line 3' );
set( hl, 'fontsize', 16 );
set( hl, 'position', [ 0.74   0.25   0.12721   0.14310 ] );
a = uicontrol( f, 'units', 'normalized', 'position', [ 0.7, 0.7, 0.2, 0.1 ], ...
  'style', 'pushbutton', 'string', 'Press Me' );
a = uicontrol( f, 'units', 'normalized', 'position', [ 0.7, 0.5, 0.2, 0.1 ], ...
  'style', 'pushbutton', 'string', 'Click Here' );

keyboard();

close( f );

%% Set the line properties
% Another to set the legend labels is to directly set the DisplayName property
% on the individual lines. 

% Create a figure and save its handle. For consistancy, the figures will be 
% sized in inches. 
f = figure();
set( f, 'units', 'inches' );
pause( 0.1 );
set( f, 'position', [1   1    5.8257    4.3693] );

% Make a simple plot to demostrate the plot legend
x = 0 : 0.1 : ( 2*pi );
plot( x, sin( x ), 'rx', 'linewidth', 2, 'DisplayName', 'Line1' );
hold on;
plot( x, cos( x/3 ) - 0.25, 'bs', 'linewidth', 2, 'DisplayName', 'Line2' );
plot( x, cos( 4*x )/3, '^g', 'linewidth', 2, 'DisplayName', 'Line3' );
hold off;
xlim( [ 0, 2*pi ] );
grid on;
title( 'Sample Plot' );
set( gca, 'fontsize', 16 );

% Turn on the legend
legend();

keyboard();

close( f );

%% Add selective legends

% Create a figure and save its handle. For consistancy, the figures will be 
% sized in inches. 
f = figure();
set( f, 'units', 'inches' );
pause( 0.1 );
set( f, 'position', [1   1    5.8257    4.3693] );

% Create plot with realizations and statistics
t = sqrt( 0.5 ) * randn( 100, 500 );
ts = sort( t, 2 );
t10 = ts( :, floor( 0.10 * size( t, 2 ) ) );
t90 = ts( :, floor( 0.90 * size( t, 2 ) ) );
plot( t, 'linewidth', 0.2, 'color', [0.5 0.5 0.5] );
hold on;
l1 = plot( mean( t, 2 ), 'linewidth', 4, 'color', [0, 1, 0] );
l2 = plot( t10, 'linewidth', 4, 'color', [1, 0, 0] );
l3 = plot( t90, 'linewidth', 4, 'color', [0, 0, 1] );
hold off;
grid on;
ylim( [-3, 3] );
title( 'Statistics' );
set( gca, 'fontsize', 16 );
hl = legend( [ l1, l2, l3 ], 'Mean', '10th Prct', '90th Prct', ...
  'orientation', 'horizontal', 'location', 'north' );
set( hl, 'fontsize', 16 );
keyboard();

close( f );

%% end of file
