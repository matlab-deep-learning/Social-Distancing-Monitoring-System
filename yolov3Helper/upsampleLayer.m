% Upsample by replicating neighbouring pixel values.

% Copyright 2019 The MathWorks, Inc.

classdef upsampleLayer < nnet.layer.Layer   
    properties
       
        % factor to upsample the input.
        UpSampleFactor
    end
    
    methods
        function layer = upsampleLayer(factor, name)
            
            % Set layer name.
            layer.Name = name;
            
            % Set layer description.
            layer.Description = "upSamplingLayer with factor " + factor;
            
            % Stride by which layer is upsampled.
            layer.UpSampleFactor = factor;
        end
        
        function Z = predict(layer, X)
            % Z = predict(layer, X) forwards the input data X through the
            % layer and outputs the result Z.
            
            Z = repelem(X,layer.UpSampleFactor,layer.UpSampleFactor);
        end
    end
end