the_plan <-
  drake_plan(
    
    target_name = target(
      command = {
        rmarkdown::render(knitr_in("doc/aggregation_summary.Rmd"))
        file_out("doc/aggregation_summary.html")
      }
    )
    
  )
