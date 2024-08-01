variable "nr_api_key" {
  type = string
}

variable "nr_account_id" {
  type = number
}

variable "region" {
  type = string
}

# variable "dashboard_details" {
#   type = object({
#     name = string
#     permissions = string

#     page = {
#       name = string

#       widget_billboard1 = {
#         title = string
#         row = number
#         column = number
#         width = number
#         height = number
#         query = string
#       }

#       widget_bar1 = {
#         title = string
#         row = number
#         column = number
#         width = number
#         height = number
#         query = string

#         linked_entity_guids = list
#       }

#       widget_bar2 = {
#         title = string
#         row = number
#         column = number
#         width = number
#         height = number
#         query = string
#         filter_current_dashboard = bool
#         colors = {
#           color = string 
#           series_overrides = {
#             "0" = {
#               color = string
#               series_name = string
#             }

#             "1" = {
#               color = string 
#               series_name = string
#             }
#           }
#         }
#       }  

#       widget_line = {
#         title = string
#         row = number
#         column = number
#         width = number
#         height = number
#         nrql_query = {
#           "0" = {
#             query = string
#           }
#           "1" = {
#             query = string
#           }
#         }
#         legend_enabled = bool
#         ignore_time_range = bool
#         y_axis_left_zero = bool
#         y_axis_left_min = number
#         y_axis_left_max = number  

#         y_axis_right = {
#           y_axis_right_zero   = bool
#           y_axis_right_min    = number
#           y_axis_right_max    = number
#           y_axis_right_series = list
#         }

#         is_label_visible = bool

#         threshold = {
#           "0" = {
#             name     = string
#             from     = number
#             to       = number
#             severity = string
#           }
#           "1" = {
#             name     = string
#             from     = number
#             to       = number
#             severity = string
#           }
#         }

#         units = {
#           unit = string
#           series_overrides = {
#             unit = string
#             series_name = string
#           }
#         }
#       }
      
#       widget_markdown = {
#         title = string
#         row = number
#         column = number
#         width = number
#         height = number
#         text = string
#       }

#       widget_line = {
#         title = string
#         row = number
#         column = number
#         width = number
#         height = number
#         query = string

#         facet_show_other_series = bool
#         legend_enabled = bool
#         ignore_time_range = bool
#         y_axis_left_zero = bool
#         y_axis_left_min = number
#         y_axis_left_max = number
#         null_values = {
#           null_value = string
#           series_overrides = {
#             "0" = {
#               null_value = string
#               series_name = string
#             }
#             "1" = {
#               null_value = string
#               series_name = string
#             }
#             "2" = {
#               null_value = string
#               series_name = string
#             }
#             "3" = {
#               null_value = string
#               series_name = string
#             }
#           }
#         }
#       }

#     }

#     variable = {
#       default_values     = list
#       is_multi_selection = bool
#       item = {
#         title = string
#         value = string
#       }
#       name = string

#       query       = string
#       replacement_strategy = string
#       title                = string
#       type                 = string
#   }
#   })
# }