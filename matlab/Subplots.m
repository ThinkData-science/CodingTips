%% The True Power of Subplots
% This script demonstrates several different ways to use the subplot command in 
% MATLAB/Octave. 
%% Basic Subplotting
% This section demonstrates the most basic way you can use the subplot() 
% command. 

% Create a figure and save its handle. For consistancy, the figures will be 
% sized in inches. 
f = figure();
set( f, 'units', 'inches' );
pause( 0.1 );

% Create a row vector of plots. This shows a simple example of how you can 
% include multiple plots within the same figure. The basic form of subplot()
% takes in three arguments: number of rows, number of columns, and index. The
% first two inputs define how many subplots will be included in total and the 
% third argument is a linear index describing which particular plot to include.
% The following example creates three subplots arranged along a single row. For
% convenience, the index has been overlayed on each figure.
set( f, 'position', [1, 1, 6, 3] );
a1 = subplot( 1, 3, 1 );
text( 0.5, 0.5, '1', 'fontsize', 48 );
a2 = subplot( 1, 3, 2 );
text( 0.5, 0.5, '2', 'fontsize', 48 );
a3 = subplot( 1, 3, 3 );
text( 0.5, 0.5, '3', 'fontsize', 48 );
keyboard();

% Use the handles that we saved to adjust the subplot properties. As an example,
% the following commands will just set each subplot to have different font 
% sizes. However, all axes properties can be individually controlled. 
set( a1, 'fontsize', 12 )
set( a2, 'fontsize', 14 )
set( a3, 'fontsize', 16 )
keyboard();

% Create a column vector of plots. This is the same as the previous example; 
% however, the three subplots are arranged along a single column.
set( f, 'position', [1, 1, 3, 6] );
a1 = subplot( 3, 1, 1 );
text( 0.5, 0.5, '1', 'fontsize', 48 );
a2 = subplot( 3, 1, 2 );
text( 0.5, 0.5, '2', 'fontsize', 48 );
a3 = subplot( 3, 1, 3 );
text( 0.5, 0.5, '3', 'fontsize', 48 );
keyboard();

% Create a matrix of plots. This example creates a square grid of plots. The 
% linear index counts from left to right and top to bottom. As with the otherwise
% examples, the index has been included on each of the plots. 
for iPlot=1 : 9
  subplot( 3, 3, iPlot );
  text( 0.5, 0.5, num2str( iPlot ), 'fontsize', 48 );
end
set( f, 'position', [ 1, 1, 6, 6 ] );
keyboard();

close( f );


%% Use different sized subplots
% A slightly more flexible way of using subplot is to occupy multiple subplot
% spaces with a single plot. This is accomplished by passing in an array of 
% linear index values as the third argument, rather than just a single value. 

% Create a figure
f = figure();
set( f, 'units', 'inches' );
pause( 0.1 );
set( f, 'position', [ 1, 1, 6, 6 ] );

% Create a plot with various sized plots. This examples adds three separate 
% plots to the same figure, all of which are different sizes. 
% - Create a single plot on the top row
subplot( 3, 3, 1:3 );
text( 0.35, 0.5, '1, 2, 3', 'fontsize', 48 );
% - Create a single plot in the last column
subplot( 3, 3, [6, 9] );
text( 0.30, 0.5, '6, 9', 'fontsize', 48 );
% - Create a matrix in the bottom left corner
subplot( 3, 3, [ 4:5, 7:8 ] );
text( 0.25, 0.5, '4, 5, 7, 8', 'fontsize', 48 );
keyboard;

% Use empty spaces to align figures. It is also convenient to use extra 
% subplot spaces to arrange plots within the figure. In this example, a single
% plot is centered in the top row and a second plot is included in the bottom 
% row that extends across all columns.
set( f, 'position', [ 1, 1, 6, 4 ] );
% - Center an image in the top row
subplot( 2, 3, 2 );
text( 0.35, 0.5, '2', 'fontsize', 48 );
subplot( 2, 3, 4:6 );
text( 0.35, 0.5, '4, 5, 6', 'fontsize', 48 );
keyboard();

close( f )

%% Use exact position coordinates
% Finally, the most flexible way of using subplot() is to specify the exact
% position of each plot within the figure. The easiest way to do this is to use
% normalized units and specify the subplot locations relative to the figure.

% Create a figure
f = figure();
set( f, 'units', 'inches' );
pause( 0.1 );
set( f, 'position', [ 1, 1, 6, 4 ] );

% Add a subplot. In this example a single image is included in the left half of
% the figure. This leaves space on the right side for other graphics objects
% like uicontrols. A few push buttons have been included to demonstrate what 
% this might look like. A separate tutorial will be written describing the 
% uicontrols in more detail. 
set( f, 'units', 'normalized' );
a = subplot( 'position', [ 0.1, 0.1, 0.5, 0.8 ] );
title( a, 'Subplots are awesome!' );
set( a, 'fontsize', 16 );
a = uicontrol( f, 'units', 'normalized', 'position', [ 0.7, 0.7, 0.2, 0.1 ], ...
  'style', 'pushbutton', 'string', 'Press Me' );
a = uicontrol( f, 'units', 'normalized', 'position', [ 0.7, 0.5, 0.2, 0.1 ], ...
  'style', 'pushbutton', 'string', 'Click Here' );
a = uicontrol( f, 'units', 'normalized', 'position', [ 0.7, 0.3, 0.2, 0.1 ], ...
  'style', 'pushbutton', 'string', 'Easy' );
keyboard();

close( f )

%% end of file
