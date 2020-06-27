%% Working with figure properties
% This file introduces the set() and get() functions and explains how to use 
% them to interact with figure properties. 
%
%%

% Create a figure and save it's handle.
f1 = figure();

% Using the get() function we can examine the properties on the Figure. In 
% MATLAB this will return a class, but in Octave this will return a struct.
figureInfo = get( f1 );
disp( figureInfo );

% Rather than returning all of the properties, we can also request a specific 
% property that we are interested in. For example, we can return the current
% figure name by using the keyword, 'name', which will be an empty string by 
% default. 
figureName = get( f1, 'name' );
disp( figureName );

% Similarly, we can set properties on the figure using the set() method. For 
% example, we can change the figure name with the following command.
set( f1, 'name', 'Figure Properties Tutorial' );
figureName = get( f1, 'name' );
disp( figureName );

% One of the most common properties you will want to use is 'position'. 
% We can get the current figure position using this property as follows;
pos = get( f1, 'position' );
disp( pos );

% The position property is a 1x4 vector that contains horizontal origin (h0), 
% vertical origin (v0), width (w), and height (h), respectively. So it looks 
% like this: [ h0, v0, w, h ]. (h0, v0) define where the bottom left corner of
% the figure window will appear. (w,h) define the width and height of the 
% figure in the current units. By default figures are defined in pixels. So
% this example will place the figure in the bottom left corner of the screen 
% and will be 300 pixels wide by 600 pixels tall.
set( f1, 'position', [0, 0, 300, 600] );

% Similarly, we can make a short and fat figure like so:
set( f1, 'position', [0, 0, 600, 300] );

% It is also possible to specify the figure position in normalized units 
% (scaled between 0 and 1) and inches using the "units" property and the 
% keywords "normalized" and "inches", respectively. Both are useful in 
% different cases. You can change the units with the set() command. Here is an 
% example that will create a figure that takes up the left half of the screen.
set( f1, 'units', 'normalized' );
set( f1, 'position', [0, 0, 0.5, 1] ); 

% Here is an example that will create a figure that is 3 inches wide by 4
% inches tall. 
set( f1, 'units', 'inches' );
set( f1, 'position', [0, 0, 3, 4] ); 

% The set() and get() functions are extremly useful and can be used to adjust 
% the properties of many different objects. It is important to note that 
% MathWorks introduced the HG2 Graphics system starting in MATLAB R2014b which
% allows you to directly access graphic objects using the dot operator. The 
% set() and get() methods still work, however, The interested reader is referred
% to the MathWorks webpage for more information. 
% ("https://www.mathworks.com/products/matlab/matlab-graphics.html" )

%% end of file
