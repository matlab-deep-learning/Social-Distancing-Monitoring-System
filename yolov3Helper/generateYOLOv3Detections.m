function [bboxes,scores,labels] = generateYOLOv3Detections(detections, confidenceThreshold, imageSize, classes)
% Apply following post processing steps to filter the detections:
% * Filter detections based on threshold.
% * Convert bboxes from spatial to pixel dimension.

% Combine the prediction from different heads.
detections(:,1:5) = cellfun(@ reshapePredictions,detections(:,1:5), 'UniformOutput', false);
detections(:,6) = cellfun(@(a,b) reshapeClasses(a,b),detections(:,6),repmat({numel(classes)}, size(detections(:,6))),'UniformOutput', false);
detections = cell2mat(detections);

% Keep detections whose objectness score is greater than thresh.
confidenceTmp = detections(:,1);
detections = detections(confidenceTmp>confidenceThreshold,:);

% Initialize bboxes,scores,labels.
bboxes = zeros(0,'single');
scores = zeros(0,'single');
labels = categorical(cell(0,1));

% Filter the classes based on (confidence score * class probability).
if ~isempty(detections)
    [classProbs, classIdx] = max(detections(:,6:end),[],2);
    detections(:,1) = detections(:,1).*classProbs;
    detections(:,6) = classIdx;
    detections = detections(detections(:,1)>=confidenceThreshold,:);
    if ~isempty(detections)
        
        bboxes = detections(:,2:5);       
        scale = [imageSize(2) imageSize(1) imageSize(2) imageSize(1)];
        bboxes = bboxes.*scale;
        
        % Convert x and y position of detections from centre to top-left.
        % Resize boxes to image size.
        bboxes = convertCenterToTopLeft(bboxes);
        
        scores = detections(:,1);
        labels = detections(:,6);
        classes = classes';
        labels = categorical(classes(labels));
    end
end
end

% Convert x and y position of detections from centre to top-left.
function bboxes = convertCenterToTopLeft(bboxes)
bboxes(:,1) = bboxes(:,1)- bboxes(:,3)/2 + 0.5;
bboxes(:,2) = bboxes(:,2)- bboxes(:,4)/2 + 0.5;
bboxes = floor(bboxes);
bboxes(bboxes<1) = 1;
end

function x = reshapePredictions(pred)
[h,w,c,n] = size(pred);
x = reshape(pred,h*w*c,1,n);
end

function x = reshapeClasses(pred,numclasses)
[h,w,c,n] = size(pred);
numanchors = c/numclasses;
x = reshape(pred,h*w,numclasses,numanchors,n);
x = permute(x,[1,3,2,4]);
[h,w,c,n] = size(x);
x = reshape(x,h*w,c,n);
end