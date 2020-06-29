%% Make the plotting tips logo
% This script generates a simple plot that is used for the MATLAB Coding Tips 
% logo. This example illustrates the use of several different properties on
% several different graphics objects.
%
%%

% Create the figure and save the handle
f = figure();

% Mix up some sine waves
surface( sin( 0 : 0.1 : 2*pi ) .* sin( 0 : 0.1 : 2*pi )' );

% Make it pretty
shading( 'flat' );
set( gca, 'fontsize', 16 );
set( f, 'menubar', 'none' );
set( f, 'position', [100,100,800,400] )
view( -23.876, 47.174 );
set( gca, 'xticklabel', '' )
set( gca, 'yticklabel', '' )
set( gca, 'zticklabel', '' )
zlabel( 'MATLAB' )
ylabel( 'Coding' );
xlabel( 'Tips' );

% Add a title
title( 'MATLAB Coding Tips' );
set( get( gca, 'title' ), 'verticalalignment', 'top' )
set( get( gca, 'title' ), 'fontsize', 48 )

%% end of file
