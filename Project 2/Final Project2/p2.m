% Project 2 : Computer Vision 

clear all;
clear allfonts 
fontcount = 0;

srcfiles=dir('ChineseFonts/*.png');
files= (srcfiles.name);
num=numel(files);

for i = 1 : length(srcfiles)
    number=1;
    filename = strcat('ChineseFonts/',srcfiles(i).name);
    [im,cmap] = imread(sprintf('%s',filename));
    greyim = reshape(cmap(im(:)+1,1),size(im));  %convert to greyscale from colormap
    
     for j =13 : 25: 255
            
            greyimnew = greyim(212:245, j:j+25);
            num=sprintf('%d',number);
           %
            greyimnew= imresize(greyimnew, [34 34]);
           % 
            
            imwrite(greyimnew, strcat('Cropped/',srcfiles(i).name),'png');
            movefile(strcat('Cropped/',srcfiles(i).name),strcat('Cropped/',num))
            if number==10
                number=1;
            else
            number=number+1; 
            end
     end
    
end



       