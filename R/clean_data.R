##' @title Clean aggregation data
##' @param data_raw
##'
##' @return
##' @author Shir Dekel
##' @export
clean_data <- function(data_raw) {
  
  data <- data_raw %>%
    rename(Similarity = Alignment) %>%
    mutate_at(c("Similarity", "Awareness"), as.factor) %>%
    filter(condition %>% 
             str_detect("presentation")) %>% 
    separate(condition, c("condition", "Presentation"))
  
  return(data)
  
}
