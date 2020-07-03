##' @title Get data

##' @return
##' @author Shir Dekel
##' @export
get_data <- function() {

  data <- aggregation::dat %>%
    filter(str_detect(condition, "presentation")) %>%
    separate(condition, c("condition", "Presentation")) %>%
    group_by(subject, Presentation) %>%
    nest() %>%
    mutate(risk = map_dbl(data, shiR::getrisk)) %>%
    unnest(data) %>%
    ungroup() %>%
    mutate_at("Presentation", str_to_title) %>%
    mutate(Awareness = Awareness %>% 
             recode("Naive" = "Not aware")) %>% 
    mutate_at(c("Alignment", "Awareness", "Presentation"), as.factor) %>%
    group_by(id, Presentation, Alignment, Awareness, risk) %>%
    nest() %>%
    ungroup() %>%
    mutate(data = NULL)
  
  return(data)

}
