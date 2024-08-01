# Create a newrelic dashboard which having widgets of markdown, billboard, line, table, bar and  each widget type having 2-3 charts
# Using normal terraform script
# Using for-each module
# Using for-each, dynamic block with module
# Using count

resource "newrelic_one_dashboard" "exampledash" {
  name        = "New Relic Terraform Example"
  permissions = "public_read_only"

  page {
    name = "New Relic Terraform Example"

    widget_billboard {
      title  = "Avg Page Load Time"
      row    = 1
      column = 1
      width  = 6
      height = 3

      nrql_query {
        query = "SELECT average(duration) AS 'Avg Page Load Time' FROM PageView WHERE appName = 'relicstaurants' SINCE 1 day ago"
      }
    }

    widget_billboard {
      title  = "Error Rate Overview"
      row    = 1
      column = 7
      width  = 6
      height = 3

      nrql_query {
          query = "SELECT count(*) AS 'Total Errors' FROM JavaScriptError WHERE appName = 'relicstaurants' SINCE 1 day ago"
      }
    }


    widget_bar {
      title  = "Page Load Time"
      row    = 2
      column = 1
      width  = 6
      height = 3

      nrql_query {
        query = "SELECT average(duration) AS 'Page Load Time' FROM PageView WHERE appName = 'relicstaurants' SINCE 1 hour ago TIMESERIES"

      }

      # Must be another dashboard GUID
      # linked_entity_guids = ["abc123"]
    }

    widget_bar {
      title  = "Average transaction duration, by application"
      row    = 2
      column = 7
      width  = 6
      height = 3

      nrql_query {
        # account_id = 12345
        query      =  "SELECT count(*) AS 'Error Rate' FROM JavaScriptError WHERE appName = 'relicstaurants' SINCE 1 hour ago TIMESERIES"
      }

      # Must be another dashboard GUID
      filter_current_dashboard = true

      # color customization
      colors {
        color = "#722727"
        series_overrides {
          color = "#722322"
          series_name = "Node"
        }
        series_overrides {
          color = "#236f70"
          series_name = "Java"
        }
      }
    }

    widget_line {
      title = "User Sessions Over Time"
      row = 3
      column = 1
      width = 6
      height = 3
      ignore_time_range = false
      y_axis_left_max = 100
      y_axis_left_min = 0
      legend_enabled = true
      
      nrql_query {
        query = "SELECT count(*) AS 'Sessions' FROM PageView WHERE appName = 'relicstaurants' TIMESERIES SINCE 1 day ago"
      }
      
      null_values {
        null_value = "zero" # default, preserve, remove, zero
        series_overrides { # used to customize null values of individual series
          null_value = "zero"
          series_name = "Sessions"
        }
      }
      
      units {
        unit = "sessions" # unit on your Y axis and in each of your series
        series_overrides { 
          unit = "sessions"
          series_name = "Sessions"
        }
      }
      
      colors {
        color = "#2ca02c"
        series_overrides {
          color = "#2ca02c"
          series_name = "Sessions"
        }
      }
      
      y_axis_left_zero = true # Specifies if the values on the graph to be rendered need to be fit to scale, or printed within the specified range.
      
      y_axis_right {
        y_axis_right_max = 10
        y_axis_right_min = 0
        y_axis_right_series = ["Error Rate"]
        y_axis_right_zero = true
      }
      
      threshold {
        name = "High Sessions"
        from = 80
        to = 100
        severity = "warning" # warning, severe, critical, success, unavailable
      }
      
      is_label_visible = true
    }

    widget_line {
      title = "Error Rate Over Time"
      row   = 3
      column = 7
      width  = 4
      height = 6
      ignore_time_range = false
      y_axis_left_max = 50
      y_axis_left_min = 0
      legend_enabled = true

      nrql_query {
          query = "SELECT count(*) AS 'Errors' FROM JavaScriptError WHERE appName = 'relicstaurants' TIMESERIES SINCE 1 day ago"
      }

      null_values {
        null_value = "zero" # default, preserve, remove, zero
        series_overrides { # used to customize null values of individual series
          null_value = "zero"
          series_name = "Errors"
        }
      }

      units {
        unit = "errors" # unit on your Y axis and in each of your series
        series_overrides { 
          unit = "errors"
          series_name = "Errors"
        }
      }

      colors {
        color = "#d62728"
        series_overrides {
          color = "#d62728"
          series_name = "Errors"
        }
      }

      y_axis_left_zero = true # Specifies if the values on the graph to be rendered need to be fit to scale, or printed within the specified range.

      y_axis_right {
        y_axis_right_max = 20
        y_axis_right_min = 0
        y_axis_right_series = ["Sessions"]
        y_axis_right_zero = true
      }

      threshold {
        name = "High Errors"
        from = 10
        to = 20
        severity = "critical" # warning, severe, critical, success, unavailable
      }

      is_label_visible = true
    }
  }

  # variable {
  #     default_values     = ["value"]
  #     is_multi_selection = true
  #     item {
  #       title = "item"
  #       value = "ITEM"
  #     }
  #     name = "variable"
  #     nrql_query {
  #       # account_ids = [12345]
  #       query       = "FROM Transaction SELECT average(duration) FACET appName"
  #     }
  #     replacement_strategy = "default"
  #     title                = "title"
  #     type                 = "nrql"
  # }
}