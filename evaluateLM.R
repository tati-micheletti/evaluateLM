defineModule(sim, list(
  name = "evaluateLM",
  description = paste0("This module was created to exemplify an evaluation procedure for",
                       "a linear model. The model prints prediction error (Residual",
                       "Standard Error, or RSE), how well the model fits the data",
                       "(R-squared and adjusted R2, or R2), and plots residual vs fitted",
                       "values, Normal Q-Q Plot, ans performs Cross-Validation."),
  keywords = c("example", "SpaDES tutorial"),
  authors = structure(list(list(given = "Tati", family = "Micheletti", role = c("aut", "cre"), 
                                email = "tati.micheletti@gmail.com", comment = NULL)), 
                      class = "person"),
  childModules = character(0),
  version = list(evaluateLM = "0.0.0.9000"),
  timeframe = as.POSIXlt(c(NA, NA)),
  timeunit = "year",
  citation = list("citation.bib"),
  documentation = list("NEWS.md", "README.md", "evaluateLM.Rmd"),
  reqdPkgs = list("SpaDES.core (>= 2.0.3)", "ggplot2", "caret"),
  parameters = bindrows(
    defineParameter(".useCache", "logical", FALSE, NA, NA,
                    "Should caching of events or module be used?")
  ),
  inputObjects = bindrows(
    expectsInput(objectName = "lm", 
                 objectClass = "lm", 
                 desc = paste0("A fitted model (of the `lm` class) of, for example,",
                               " abundance as a function of temperature."), 
                 sourceURL = NA)
  ),
  outputObjects = bindrows(
    createsOutput(objectName = "modDiagnostics", 
                  objectClass = "list", 
                  desc = paste0("List of lm model diagnostics: prediction error (Residual",
                                "Standard Error, or RSE), how well the model fits the data",
                                "(R-squared and adjusted R2, or R2), and plots residual vs fitted",
                                "values, Normal Q-Q Plot, ans performs Cross-Validation."))
  )
))

## event types
#   - type `init` is required for initialization

doEvent.evaluateLM = function(sim, eventTime, eventType) {
  switch(
    eventType,
    init = {
      sim <- scheduleEvent(sim, end(sim), "evaluateLM", "evaluate")
    },
    evaluate = {
      sim$modDiagnostics <- evaluateAbundTempLM(lm = sim$lm)
    },
    warning(paste("Undefined event type: \'", current(sim)[1, "eventType", with = FALSE],
                  "\' in module \'", current(sim)[1, "moduleName", with = FALSE], "\'", sep = ""))
  )
  return(invisible(sim))
}

.inputObjects <- function(sim) {
  if (!suppliedElsewhere(object = "lm", sim = sim)) {
    # If not supplied by modules, generate data
    set.seed(1)
    x <- rnorm(100, 10, 2) # Predictor variable
    y <- 5 + 2 * x + rnorm(100, 0, 2) # Dependent variable with noise
    x_counts <- pmax(round(x), 0)
    dt <- data.frame(X = x_counts, Y = y)
    names(dt) <- c("abundance", "temperature")
    sim$lm <- lm(abundance ~ temperature, data = dt)
    warning("Object `lm` not being produced by any module. Using SIMULATED data!")
  }
  return(invisible(sim))
}
