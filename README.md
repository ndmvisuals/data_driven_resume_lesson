---
marp: true
theme: uncover
class: invert
paginate: true
_paginate: false
---

# How to automate your resume in _R Markdown_

Nick McMillan

---

# Why automate?

1. Updating a resume can be **time consuming**!!
1. Different jobs may require specifically tailored resumes
1. We are data journalists and using our skills to make our lives easier is fun!

---

# What we will cover

1. Markdown
1. Format a CSV to be the resume "backend"
1. Tools in R
   - Rmarkdown
   - Pagedown
   - Purr

---

# What is [Markdown](https://www.markdownguide.org/getting-started/)?

---

### "Markdown is a lightweight markup language that you can use to add formatting elements to plaintext text documents."

-- Markdown's website

![bg right:40% 80% invert](photos/markdown_logo.png)

---

# Markdown vs WYSIWYG

| Markdown                                         | MS Word                              |
| ------------------------------------------------ | ------------------------------------ |
| - Add special symbols to represent style changes | - click buttons to format words      |
| Future proof: any computer can read it           | Formating is specific to the program |

---

# Markdown Examples

```
# This is a heading

## This is a subheading

### This is a sub sub heading

*This text is italic*

*This text is bold**

This is regular text

```

Test it out in this [online markdown editor](https://dillinger.io/)

---

# Fun Fact

This presentation was created in Markdown and a program converted it into a slide!

---

# A sample markdown entry

```
### PhD. Candidate, Biostatistics

Vanderbilt University

Nashville, TN

2011-2015

- Working on Bayesian network models & interactive visualization platforms
- University Graduate Fellow

```

![](photos/sample_entry.png)

---

# How to get from Markdown to HTML Resume?

---

# [Pagedown](https://pagedown.rbind.io/)

- _Complex:_ "an R package based on a JavaScript LIbary to paginate the HTML output of R Markdown documents"

## ![bg right:40% 80%](photos/pagedown_logo.png)

---

# [Pagedown](https://pagedown.rbind.io/)

- _Simple_: Makes R markdown look pretty on the web/document form

## ![bg right:40% 80%](photos/pagedown_logo.png)

---

# How to format the [CSV](https://github.com/ndmvisuals/data_driven_resume_lesson/blob/dev/code_resources/nicks_resume_data.xlsx)

- Headers
  - section
    - education, experience ..
  - title
  - location
  - institution
  - start_date
  - end_date
  - description 1-3
  - boolean

---

# [R Markdown Code](https://github.com/ndmvisuals/data_driven_resume_lesson/blob/dev/code_resources/automated_resume_concepts.Rmd)

1. Set chunks to `asis`
   - This treats output text as pure markdown.
     ```
     knitr::opts_chunk$set(results = 'asis')
     ```

---

# [R Markdown Code](https://github.com/ndmvisuals/data_driven_resume_lesson/blob/dev/code_resources/automated_resume_concepts.Rmd)

## Concept: `string literals`

2. Use the `glue()` library to output string in a template format to create the format that the `Pagedown` resume template requires

---

# [R Markdown Code](https://github.com/ndmvisuals/data_driven_resume_lesson/blob/dev/code_resources/automated_resume_concepts.Rmd)

2. Load your resume csv

---

# [R Markdown Code](https://github.com/ndmvisuals/data_driven_resume_lesson/blob/dev/code_resources/automated_resume_concepts.Rmd)

## Resume: Building out the descriptions

3a. Use `pivot_longer()` from `tidyverse` to transform the three descriptions into character list for each section

---

# [R Markdown Code](https://github.com/ndmvisuals/data_driven_resume_lesson/blob/dev/code_resources/automated_resume_concepts.Rmd)

## Resume: Building out the descriptions

3b. From the `purrr` library (part of`tidyverse`), use `map()` to iterate through each character list and append a bullet

---

# [Finally put it all together](https://github.com/ndmvisuals/data_driven_resume_lesson/blob/dev/code_resources/automated_resume_example.Rmd)

- Combine into one function
- Select each section and put into R Markdown template
- Push Knit!

---

# Resources + Tutorials

- [Nick Stayer's Blog Post](https://livefreeordichotomize.com/2019/09/04/building_a_data_driven_cv_with_r/)
- [Bryan Jenk's BLog Post](https://github.com/tallguyjenks/CV)
- [Marp](https://marp.app/): to create a static Markdown driven slide presentations
- [Revealjs](https://revealjs.com/): to create animated Markdown driven slide presentations
