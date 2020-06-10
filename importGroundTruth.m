function TownCentregroundtruth1 = importGroundTruth(filename, dataLines)
%% Auto-generated code from import tool

if nargin < 2
    dataLines = [1, Inf];
end

opts = delimitedTextImportOptions("NumVariables", 12);

opts.DataLines = dataLines;
opts.Delimiter = ",";

opts.VariableNames = ["Var1", "FrameNum", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "bodyLeft", "bodyTop", "bodyRight", "bodyBottom"];
opts.SelectedVariableNames = ["FrameNum", "bodyLeft", "bodyTop", "bodyRight", "bodyBottom"];
opts.VariableTypes = ["string", "double", "string", "string", "string", "string", "string", "string", "double", "double", "double", "double"];

opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

opts = setvaropts(opts, ["Var1", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8"], "EmptyFieldRule", "auto");

TownCentregroundtruth1 = readtable(filename, opts);

end
% Copyright 2020 The MathWorks, Inc.
