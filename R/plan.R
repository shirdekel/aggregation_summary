the_plan <-
  drake_plan(
    seed = set.seed(42),
    data = get_data(),
    full = apa_plot(data = data, 
                    iv1 = "Awareness", 
                    iv2 = "Alignment",
                    iv3 = Presentation,
                    iv1.lab = "Awareness of project set size",
                    dv = "risk",
                    dv.lab = "Mean proportions of project acceptance"),
    awareness = apa_plot(data = data, 
                         iv1 = "Awareness", 
                         iv1.lab = "Awareness of project set size",
                         dv = "risk",
                         dv.lab = "Mean proportions of project acceptance"),
    presentation = apa_plot(data = data, 
                            iv1 = "Presentation", 
                            iv1.lab = "Awareness of project set size",
                            dv = "risk",
                            dv.lab = "Mean proportions of project acceptance"),
    similarity_presentation = apa_plot(data = data, 
                                       iv1 = "Alignment",
                                       iv1.lab = "Similarity",
                                       iv2 = "Presentation", 
                                       dv = "risk",
                                       dv.lab = "Mean proportions of project acceptance"),
    data_trials = clean_data(aggregation::dat),
    plot_separate_trial_awareness = get_plot_separate_trial_awareness(data_trials),
    plot_predictions = get_plot_predictions(),
    sample_size_presentation = get_sample_size_presentation(data),
    memo = target(
      command = {
        file_in()
        rmarkdown::render(knitr_in("doc/aggregation_summary.Rmd"))
        file_out("doc/aggregation_summary.pdf")
      }
    )
    
  )
