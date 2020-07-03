##' @title Get separate presentation plot for awareness x trial
##' @param data
##' @return
##' @author Shir Dekel
##' @export
get_plot_separate_trial_awareness <- function(data) {
  
  plot_separate_trial_awareness <- data %>%
    filter(Presentation == "separate") %>%
    ggplot(aes(x = order, y = value, linetype = Awareness)) +
    geom_smooth(method = "loess", color = "black") +
    scale_x_continuous("Trial", breaks = 1:10) +
    theme_apa() +
    labs(y = "Proportion of project acceptance")
  
  return(plot_separate_trial_awareness)
  
}
