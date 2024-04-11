evaluateAbundTempLM <- function(lm){

  # Extract original data
  dt <- eval(getCall(lm)$data,environment(formula(lm)))
  
  # Summary
  sink(file.path(Paths[["outputPath"]], "lm_summary.txt"))
  print(summary(lm))
  sink()
  
  # QQ Plot
  png(file = file.path(Paths[["outputPath"]], "lm_QQPlot.png"))
  plot(lm, which = 2, col = "red") # Normal Q-Q Plot
  dev.off()
  plot(lm, which = 2, col = "red") # Normal Q-Q Plot
  
  # Residuals vs Fitted Values
  png(file = file.path(Paths[["outputPath"]], "lm_ResidualsVsFitted.png"))
  plot(lm, 1, col = "blue")
  dev.off()
  plot(lm, 1, col = "blue")
  
  performAnalysis <- if (any(is.null(dt),
                             length(dt) == 0)) FALSE else TRUE
  if (performAnalysis){
    
    # Cross Validation
    sink(file.path(Paths[["outputPath"]], "lm_crossValidation.txt"))
    cv_model <- train(abundance ~ temperature, data = dt, 
                      method = "lm", trControl = trainControl(method = "cv", number = 20))
    print(cv_model)
    sink()
    
    # Error rate
    errR <- summary(lm)$sigma/mean(dt$abundance)
    
    return(list(summary = summary(lm),
                qqPlot = file.path(Paths[["outputPath"]], "lm_QQPlot.png"),
                residualsVsFitted = file.path(Paths[["outputPath"]], "lm_ResidualsVsFitted.png"),
                crossValidation = cv_model,
                errorRate = errR))
  } else {
    
    return(list(summary = summary(lm),
                qqPlot = file.path(Paths[["outputPath"]], "lm_QQPlot.png"),
                residualsVsFitted = file.path(Paths[["outputPath"]], "lm_ResidualsVsFitted.png"),
                crossValidation = NULL,
                errorRate = NULL))
    
    warning("Dataset could not be extracted from model: cross validation and error rate will not be calculated")
    
  }
}