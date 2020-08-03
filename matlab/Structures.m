%% Structures in MATLAB
% This script demonstrates the use of structs in MATLAB and shows a few usefull 
% tips to help use them efficiently. 
%
% Structs are a basic data type in MATLAB that can be used to combine multiple
% properties. The properties on a struct, referred to as fields, can be of 
% different types and of varying sizes. Structs are a very convenient way to 
% collect related data types. For example you can use structs to keep raw data
% packaged with associated metadata all in one place. Structs are also very 
% useful as function inputs and outputs. 
%
%% The Basics

% Structs in MATLAB are managed dynamically, so we can add and remove new 
% properties one at a time. The easiest way to create a struct is to use the 
% struct() command to create an empty struct and the dot operator to populate 
% it. Here is a simple example.
s = struct(); % create an empty struct
s.val1 = 100; % add a scalar
s.val2 = 0 : 25 : 100; % add a vectorize
s.val3 = randn( 2, 3, 5 ); % add an ND array
s.char1 = 'This is a character string'; % add a character string
s.cell1 = { 100, 300, '5', 'abc' };  % add a cell array
disp( s );
keyboard();

% We can now access any of the newly added properties using the corresponding
% fieldnames. For example, let's access the 2nd element of "val2".
disp( s.val2(2) );
keyboard();

% Or we could access the last element of "cell1".
disp( s.cell1{end} );
keyboard();

% In fact, we can now access and modify all of the properties just like we 
% would if they weren't on the struct. Let's add a new value to "cell1".
s.cell1{ end+1 } = 'I am new!';
disp( s.cell1 );
keyboard();

% Or let's remove some values from "val2"
disp( s.val2 );
s.val2( 2:3 ) = [];
disp( s.val2 );
keyboard();

% Finally, using the rmfield() function, we can completely remove fields from 
% a struct(). For example, let's create a new struct named "s2" and remove all 
% of the fiels except for "val1". The syntax for this is: 
% sOut = rmfield( s, { 'name1', 'name2', etc... } ), where "sOut" could be "s" 
% if we wanted to overwrite the original struct. 
s2 = rmfield( s, { 'val2', 'val3', 'char1', 'cell1' } );
disp( s2 );
keyboard();

%% Fieldnames() and dynamically accessing fields
% Another very useful feature of structs is that fields can be accessed
% dynamically using variables. This is done by using "()" around the variable 
% name after the dot operator. The syntax looks like this: 
% s.( exampleFieldVar ), where exampleFieldVar is a character string. Here is 
% an example where we can access "val1" using a variable. 
fName = 'val1';
disp( s.( fName ) );
keyboard();

% This method can also be used to add new properties. 
fName = 'newProperty';
s.( fName ) = 'Sweet!';
disp( s.newProperty );
keyboard();

% This dynamic access can be combined with the fieldnames() function to do some
% really powerful things. The fieldnames() function will return a cell array of
% all of the field names on the struct. 
fNames = fieldnames( s );
disp( fNames );
keyboard;

% Now that we have this list of properties, we can use "()" around each element 
% of the struct to actually manipulate the data. Let's show this with a simple
% example, where create a struct with five scalar variables and the increment 
% each variable by one using a loop. 
% - Build the struct
s3 = struct();
s3.noodles = 30;
s3.dexter = 10;
s3.ron = 45;
s3.greg = 27;
% - Get the field names
fNames = fieldnames( s3 );
% - Loop over all fields and increment by one
for iField=1 : numel( fNames )
  s3.( fNames{ iField } ) = s3.( fNames{ iField } ) + 1;
end
disp( s3 );
keyboard();

% You could easily imagine how much more complicated you could make your loops.
% You could look for specific fieldnames, only operate on specific types, or 
% take many other approaches. The possiblities really are endless. 

%% Arrays of structs
% Another very useful feature of structs is that you can build arrays of them. 
% The structs do, however, have to have the same field names. To start with a 
% simple example, lets set the second element of "s3" to another copy of itself. 
s3(2) = s3;
disp( s3 );
keyboard();

% Now we can see that there is a 1x2 array of structs. Structure arrays act 
% just like any other arrays and can be accessed using (). As an example, let's
% update the "noodles" field on the first struct to be equal to twice the 
% current value. 
s3(1).noodles = s3(1).noodles * 2;
disp( s3(1).noodles );
disp( s3(2).noodles );
keyboard();

% We can also remove elements from a structure by setting an element to an empty
% value. 
s3(1) = [];
disp( s3 );
keyboard(); 

% Finally, it can also be convenient to collect values across an array of 
% structs. For example lets same we had an array of structs containing images 
% with geotags and we were interested looking at the locations for all of the 
% images. We can collect these values into an array by capturing the struct 
% output between square brackets. Let's demonstrate this with another example.
% - Build a fake array of structs.
for iS=10 : -1 : 1
    tmp = struct();
    tmp.lat = randi( [-89, 90], 1 );
    tmp.lon = randi( [-179, 180], 1 );
    tmp.img = randn( 16, 16, 3 );
    img( iS ) = tmp;
end
disp( img );
% - Collect all of the lat and lon values into separate arrays
lat = [ img(:).lat ];
lon = [ img(:).lon ];
disp( lat );
disp( lon );
keyboard();

% There are even fancier things that can be done when you are collecting fields 
% that have more than one non-singlton dimension. The trick in this case is to
% use the cat() function to explicitly state how the data should be grouped. 
% As an example, we can collect all of the pixel data from our structs into a 
% new ND array of size 16 x 16 x 3 x 10, where the fourth dimension corresponds 
% to each struct. 
pixelData = cat( 4, img(:).img );
disp( size( pixelData ) );
keyboard();

%% Performance considerations
% As awesome and flexible as structs are, there is of course some cost. In this
% case, the cost comes as increased run time. This is primarily due to the way
% the data is stored in memory. 

% Let's build an example to demonstrate how structs might slow down our code, 
% and then use some of the tricks that we just learned to work around it. 
% - Build a large array of structs
for iS=50000 : -1 : 1
    tmp = struct();
    tmp.lat = randi( [-89, 90], 1 );
    tmp.lon = randi( [-179, 180], 1 );
    tmp.img = randn( 16, 16, 3 );
    img( iS ) = tmp;
end
% - Loop over each image and calculate the average pixel intensity
a = tic();
avgPixelInt = nan( 1, numel( img ) );
for iS=1 : numel( img )
  avgPixelInt( iS ) = mean( img( iS ).img(:) );
end
t1 = toc( a )
% - Now repeat but using cat() to capture the structs
a = tic();
pixelData = cat( 4, img(:).img );
sz = size( pixelData );
pixelData = reshape( pixelData, [ prod( sz(1:3) ), sz(4) ] );
avgPixelInt = mean( pixelData, 1 );
t2 = toc( a )
disp( t1/t2 );

%% end of file
