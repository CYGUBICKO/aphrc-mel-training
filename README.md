## aphrc-mel-training
The pipeline integrates gemini API via [gemini.R package](https://cran.r-project.org/web/packages/gemini.R/index.html) to support AI/ML for MEL at APHRC.

### Requirements

#### R and RStudio

Download and install R.

- [Windows](https://cran.case.edu/bin/windows/base/)
	- For Windows users, download [Rtools](https://cran.r-project.org/bin/windows/Rtools/)
- [Mac](https://cran.case.edu/bin/macosx/)
- [Linux](https://linuxize.com/post/how-to-install-r-on-ubuntu-20-04/)

Next step is to download Rstudio and install

- [Rstudio](https://www.rstudio.com/products/rstudio/download/)

#### Gemini API

- Get [Gemini API](https://makersuite.google.com/app/apikey)
- Copy and paste the API key into the R function below

```
Rautoml::set_api("GEMINE_API_KEY", "YOUR_API_KEY")
```
