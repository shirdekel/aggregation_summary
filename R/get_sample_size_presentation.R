##' @title Get sample size for high similarity naive presentation effect

##' @param data 
##'
##' @return
##' @author Shir Dekel
##' @export
get_sample_size_presentation <- function(data) {
  
  data_joint <- data %>%
    filter(Alignment == "High", Awareness == "Not aware", Presentation == "Joint") %>%
    pull(risk)
  
  data_separate <- data %>%
    filter(Alignment == "High", Awareness == "Not aware", Presentation == "Separate") %>%
    pull(risk)
  
  sample_size_presentation <- power.t.test(
    delta = mean(data_joint - data_separate),
    sd = sd(data_joint - data_separate),
    power = .8,
    alternative = c("one.sided")
  ) %>%
    .[["n"]] %>%
    ceiling() %>%
    prod(3)
  
  return(sample_size_presentation)
}
