#' Plot Variables from Datasets
#'
#' This function can generate histograms, density plots, boxplots, bar plots, or spider (radar) plots
#' depending on the types of variables selected.
#'
#' @param data A data frame containing the dataset to plot.
#' @param x_var A character string specifying the variable to plot on the x-axis (for univariate plots).
#' @param y_var A character string specifying the variable to plot on the y-axis (for bivariate plots).
#' @param plot_type A character string specifying the type of plot. Options include "histogram", "density", "boxplot", "barplot", or "spider".
#' @param fill_color A character string specifying the fill color for the plot (optional).
#' @param group A character string specifying the grouping variable for faceting or grouping within plots (optional).
#' @param title A character string specifying the title of the plot (optional).
#' @param x_lab A character string specifying the label for the x-axis (optional).
#' @param y_lab A character string specifying the label for the y-axis (optional).
#' @param radar_var A vector of variables to plot in a spider (radar) plot (only needed if `plot_type` is "spider").
#' @param radar_color A vector of colors to use for the radar plot (only needed if `plot_type` is "spider").
#' @import ggplot2
#' @import fmsb
#' @examples
#' data <- mtcars
#' multi_plot(data, x_var = "mpg", plot_type = "histogram", fill_color = "skyblue", title = "Histogram of MPG")
#' multi_plot(data, x_var = "cyl", plot_type = "barplot", group = "gear", title = "Barplot of Cylinder Counts")
#' multi_plot(data, x_var = "cyl", y_var = "mpg", plot_type = "boxplot", fill_color = "green", title = "Boxplot of MPG by Cylinders", group = "gear")
#' multi_plot(data, radar_var = c("mpg", "hp", "wt", "qsec"), plot_type = "spider", radar_color = c("blue", "lightblue"))
#' @export
multi_plot <- function(data, x_var = NULL, y_var = NULL, plot_type = "histogram",
                       fill_color = "blue", bin_width = NULL, group = NULL,
                       title = NULL, x_lab = NULL, y_lab = NULL, facet_var = NULL,
                       radar_var = NULL, radar_color = c("blue", "red"),
                       theme_custom = ggplot2::theme_minimal()) {

  # Check for valid plot types
  valid_plot_types <- c("histogram", "density", "boxplot", "barplot", "spider")
  if (!plot_type %in% valid_plot_types) {
    stop("Invalid plot_type. Choose from 'histogram', 'density', 'boxplot', 'barplot', or 'spider'.")
  }

  # Ensure x_var and y_var are columns in the data when necessary
  if (!is.null(x_var) && !(x_var %in% names(data))) {
    stop(paste("The variable", x_var, "is not in the dataset."))
  }
  if (!is.null(y_var) && !(y_var %in% names(data))) {
    stop(paste("The variable", y_var, "is not in the dataset."))
  }
  if (!is.null(group) && !(group %in% names(data))) {
    stop(paste("The grouping variable", group, "is not in the dataset."))
  }

  # Generate plots based on the plot type
  if (plot_type == "histogram") {
    binwidth_value <- if (is.null(bin_width)) diff(range(data[[x_var]], na.rm = TRUE)) / 30 else bin_width
    p <- ggplot2::ggplot(data, ggplot2::aes_string(x = x_var, fill = group)) +
      ggplot2::geom_histogram(binwidth = binwidth_value, color = "black", alpha = 0.7, position = "dodge") +
      theme_custom +
      ggplot2::labs(title = title, x = ifelse(is.null(x_lab), x_var, x_lab), y = ifelse(is.null(y_lab), "Count", y_lab))
    if (!is.null(facet_var) && facet_var %in% names(data)) {
      p <- p + ggplot2::facet_wrap(as.formula(paste("~", facet_var)))
    }
    print(p)

  } else if (plot_type == "density") {
    p <- ggplot2::ggplot(data, ggplot2::aes_string(x = x_var, fill = group)) +
      ggplot2::geom_density(alpha = 0.7) +
      theme_custom +
      ggplot2::labs(title = title, x = ifelse(is.null(x_lab), x_var, x_lab), y = y_lab)
    if (!is.null(facet_var) && facet_var %in% names(data)) {
      p <- p + ggplot2::facet_wrap(as.formula(paste("~", facet_var)))
    }
    print(p)

  } else if (plot_type == "boxplot") {
    if (is.null(y_var)) stop("For boxplot, 'y_var' must be provided.")
    p <- ggplot2::ggplot(data, ggplot2::aes_string(x = x_var, y = y_var, fill = group, group = group)) +
      ggplot2::geom_boxplot(color = "black", alpha = 0.7) +
      theme_custom +
      ggplot2::labs(title = title, x = ifelse(is.null(x_lab), x_var, x_lab), y = ifelse(is.null(y_lab), y_var, y_lab))
    if (!is.null(facet_var) && facet_var %in% names(data)) {
      p <- p + ggplot2::facet_wrap(as.formula(paste("~", facet_var)))
    }
    print(p)

  } else if (plot_type == "barplot") {
    p <- ggplot2::ggplot(data, ggplot2::aes_string(x = x_var, fill = group)) +
      ggplot2::geom_bar(color = "black", alpha = 0.7, position = "dodge") +
      theme_custom +
      ggplot2::labs(title = title, x = ifelse(is.null(x_lab), x_var, x_lab), y = y_lab)
    if (!is.null(facet_var) && facet_var %in% names(data)) {
      p <- p + ggplot2::facet_wrap(as.formula(paste("~", facet_var)))
    }
    print(p)

  } else if (plot_type == "spider") {
    if (is.null(radar_var)) stop("For spider plot, 'radar_var' must be provided.")
    if (!all(sapply(data[radar_var], is.numeric))) {
      stop("All variables in 'radar_var' must be numeric for a radar plot.")
    }

    # Prepare and scale radar data
    radar_data <- data[, radar_var, drop = FALSE]
    radar_data <- radar_data[complete.cases(radar_data), ]

    radar_data_scaled <- as.data.frame(lapply(radar_data, function(x) {
      (x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
    }))

    radar_data_scaled <- rbind(rep(1, ncol(radar_data_scaled)),  # Max values
                               rep(0, ncol(radar_data_scaled)),  # Min values
                               colMeans(radar_data_scaled))     # Average values for a single line
    # browser()
    # Draw clean radar chart
    fmsb::radarchart(as.data.frame(radar_data_scaled), axistype = 1,
                     pcol = radar_color[1],
                     plwd = 3,
                     pfcol = scales::alpha(radar_color[1], 0.1),
                     cglcol = "grey", cglty = 1, cglwd = 0.8,
                     axislabcol = "grey", vlcex = 0.8)
  }
}




multi_plot(mtcars, x_var = "mpg", plot_type = "histogram", fill_color = "skyblue", title = "Histogram of MPG")

multi_plot(mtcars, x_var = "cyl", plot_type = "barplot", title = "Barplot of Cylinder Counts")

multi_plot(mtcars, x_var = "cyl", y_var = "mpg", group = "cyl", plot_type = "boxplot", fill_color = "green", title = "Boxplot of MPG by Cylinders", theme_custom = ggplot2::theme_bw())

multi_plot(mtcars, radar_var = c("mpg", "hp", "wt", "qsec"), plot_type = "spider", radar_color = c("blue", "white"), theme_custom = ggplot2::theme_bw())
