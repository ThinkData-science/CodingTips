%% Array Order and Permuting
% This tutorial discusses the order of arrays and how to efficiently loop over
% data in MATLAB. In particular, the permute() function is introduced and used
% to orient data to access any arbitrary dimensions. 
%
%% Array Order

% When dealing with multi-dimensional or N-dimensional (ND) arrays it is 
% important to be aware of how the data are stored in memory. This is referred 
% to as array ordering. There are two general conventions: row-major and 
% column-major ordering. These two different methods simply refer to which 
% elements of the ND array area contiguous in memory, as well as, how such 
% arrays should be linearly indexed. 

% Here is a simple example of a 3 x 3 major in both conventions. So basically, 
% we count elements down the columns for column-major and along the rows for
% row-major. 
colMaj = [ 1, 4, 7; 2, 5, 8; 3, 6, 9 ];
disp( colMaj )
rowMaj = [ 1:3; 4:6; 7:9 ];
disp( rowMaj )
keyboard();

% We can trivially see how MATLAB stores the data by using the ':' operator, 
% which will unwrap the data. Since MATLAB is column-major, you can see that
% the colMaj matrix returns the index order.
disp( colMaj(:) )
disp( rowMaj(:) )
keyboard();

% To make this a little more clear, we can build a simple animation. Don't 
% worry if you don't follow all of the plotting commands. 
f = figure();
set( f, 'units', 'inches' );
set( f, 'position', [ 1, 1, 8, 6 ] );
arrLeft = zeros( 1, 9 ); % linear array
arrRight = zeros( 1, 9 ); % linear array
cMap = cat( 1, [ 1 1 1 ], jet( 9 ) ); % common color map
% - Column-major order matrix (left)
a11 = subplot( 4, 2, [ 1, 3, 5] );
imagesc( colMaj ); 
set( a11, 'xticklabel', '' );
set( a11, 'yticklabel', '' );
axis( a11, 'equal' );
colormap( a11, cMap( 2:end, : ) );
title( 'Column-Major Order' );
set( a11, 'fontsize', 16 );
% - Row-major order matrix (right)
a12 = subplot( 4, 2, [2, 4, 6] );
imagesc( colMaj ); 
set( a12, 'xticklabel', '' );
set( a12, 'yticklabel', '' );
axis( a12, 'equal' );
colormap( a12, cMap( 2:end, : ) );
title( 'Row-Major Order' );
set( a12, 'fontsize', 16 );
% - Linear array (left)
a21 = subplot( 4, 2, 7 );
hLeft = imagesc( arrLeft );
caxis( a21, [0, 9] );
colormap( a21, cMap );
set( a21, 'xtick', 1:9 );
set( a21, 'yticklabel', '' );
axis( a21, 'equal' );
set( a21, 'fontsize', 16 );
% - Linear array (right)
a22 = subplot( 4, 2, 8 );
hRight = imagesc( arrRight );
caxis( a22, [0, 9] );
colormap( a22, cMap );
set( a22, 'xtick', 1:9 );
set( a22, 'yticklabel', '' );
axis( a22, 'equal' );
set( a22, 'fontsize', 16 );
% - Animate everything
nAnimations = 3
for iView=1 : nAnimations

  arrLeft = zeros( 1, 9 ); % reset to white
  arrRight = zeros( 1, 9 ); % reset to white
  [ anch1, anch2 ] = ndgrid( 0.5 : 1 : 2.5, 0.5 : 1 : 2.5 );
  for ix1=1 : 9
    keyboard;
    pause( 1 );
    arrLeft( 1, ix1, : ) = colMaj( ix1 );
    arrRight( 1, ix1, : ) = rowMaj( ix1 );
    set( hLeft, 'cdata', arrLeft );
    set( hRight, 'cdata', arrRight );
    if ix1 > 1
      delete( hl1 );
      delete( hl2 );
    end
    hl1 = rectangle( a11, 'position', [ anch2( ix1 ), anch1( ix1 ), 1, 1 ], ...
      'edgecolor', 'r', 'linewidth', 2 );
    hl2 = rectangle( a12, 'position', [ anch1( ix1 ), anch2( ix1 ), 1, 1 ], ...
      'edgecolor', 'r', 'linewidth', 2 );
    drawnow();
  end
  delete( hl1 );
  delete( hl2 );

end

%% Looping over data
% So why does this all matter? Well, when we are looping over data, array order
% can actually have a significant impact on the run time. It is much more 
% efficient to read access data that is contiguous in memory. So having the 
% knowledge of how our data is organized in memory can also help us write more
% computationally efficient code. 

% Let's motivate this with a simple example. Suppose we have a collection of 
% images that we want to operate on. The images are of size (nX, nY) and we have
% nI images in our dataset. How should we arrange our data: [nX, nY, nI] or
% [nI, nX, nY]? 
nX = 128;
nY = 128;
nI = 50000;
% - Arrange images at the first two dimension
imageData = randn( nX, nY, nI );
a = tic();
for ix1=1 : nI
  thisImg = imageData( :, :, ix1 );
end
et1 = toc( a );
% - Arrange images at the last two dimensions
imageData = randn( nI, nX, nY );
a = tic();
for ix1=1 : nI
  thisImg = imageData( ix1, :, : );
end
et2 = toc( a );
fprintf( 'Looping over the last dimension: %0.4f seconds\n', et1 );
fprintf( 'Looping over the first dimension: %0.4f seconds\n', et2 );
fprintf( '%0.1f factor increase\n', et2/et1 );

%% Permute()
% MATLAB includes a function called permute() which is n-dimensional 
% generalization of a matrix transpose. 

% Time the permute() command_line_path

% Re-create the experiment but include permute()
% - Arrange images at the first two dimension
imageData = randn( nX, nY, nI );
a = tic();
for ix1=1 : nI
  thisImg = imageData( :, :, ix1 );
end
et1 = toc( a );
% - Arrange images at the last two dimensions
imageData = randn( nI, nX, nY );
imageData = permute( imageData, [ 2, 3, 1 ] );
a = tic();
for ix1=1 : nI
  thisImg = imageData( :, :, ix1 );
end
et2 = toc( a );
fprintf( 'Looping over the last dimension: %0.4f seconds\n', et1 );
fprintf( 'Permute and loop over the last dimension: %0.4f seconds\n', et2 );
fprintf( '%0.1f factor increase\n', et2/et1 );


%% end of file
