library(gemini.R)
library(pdftools)
library(Rautoml)

## Helper to read both txt and pdf
read_doc = function(path, ext){
  if (tolower(ext) == "pdf") {
    return(paste(pdf_text(path), collapse = "\n"))
  } else {
    return(paste(readLines(path, warn = FALSE), collapse = "\n"))
  }
}

## Set up the API key
# Rautoml::set_api(name="GEMINI_API_KEY", api="XXXXXX")

## Simple query

simple_prompt = gemini(prompt = "What is MEL?")

simple_prompt_chat = gemini_chat(prompt = "What is MEL?")

simple_prompt_chat_resp = gemini_chat(prompt = "In the context of APHRC", history = simple_prompt_chat$history)


## Working with documents

### Simple extraction

docs = c("../docs/2024 HAW Quarter 1 Form.pdf", "../docs/2024 HAW Quarter 2 Form.pdf")

texts = lapply(docs, function(x){
  read_doc(x, ext = "pdf")
})

comparison = gemini(prompt = paste(
  "Compare the following two reports. Identify similarities, differences, and gaps:\n",
  texts[[1]], "\n---\n", texts[[2]]
))

cat(comparison)



#### ---- Generate Report ------------------------------------------------ ####
rmarkdown::render(
  input = "../codes/report.Rmd",
  output_file = '../codes/report.docx',
  envir = parent.frame()
)
