##' @title Get plot for follow-up predictions
##' @return
##' @author Shir Dekel
##' @export
get_plot_predictions <- function() {
  
  condition <- c("Separate Naive", "Joint Naive", "Separate Aware")
  distribution <- c("No distribution", "Distribution")
  means <- c(0.2, 0.4, 0.3, 0.5, 0.3, 0.5)
  dv <- means %>% 
    map(~rtnorm(n = 50, mean = .x, sd = 0.1, a = 0, b = 1)) %>% 
    transpose() %>% 
    unlist() 
  
  data <- data.frame(Condition = condition %>% 
                       rep(each = 2) %>% 
                       fct_relevel(condition),
                     Distribution = distribution %>% 
                       rep(3) %>% 
                       fct_relevel(distribution),
                     dv = dv)

  plot_predictions <- data %>% 
          apa_plot(iv1 = "Condition",
                   iv2 = "Distribution",
                   dv = "dv",
                   dv.lab = "Proportion of project acceptance")
  
  return(plot_predictions)

}
