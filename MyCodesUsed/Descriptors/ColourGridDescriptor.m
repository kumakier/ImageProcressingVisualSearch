function GriddingOfImage=ColourGridDescriptor(img)

I = double(img)./256;


%Create the cell sizes
cellSize = [floor(size(I,2)/40) floor(size(I,1)/40)];

%Padd the grid with Zeros in each cell
Grid = zeros(cellSize(2),cellSize(1),3);


%Set up the size of the grid


for  cX = 0:19
    for  cY = 0:19
        Block = 0;
        for x = 1 + cellSize(2)*cY:cellSize(2) + cellSize(2)*cY
         for y = 1 + cellSize(1)*cX:cellSize(1) + cellSize(1)*cX
             Block = Block + I(x,y,:);
         end
        end
        Block = Block/(cellSize(1)*cellSize(2));
        Grid(cY+1,cX+1,:) = Block;
    end
end

%do RGB values for each grid..
R = reshape(Grid(:,:,1),1,size(Grid(:,:,1),1)*size(Grid(:,:,1),2));
G = reshape(Grid(:,:,2),1,size(Grid(:,:,2),1)*size(Grid(:,:,2),2));
B = reshape(Grid(:,:,3),1,size(Grid(:,:,3),1)*size(Grid(:,:,3),2));

GriddingOfImage = [R;G;B];
GriddingOfImage = reshape(GriddingOfImage,1,size(GriddingOfImage,2)*3);
return


