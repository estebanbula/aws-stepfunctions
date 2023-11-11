package com.estebanbula.lambda;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.estebanbula.model.InputObject;
import com.estebanbula.model.StepFunctionObject;
import com.estebanbula.model.StepResult;

import java.util.concurrent.atomic.AtomicReference;

public class ValidateLambda implements RequestHandler<InputObject, StepFunctionObject> {

    @Override
    public StepFunctionObject handleRequest(InputObject input, Context context) {
        System.out.println("input" + input);

        AtomicReference<String> bucket = new AtomicReference<>("");
        AtomicReference<String> key = new AtomicReference<>("");
        input.getEvent().getRecords().forEach(record -> {
            bucket.set(record.getS3().getBucket().getName());
            key.set(record.getS3().getFile().getKey());
        });

        StepFunctionObject stepFunctionObj = new StepFunctionObject();

        if (bucket.get() != null && key.get() != null && !bucket.get().isEmpty() && !key.get().isEmpty()) {
            stepFunctionObj.setBucket(bucket.get());
            stepFunctionObj.setKey(key.get());
        } else {
            throw new RuntimeException("Validation failed.");
        }

        StepResult r = new StepResult();
        r.setCode("200");
        r.setMessage("Validation completed successfully.");
        stepFunctionObj.setValidate(r);

        return stepFunctionObj;
    }
}
