package com.estebanbula.lambda;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.estebanbula.model.StepFunctionObject;
import com.estebanbula.model.StepResult;

public class ProcessLambda implements RequestHandler<StepFunctionObject, StepFunctionObject> {

    @Override
    public StepFunctionObject handleRequest(StepFunctionObject input, Context context) {
        System.out.println("Input: " + input);

        StepResult result = new StepResult();
        result.setCode("200");
        result.setMessage("Process completed successfully.");
        input.setProcess(result);

        return input;
    }
}
