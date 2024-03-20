# The Science of Startups: The impact of founder personalities on startup success

Code and data to produce figures and replicate results of the paper 'The impact of founder personalities on startup success’.

__Please cite as__: _McCarthy, Gong, Braesemann, Stephany, Rizoiu, Kern (2023) The impact of founder personalities on startup success. Sci Rep 13, 17200 (2023). https://doi.org/10.1038/s41598-023-41980-y._ 

Available online:
https://www.nature.com/articles/s41598-023-41980-y 

**Contact**: Dr Fabian Braesemann, corresponding author (fabian.braesemann@oii.ox.ac.uk)


### Description

**Last modified**: 19th March 2024

**Authors**: Paul X. McCarthy, Xian Gong, Fabian Braesemann, Fabian Stephany, Marian-Andrei Rizoiu, Margaret L. Kern

**Abstract**: Startup companies solve many of today’s most challenging problems, such as the decarbonisation of the economy or the development of novel life-saving vaccines. Startups are a vital source of innovation, yet the most innovative are also the least likely to survive. The probability of success of startups has been shown to relate to several firm-level factors such as industry, location and the economy of the day. Still, attention has increasingly considered internal factors relating to the firm’s founding team, including their previous experiences and failures, their centrality in a global network of other founders and investors, as well as the team’s size. The effects of founders’ personalities on the success of new ventures are, however, mainly unknown. Here, we show that founder personality traits are a significant feature of a firm’s ultimate success. We draw upon detailed data about the success of a large-scale global sample of startups (n = 21,187). We find that the Big Five personality traits of startup founders across 30 dimensions significantly differ from that of the population at large. Key personality facets that distinguish successful entrepreneurs include a preference for variety, novelty and starting new things (openness to adventure), like being the centre of attention (lower levels of modesty) and being exuberant (higher activity levels). We do not find one ’Founder-type’ personality; instead, six different personality types appear. Our results also demonstrate the benefits of larger, personality-diverse teams in startups, which show an increased likelihood of success. The findings emphasise the role of the diversity of personality types as a novel dimension of team diversity that influences performance and success.

### Folder Structure

- Data (for figures in R) 
  - Fig2A_df
    - Contains the number of founders a startup has (“org_numfounders”) and whether it was successful (“success”)
  - Fig2B_df 
    - Contains founders, their big 5 percentile scores, startups they were part of (“anon_org”), and whether the startup was a success (“success”) 
  - ED_Fig1A_df 
    - Contains the country where a startup was founded (“org_country”) and whether it was successful (“success”)
  - ED_Fig1B_df
    - Summary statistics for chances of success by firm industry type 
  - ED_Fig1C_df
    - Contains the year where a startup was founded (“org_founded_year”) and whether it was successful (“success”)
  - ED_Fig12_df
    - Contains how many personality types (“personality_type”) work in specific job roles (“key”) 
  - ED_Fig16_df
    - Summary statistics for chances of success by founder personalities 
- Data (for figures in Python) 
  - Entrepreneurs_and_Employee_Scores_Anon
    - Contains different workers (“User”), their personality percentile scores, and whether or not they are entrepreneurs or employees (“Target”). 
  - ExtendedDataFigure19_Subset 
    - A very small subset of the original dataset which contains
      - Different startups (“V1”)
      - Whether they are older than 6 years old (“olderthansix”)
      - Country the startup is in (“org_country”) 
      - Whether the startup has a female founder (“Female”) 
      - How many founders the startup has (“org_numfounders”)
      - Combination of founder personality types (“combo”) 
      - Industry of the startup 
      - Personality percentile scores 
      - Whether or not the startup was successful (“success”) 
  - Founders_Cofounders_Twitter_Personality_Matrix_Anon_diff
    - Contains founders (anonymised "User”) and their personality percentile scores
  - Data (no figures)
    - personalities_noInd 
      - An extensive dataset on different startups. Contains: 
      - Different startups (“V1”)
      - Whether they are older than 6 years old (“olderthansix”)
      - Country the startup is in (“org_country”) 
      - How many founders the startup has (“org_numfounders”)
      - Combination of founder personality types (“combo”) 
      - Personality percentile scores 
      - Whether or not the startup was successful (“success”) 
      
- Code 
  - “R Code [Upload]” code reproduces figures 2A and 2B from the main text and extended figures 1A, 1B, 1C, 12, and 16 in the supplement 
  - “Python Code [Upload]” reproduces figures 1A, 1B, 1C, and 1D from the main text and extended data figure 4, 5, 6, 7, 8A, 8C, and 20 in the supplement. 

    
