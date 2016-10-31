fontcount = 0;
temp = 0;

for j = 1:10
    nTemp = 0;
    CropImage = dir(strcat('cropped/',num2str(j),'/'));
    for i=1:length(CropImage)
        nTemp = nTemp + 1;
        fname = CropImage(i).name;
        if ~isempty(strfind(fname,'.png'))
            image = imread(sprintf('cropped/%s/%s',num2str(j),fname));
            fontcount = fontcount + 1; 
            
            data(:,:,fontcount) = im2single(imresize(image,[32 32]));
            
            labels(:,fontcount) = j;
            id(:,fontcount) = fontcount;
            temp = mod(fontcount,3);
            if nTemp < 100
                set(:,fontcount) = 1;
            else
                set(:,fontcount) = 2;
            end
            
            %fprintf('%s\n',fname);
        end
    end
end

 classes = [1 2 3 4 5 6 7 8 9 10];
 classes = transpose(classes);


images.data = data;
images.label = labels;
images.id = id;
images.set = set;
meta.classes = classes;
meta.sets(1) = cellstr('training');
meta.sets(2) = cellstr('test');

chardatabase.images = images;
chardatabase.meta = meta;
save('chardatabase','chardatabase');