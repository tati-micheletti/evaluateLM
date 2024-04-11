---
title: "evaluateLM Manual"
subtitle: "v.0.0.0.9000"
date: "Last updated: 2024-04-11"
output:
  bookdown::html_document2:
    toc: true
    toc_float: true
    theme: sandstone
    number_sections: false
    df_print: paged
    keep_md: yes
editor_options:
  chunk_output_type: console
  bibliography: citations/references_evaluateLM.bib
link-citations: true
always_allow_html: true
---

# evaluateLM Module

<!-- the following are text references used in captions for LaTeX compatibility -->
(ref:evaluateLM) *evaluateLM*



[![made-with-Markdown](figures/markdownBadge.png)](https://commonmark.org)

<!-- if knitting to pdf remember to add the pandoc_args: ["--extract-media", "."] option to yml in order to get the badge images -->

#### Authors:

Tati Micheletti <tati.micheletti@gmail.com> [aut, cre]
<!-- ideally separate authors with new lines, '\n' not working -->

## Module Overview

### Module summary

This module was created to exemplify an evaluation procedure for a linear model. The model 
prints prediction error (Residual Standard Error, or RSE), how well the model fits the data 
(R-squared and adjusted R2, or R2), and plots residual vs fitted values, Normal Q-Q Plot, 
performs Cross-Validation.

### Module inputs and parameters

Describe input data required by the module and how to obtain it (e.g., directly from online sources or supplied by other modules)
If `sourceURL` is specified, `downloadData("evaluateLM", "C:/Users/Tati/Documents/GitHub")` may be sufficient.
Table \@ref(tab:moduleInputs-evaluateLM) shows the full list of module inputs.

<table class="table" style="color: black; margin-left: auto; margin-right: auto;">
<caption>(\#tab:moduleInputs-evaluateLM)(\#tab:moduleInputs-evaluateLM)List of (ref:evaluateLM) input objects and their description.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> objectName </th>
   <th style="text-align:left;"> objectClass </th>
   <th style="text-align:left;"> desc </th>
   <th style="text-align:left;"> sourceURL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> abundTempLM </td>
   <td style="text-align:left;"> lm </td>
   <td style="text-align:left;"> A fitted model (of the `lm` class) of, for example, abundance as a function of temperature. </td>
   <td style="text-align:left;"> NA </td>
  </tr>
</tbody>
</table>

Provide a summary of user-visible parameters (Table \@ref(tab:moduleParams-evaluateLM))


<table class="table" style="color: black; margin-left: auto; margin-right: auto;">
<caption>(\#tab:moduleParams-evaluateLM)(\#tab:moduleParams-evaluateLM)List of (ref:evaluateLM) parameters and their description.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> paramName </th>
   <th style="text-align:left;"> paramClass </th>
   <th style="text-align:left;"> default </th>
   <th style="text-align:left;"> min </th>
   <th style="text-align:left;"> max </th>
   <th style="text-align:left;"> paramDesc </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> .useCache </td>
   <td style="text-align:left;"> logical </td>
   <td style="text-align:left;"> FALSE </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Should caching of events or module be used? </td>
  </tr>
</tbody>
</table>

### Events

The only event that happens (`evaluate`) tests if a LM is present at the end of a run, and presents 
all the plots and statistics described above.

### Module outputs

Description of the module outputs (Table \@ref(tab:moduleOutputs-evaluateLM)).

<table class="table" style="color: black; margin-left: auto; margin-right: auto;">
<caption>(\#tab:moduleOutputs-evaluateLM)(\#tab:moduleOutputs-evaluateLM)List of (ref:evaluateLM) outputs and their description.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> objectName </th>
   <th style="text-align:left;"> objectClass </th>
   <th style="text-align:left;"> desc </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> modDiagnostics </td>
   <td style="text-align:left;"> list </td>
   <td style="text-align:left;"> List of lm model diagnostics: prediction error (ResidualStandard Error, or RSE), how well the model fits the data(R-squared and adjusted R2, or R2), and plots residual vs fittedvalues, Normal Q-Q Plot, ans performs Cross-Validation. </td>
  </tr>
</tbody>
</table>

### Links to other modules

This module is stand-alone (although will not produce anything if the object `lm` is not 
created in the project), but has been created to be ran with the module `speciesAbundTempLM` 
as a way of demonstrating `SpaDES`, but can be expanded and used with other modules.

### Getting help

- Please use GitHub issues (https://github.com/tati-micheletti/evaluateLM/issues/new) 
if you encounter any problems in using this module.
