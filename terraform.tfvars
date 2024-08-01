region = "US"

# dashboard_details = {
#     name        = "New Relic Terraform Example"
#     permissions = "public_read_only"
#     page = {
#         name = "New Relic Terraform Example"
    
#         widget_billboard = {
#             "0" = {
#                 title  = "Requests per minute"
#                 row    = 1
#                 column = 1
#                 width  = 6
#                 height = 3
#                 query = "FROM Transaction SELECT rate(count(*), 1 minute)"
#             }
#         }


#         widget_bar = {
#             "0" = {

#                 title  = "Average transaction duration, by application"
#                 row    = 1
#                 column = 7
#                 width  = 6
#                 height = 3
#                 query      = "FROM Transaction SELECT average(duration) FACET appName"

#                 # Must be another dashboard GUID
#                 linked_entity_guids = ["abc123"]
                
#             }
#             "1" = {
#                 title  = "Average transaction duration, by application"
#                 row    = 4
#                 column = 1
#                 width  = 6
#                 height = 3
#                 query      = "FROM Transaction SELECT average(duration) FACET appName"
                
#                 # Must be another dashboard GUID
#                 filter_current_dashboard = true

#                 # color customization
#                 colors = {
#                     color = "#722727"
#                     series_overrides = {
#                         "0" = {
#                             color = "#722322"
#                             series_name = "Node"
#                         }
#                         "1" = {
#                             color = "#236f70"
#                             series_name = "Java"
#                         }
#                     }
#                 }
#             }
#         }

#         widget_line = {
#         title  = "Average transaction duration and the request per minute, by application"
#         row    = 4
#         column = 7
#         width  = 6
#         height = 3

#         nrql_query = {
#             "0" = {
#                 query      = "FROM Transaction select max(duration) as 'max duration' where httpResponseCode = '504' timeseries since 5 minutes ago"
#             }
#             "1" = {
#                 query = "FROM Transaction SELECT rate(count(*), 1 minute)"
#             }
#         }

#         legend_enabled = true
#         ignore_time_range = false
#         y_axis_left_zero = true
#         y_axis_left_min = 0
#         y_axis_left_max = 1

#         y_axis_right = {
#             y_axis_right_zero   = true
#             y_axis_right_min    = 0
#             y_axis_right_max    = 300
#             y_axis_right_series = ["A", "B"]
#         }

#         is_label_visible = true

#         threshold = {
#             "0" = {
#                 name     = "Duration Threshold"
#                 from     = 1 
#                 to       = 2
#                 severity = "critical"
#             }
#             "1" = {
#                 name     = "Duration Threshold Two"
#                 from     = 2.1
#                 to       = 3.3
#                 severity = "warning"
#             }
#         }

#         units = {
#             unit = "ms"
#             series_overrides = {
#             unit = "ms"
#             series_name = "max duration"
#             }
#         }


#         }

#         widget_markdown = {
#         title  = "Dashboard Note"
#         row    = 7
#         column = 1
#         width  = 12
#         height = 3

#         text = "### Helpful Links\n\n* [New Relic One](https://one.newrelic.com)\n* [Developer Portal](https://developer.newrelic.com)"
#         }

#         widget_line = {
#             title = "Overall CPU % Statistics"
#             row = 1
#             column = 5
#             height = 3
#             width = 4
#             query = "SELECT average(cpuSystemPercent), average(cpuUserPercent), average(cpuIdlePercent), average(cpuIOWaitPercent) FROM SystemSample  SINCE 1 hour ago TIMESERIES"
#             facet_show_other_series = false
#             legend_enabled = true
#             ignore_time_range = false
#             y_axis_left_zero = true
#             y_axis_left_min = 0
#             y_axis_left_max = 0

#             null_values = {
#                 null_value = "default"

#                 series_overrides = {
#                     "0" = {
#                         null_value = "remove"
#                         series_name = "Avg Cpu User Percent"
#                     }
#                     "1" = {
#                         null_value = "zero"
#                         series_name = "Avg Cpu Idle Percent"
#                     }
#                     "2" = {
#                         null_value = "default"
#                         series_name = "Avg Cpu IO Wait Percent"
#                     }
#                     "3" = {
#                         null_value = "preserve"
#                         series_name = "Avg Cpu System Percent"
#                     }
#                 }
#             }
#         }

#     }

#     variable = {
#         default_values     = ["value"]
#         is_multi_selection = true
#         item = {
#         title = "item"
#         value = "ITEM"
#         }
#         name = "variable"
#         query       = "FROM Transaction SELECT average(duration) FACET appName"
#         replacement_strategy = "default"
#         title                = "title"
#         type                 = "nrql"
#     }
# }