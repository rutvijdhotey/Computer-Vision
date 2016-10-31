% Project 2 : Computer Vision 


fontnames = dir('ChineseFonts/');
clear allfonts 
fontcount = 0;

for i=1:1 %length(fontnames)
    fname = fontnames(i).name;
    if ~isempty(strfind(fname,'.png'))
        [im,cmap] = imread(sprintf('ChineseFonts/%s',fname));
        greyim = reshape(cmap(im(:)+1,1),size(im));  %convert to greyscale from colormap
        fontcount = fontcount + 1;
        allfonts(:,:,fontcount) = single(greyim);
        fprintf('%s\n',fname);
    end
end

fprintf('loaded %d font styles\n',fontcount);


figure(1); clf; colormap(gray); imagesc(mean(allfonts,3)); axis image
