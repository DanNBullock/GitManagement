function wma_makeGitDir(functionName, targetDir, sourceDir)

functionPath=which(functionName);
[filepath,name,ext] = fileparts(functionPath);
dirName=name;

dependancyList=matlab.codetools.requiredFilesAndProducts(functionPath);

gitDir=fullfile(targetDir,dirName);

mkdir(gitDir);

sourceList=dir(sourceDir);
fileBool=~[sourceList.isdir];
fileIndexes=find(fileBool);

for iFiles=1:length(fileIndexes)
    fileName{iFiles}=fullfile(sourceDir,sourceList(fileIndexes(iFiles)).name);
end

intersection = fileName(ismember(fileName, dependancyList));



for iFunctions=1:length(intersection)
    copyfile( intersection{iFunctions}, gitDir);
end

end



