parse_resume_csv = function(resume_csv, section_description){
  
  position_data = resume_csv %>% 
    filter(section == section_description) %>% 
    # Add a unique id to each section
    mutate(id = 1:n())
  
 
  
  pivoted_positions = position_data %>% 
    pivot_longer(starts_with("description"),
                 names_to = "description_num",
                 values_to = "description",
                 # Drop NA to exclude any section that does not have a description
                 values_drop_na = TRUE )
  
  pos_with_descrip_list = pivoted_positions %>% 
    group_by(id) %>% 
    # Wrap up descriptions into a list column
    mutate(descriptions = list(description)) %>% 
    ungroup() %>% 
    # Only keep the first row for each section that has all the bullet points
    filter(description_num == "description_1") %>%
    # Don't need these columns
    select(-description_num, - description) 
  
  
  # If the start date is missing, or start date == end date, just use end. Otherwise build a range
  positions_with_timeline = pos_with_descrip_list %>% 
    mutate(timeline = ifelse(
      is.na(start_date) | start_date == end_date, 
      end_date, glue("{start_date} - {end_date}")))
  
  positions_collapsed_bullets = positions_with_timeline %>% 
    mutate(description_bullets = map_chr(
      descriptions, ~paste("-",.,collapse = '\n')))
  
  
  
  positions_no_na = positions_collapsed_bullets %>% mutate_all(~ifelse(is.na(.), "N/A", .))
  
  
  
  
  result = positions_no_na %>% glue_data(
    "### {title}",
    "\n\n",
    "{location}",
    "\n\n",
    "{institution}",
    "\n\n",
    "{timeline}", 
    "\n\n",
    "{description_bullets}",
    "\n\n\n"
  )
  return(result)
  
}