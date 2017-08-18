function varargout = identTime(varargin)
    [lhs , rhs] = argn()
	if ( rhs <> 1 ) then
		errmsg = msprintf(gettext("%s: Wrong number of input arguments"), "identTime");
		error(errmsg)
	elseif typeof(varargin(1)) <> "iddata" then
        error(msprintf(gettext("%s:Input model must be ""iddata"" type.\n"),"identTime"))
    end
    plantData = varargin(1)
    //disp('yolo')
    inputData = plantData.InputData;inputData = size(inputData,'r')
    outputData = plantData.OutputData;outputData = size(outputData,'r')
    sampleNumb = max(inputData,outputData)
    timeData = (0:sampleNumb-1)*plantData.Ts
    t = tlist(['identTime','samples','start','end','Frequency','TimeSeries'],sampleNumb,0,timeData($),1/plantData.Ts,timeData)
    varargout(1) = t
endfunction

function %identTime_p(mytlist)
    f = fieldnames(mytlist)
    mprintf("\t    samples : %d\n",mytlist.samples)
    mprintf("\t      start : %d\n",mytlist.start)
    mprintf("\t        end : %d\n",mytlist.end)
    if ceil(mytlist.Frequency)-mytlist.Frequency then
        mprintf("\t  Frequency : %.4f\n",mytlist.Frequency)
    else
        mprintf("\t  Frequency : %d\n",mytlist.Frequency)
    end
    timeData = mytlist.TimeSeries
    mprintf("\t TimeSeries : %.2f, %.2f, . ,%.2f",timeData(1),timeData(2),timeData($))
    
endfunction
