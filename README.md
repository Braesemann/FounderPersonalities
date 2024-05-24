# The Science of Startups: The impact of founder personalities on startup success

Code and data to produce figures and replicate results of the paper 'The impact of founder personalities on startup success’.

__Please cite as__: _McCarthy, P.X., Gong, X., Braesemann, F. et al. The impact of founder personalities on startup success. Sci Rep 13, 17200 (2023). https://doi.org/10.1038/s41598-023-41980-y_ 

Available online:
https://www.nature.com/articles/s41598-023-41980-y 

**Contact**: Dr Fabian Braesemann, corresponding author (fabian.braesemann@oii.ox.ac.uk)


### Description

**Last modified**: 19th March 2024

**Authors**: Paul X. McCarthy, Xian Gong, Fabian Braesemann, Fabian Stephany, Marian-Andrei Rizoiu, Margaret L. Kern

**Abstract**: Startup companies solve many of today’s most challenging problems, such as the decarbonisation of the economy or the development of novel life-saving vaccines. Startups are a vital source of innovation, yet the most innovative are also the least likely to survive. The probability of success of startups has been shown to relate to several firm-level factors such as industry, location and the economy of the day. Still, attention has increasingly considered internal factors relating to the firm’s founding team, including their previous experiences and failures, their centrality in a global network of other founders and investors, as well as the team’s size. The effects of founders’ personalities on the success of new ventures are, however, mainly unknown. Here, we show that founder personality traits are a significant feature of a firm’s ultimate success. We draw upon detailed data about the success of a large-scale global sample of startups (n = 21,187). We find that the Big Five personality traits of startup founders across 30 dimensions significantly differ from that of the population at large. Key personality facets that distinguish successful entrepreneurs include a preference for variety, novelty and starting new things (openness to adventure), like being the centre of attention (lower levels of modesty) and being exuberant (higher activity levels). We do not find one ’Founder-type’ personality; instead, six different personality types appear. Our results also demonstrate the benefits of larger, personality-diverse teams in startups, which show an increased likelihood of success. The findings emphasise the role of the diversity of personality types as a novel dimension of team diversity that influences performance and success.

**Data anonymisation**:
Ensuring anonymity of personal information is of utmost importance to us. As such, for the data publicly released, we use differential privacy to ensure individual founders cannot be linked to companies. Additionally, we use statistical privacy techniques such as k-anonymity to ensure companies cannot be identified from their characteristics. Depending on whether companies or individuals are repeated in the data, we used a hashing algorithm and random numerical labelling to anonymise individual and company names. For some figures, we provide only a subset of the data in order to maintain anonymity of personal information. As a result, some of the figures produced with the data provided here might look different from the ones in the original publication.


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
  - Fig1AB_df
    - Contains different workers (“User”), their personality percentile scores, and whether or not they are entrepreneurs or employees (“Target”)
  - Fig1CD_df
    - Contains founders (anonymised "User”) and their personality percentile scores
  - ED_Fig20_df
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
  
  - AdditionalData (no figures)
    - An extensive dataset on different startups. Contains: 
      - Different startups (“V1”)
      - Whether they are older than 6 years old (“olderthansix”)
      - Country the startup is in (“org_country”) 
      - How many founders the startup has (“org_numfounders”)
      - Combination of founder personality types (“combo”) 
      - Personality percentile scores 
      - Whether or not the startup was successful (“success”) 
      
- Code
  - Python Code
      - Reproduces figures 1A, 1B, 1C, and 1D from the main text and extended data figure 4, 5, 6, 7, 8A, 8C, and 20 in the supplement. 
  - R Figures
      - Code reproduces figures 2A and 2B from the main text and extended figures 1A, 1B, 1C, 12, and 16 in the supplement 


### Commonly Asked Questions 

- What are the columns starting with "big5_max" and ending with "percentile" referring to?
  - They represent the maximum percentile value of the personality trait (openness, consciousness, etc) within the founder team of each organisation. They are taken from the columns "big5_openness_percentile", "big5_conscientiousness_percentile", "big5_extraversion_percentile", "big5_agreeableness_percentile", and "big5_neuroticism_percentile". For example, the "big5_max_open" of an organisation would represent the "big5_openness_percentile" of the founder with the highest openness. 
 
-  If a row says that an organisation has two founders, but the combo type only gives one founder, what does that mean?
   - It means we could not find the Twitter account for the second founder, so we could not infer their personality. 
    
