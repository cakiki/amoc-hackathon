amoc-hackathon
==============================
```
     _______________________________________
    < SamSepi0l's AMoC 2021 Hackathon Entry >
     ---------------------------------------
            \   ^__^
             \  (oo)\_______
                (__)\       )\/\
                    ||----w |
                    ||     ||
```

Sometime Github refuses to render jupyter notebooks; use this [nbviewer page](https://nbviewer.jupyter.org/github/cakiki/amoc-hackathon/tree/main/notebooks/) to see the notebooks in the browser with no live python kernel.

## Context:
The following is taken verbatim from the [Hackathon description](https://www.eventbrite.co.uk/e/amoc-hackathon-tickets-137288520661):

>Bristol Cyber Security Group is hosting a cybercrime hackathon. Groups from select institutions are invited to create teams of 4 to tackle a three-day intensive hackathon.

> The hackathon is aligned with our AMoC project (Advanced Modelling of Cyber Criminal Careers), which aims to tackle financially-motivated cybercrime on Darknet Markets by gaining a better understanding of cyber offenders, their motives, the interventions effective at disrupting their activities, the different roles within cybercriminal networks and how these evolve over time. Key outputs from the project will contribute to a software toolkit designed to assist law enforcement in their cybercrime investigations.

> Teams will compete against each other on two data-driven cybercrime investigation tasks exploiting timestamped textual observations of underground cryptomarkets:

> 1. **Longitudinal visualisation:** Create an innovative visualisation representing the datasets over time, with particular attention to how significant events might affect the nature of posting on the forums.

> 2. **Author re-identification:**  Train a competitive classifier to re-identify individuals' accounts across different forums, drawing on stylometric and temporal features.

## Team Members:
* Lukas Gienapp: [Affilitation](https://temir.org/people.html)

* Christopher Akiki: [Affiliation 1](https://temir.org/people.html) / [Affilitation 2](https://www.scads.de/en/about-us/research-staff)

## Project Hierarchy

Local output of `tree -s --charset X .` :

<pre><font color="#5C5CFF"><b>.</b></font>
|-- [       4096]  <font color="#5C5CFF"><b>data</b></font>
|   |-- [  575721195]  base.parquet
|   |-- [ 9994088576]  body_bertweet_embeddings.npy
|   |-- [ 6662725760]  body_embeddings.npy
|   |-- [ 6662725760]  category_embeddings.npy
|   |-- [        268]  download.sh
|   |-- [       4096]  <font color="#5C5CFF"><b>hackathon_dataset</b></font>
|   |   |-- [       4096]  <font color="#5C5CFF"><b>fora</b></font>
|   |   |   |-- [   80475006]  abraxas.csv
|   |   |   |-- [   59372422]  agora.csv
|   |   |   |-- [   13651267]  alphabay.csv
|   |   |   |-- [     532069]  andromeda.csv
|   |   |   |-- [   27654884]  blackbank.csv
|   |   |   |-- [   39761017]  bmr.csv
|   |   |   |-- [    1969455]  bungee54.csv
|   |   |   |-- [    3901035]  cannabisroad2.csv
|   |   |   |-- [    3164247]  cannabisroad3.csv
|   |   |   |-- [   10165330]  crackingarena.csv
|   |   |   |-- [   12338244]  crackingfire.csv
|   |   |   |-- [     215033]  darkbay.csv
|   |   |   |-- [     158679]  darknetheroes.csv
|   |   |   |-- [    2441620]  diabolus.csv
|   |   |   |-- [     167220]  dogeroad.csv
|   |   |   |-- [  267554251]  evolution.csv
|   |   |   |-- [      18226]  greyroad.csv
|   |   |   |-- [    2221113]  hackhound.csv
|   |   |   |-- [     117507]  havana.csv
|   |   |   |-- [     454402]  hydra.csv
|   |   |   |-- [    8364072]  kingdom.csv
|   |   |   |-- [     766236]  kiss.csv
|   |   |   |-- [      18774]  mrniceguy.csv
|   |   |   |-- [   42652560]  nucleus.csv
|   |   |   |-- [     884519]  outlawmarket.csv
|   |   |   |-- [    1935573]  panacea.csv
|   |   |   |-- [   30481136]  pandora.csv
|   |   |   |-- [    5037959]  pbf.csv
|   |   |   |-- [     398731]  revolver.csv
|   |   |   |-- [  444288998]  silkroad2.csv
|   |   |   |-- [  544526908]  silkroad.csv
|   |   |   |-- [   40346538]  thehub.csv
|   |   |   |-- [   22266519]  themajesticgarden.csv
|   |   |   |-- [     617373]  therealdeal.csv
|   |   |   |-- [      85842]  tom.csv
|   |   |   |-- [    1390316]  torbazaar.csv
|   |   |   |-- [     307867]  torescrow.csv
|   |   |   |-- [      17882]  tortuga.csv
|   |   |   |-- [    7229472]  utopia.csv
|   |   |   `-- [  833656446]  webkill.csv
|   |   |-- [     592443]  hackathon_tasks_overview.html
|   |   |-- [    2868111]  hackathon_tasks_overview.pdf
|   |   |-- [       4096]  <font color="#5C5CFF"><b>measure_impact</b></font>
|   |   |   `-- [     990714]  fora_registedusers.csv
|   |   `-- [       4096]  <font color="#5C5CFF"><b>reidentification</b></font>
|   |       |-- [     240999]  test_dataset.csv
|   |       |-- [     261243]  test_dataset.json
|   |       |-- [     938646]  train_negative_users.csv
|   |       |-- [    1017494]  train_negative_users.json
|   |       |-- [      25657]  train_positive_users.csv
|   |       `-- [      27783]  train_positive_users.json
|   |-- [       4096]  <font color="#5C5CFF"><b>ngrams</b></font>
|   |   |-- [   34761549]  bigrams.json
|   |   |-- [   18799932]  fourgrams.json
|   |   `-- [   17436096]  trigrams.json
|   |-- [ 6662725760]  subject_embeddings.npy
|   `-- [       4096]  <font color="#5C5CFF"><b>tsne_XY</b></font>
|       |-- [    8434055]  abraxasforums_perplexity_10_x_y.parquet
|       |-- [    2639180]  agoraforums_perplexity_10_x_y.parquet
|       |-- [    1021387]  blackbankmarketforums_perplexity_10_x_y.parquet
|       |-- [     105751]  bungee54forums_perplexity_10_x_y.parquet
|       |-- [     183134]  cannabisroad2_perplexity_10_x_y.parquet
|       |-- [     153972]  cannabisroad3_perplexity_10_x_y.parquet
|       |-- [      10490]  dogeroadforums_perplexity_10_x_y.parquet
|       |-- [   15847006]  evolutionforums_perplexity_10_x_y.parquet
|       |-- [       1924]  greyroadforums_perplexity_10_x_y.parquet
|       |-- [     132947]  hackhound_perplexity_10_x_y.parquet
|       |-- [      30442]  kissforums_perplexity_10_x_y.parquet
|       |-- [      22803]  outlawmarketforums_perplexity_10_x_y.parquet
|       |-- [      71196]  panaceaforums_perplexity_10_x_y.parquet
|       |-- [    1527708]  pandoraforums_perplexity_10_x_y.parquet
|       |-- [     192278]  projectblackflagforums_perplexity_10_x_y.parquet
|       |-- [      21831]  revolverforums_perplexity_10_x_y.parquet
|       |-- [    1828187]  thehubforums_perplexity_10_x_y.parquet
|       |-- [     814783]  themajesticgardenforums_perplexity_10_x_y.parquet
|       |-- [      34099]  therealdealforums_perplexity_10_x_y.parquet
|       |-- [       2264]  tortugaforums_perplexity_10_x_y.parquet
|       `-- [    4042036]  webkill_perplexity_10_x_y.parquet
|-- [       4096]  <font color="#5C5CFF"><b>dockerfiles</b></font>
|   |-- [       4096]  <font color="#5C5CFF"><b>gpu</b></font>
|   |   `-- [        755]  Dockerfile
|   `-- [       4096]  <font color="#5C5CFF"><b>vanilla</b></font>
|       `-- [       1368]  Dockerfile
|-- [       4096]  <font color="#5C5CFF"><b>docs</b></font>
|   |-- [        489]  commands.rst
|   |-- [       7878]  conf.py
|   |-- [        256]  getting-started.rst
|   |-- [        441]  index.rst
|   |-- [       5112]  make.bat
|   `-- [       5596]  Makefile
|-- [      11357]  LICENSE
|-- [       2231]  Makefile
|-- [       4096]  <font color="#5C5CFF"><b>models</b></font>
|-- [       4096]  <font color="#5C5CFF"><b>notebooks</b></font>
|   |-- [       2361]  2.0-lg-embeddings.ipynb
|   |-- [    3183370]  dashboard.ipynb
|   |-- [      17720]  document_embeddings_with_LMs.ipynb
|   |-- [      13984]  hackathon_tasks_overview.ipynb
|   |-- [    4509773]  kl_evolution.ipynb
|   |-- [       9480]  ngrams.ipynb
|   |-- [       6884]  nucleus_size_series.ipynb
|   |-- [      21050]  tsne.ipynb
|   |-- [    3118021]  umap.ipynb
|   `-- [       2260]  users.ipynb
|-- [       2758]  README.md
|-- [       4096]  <font color="#5C5CFF"><b>references</b></font>
|-- [       4096]  <font color="#5C5CFF"><b>reports</b></font>
|   `-- [       4096]  <font color="#5C5CFF"><b>figures</b></font>
`-- [       4096]  <font color="#5C5CFF"><b>src</b></font>
    |-- [       4096]  <font color="#5C5CFF"><b>data</b></font>
    |   `-- [        987]  generate-base-dataset.py
    |-- [          0]  __init__.py
    |-- [       4096]  <font color="#5C5CFF"><b>__pycache__</b></font>
    |   `-- [       1348]  utils.cpython-36.pyc
    `-- [       1283]  utils.py

</pre>


<p><small>Project based on the <a target="_blank" href="https://drivendata.github.io/cookiecutter-data-science/">cookiecutter data science project template</a>. #cookiecutterdatascience</small></p>
