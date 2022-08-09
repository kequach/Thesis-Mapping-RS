# Mapping Research Software Landscapes through Exploratory Studies of GitHub Data

This repo holds the code for my master thesis with the topic **Mapping Research Software Landscapes through Exploratory Studies of GitHub Data**. 

## Reproducing data retrieval

The data retrieval is based on the [SWORDS-UU](https://github.com/UtrechtUniversity/SWORDS-UU) framework. Please keep in mind that the steps are not 100% reproducible due to dependencies on external data of Utrecht University and GitHub.

* First, follow the instructions for [phase 1: **Find user profiles associated to organisation**](https://github.com/UtrechtUniversity/SWORDS-UU/blob/main/collect_users/README.md). This will yield a .csv or .xlsx file which can be found in this repository under [data/users_enriched.xlsx](/data/users_enriched.xlsx). This file is already manually labeled to exclude irrelevant users which include non-employee students and persons unaffiliated with UU. Due to formatting issues with .csv files, .xlsx files are chosen as the default.
* Next, we use the [collected information from the UU employee pages](https://github.com/UtrechtUniversity/SWORDS-UU/blob/main/collect_users/methods/profile_pages/results/profile_page_uu.csv) to relate employee information back to the collected GitHub profiles. This file can be found in this repository under [data/profile_page_uu_without_orgs.csv](/data/profile_page_uu_without_orgs.csv).
* Now, we want to annotate the faculty of each GitHub user with the corresponding employee profile. To do this, follow the instructions in the Jupyter Notebook [label_data.ipynb](/label_data.ipynb). This is partly automated through the information from the **profile_page_uu.csv** file mentioned in the previous step, as well as the names users provide themselves on GitHub. The rest of the users and organizations need to be manually annotated. The Jupyter Notebook holds some code to facilitate  this. After this step is done, the first phase of user retrieval, labeling, and annotating is done. The resulting file of this step can be found in this repository under [data/users_labeled.xlsx](/data/users_labeled.xlsx)
* Start [phase 2: Collect relevant repositories](https://github.com/UtrechtUniversity/SWORDS-UU/blob/main/collect_repositories/README.md). As input, use the file [data/users_labeled.xlsx](/data/users_labeled.xlsx). The resulting file can be found in this repository under [data/repositories_filtered.xlsx](/data/repositories_filtered.xlsx). Two additional columns were manually added: **repo_type** and **note**.
* Execute the last part after the title **Label repositories with faculty information** of the Jupyter Notebook [label_data.ipynb](/label_data.ipynb). This will annotate each repository with the corresponding faculty of the user. The resulting file can be found in this repository under [data/repositories_labeled_faculty.xlsx](/data/repositories_labeled_faculty.xlsx). This is also the fully labeled file.

* Next steps TBD
