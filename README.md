[![License](https://img.shields.io/github/license/petro-logistics/petro-api-r.svg)](LICENSE)
# R API Client
This module is a R API client (with example) for retrieving data with the [Petro-Logistics API](https://secure.petro-logistics.com/client/api).

## Index
[[_TOC_]]

## Dependencies
- Running environment: [R Language](https://cloud.r-project.org/)
- Building R tools: [R Tools](https://cloud.r-project.org/)
- Development tool: [RStudio](https://posit.co/download/rstudio-desktop/#download)

## Install
1. Download and install [R Language](https://cloud.r-project.org/), [R Tools](https://cloud.r-project.org/) and [RStudio](https://posit.co/download/rstudio-desktop/#download).
2. Download or clone this project and eventually extract it to a folder in your machine. After that, you are able to see the following structure
    ```
    your_project_path/petro-api-r/
        |> PLAPIClient/
            |> man/
                |> GetAPI.Rd
                |> Client.Rd
            |> R/
                |> plapi.R
            |> DESCRIPTION
            |> NAMESPACE
            |> PLAPIClient.Rproj
        |> .gitignore
        |> example.R
        |> LICENCE
        |> README.md
    ```
3. Open **RStudio**.
4. Locate prompt, that starts with `>` character and is located in a subdivided window named **Console**
5. Now in the prompt, execute sequentially the following commands, to install and use packages **httr**, **usethis** and **devtools**:
    ```R
    > install.packages(c("httr", "usethis", "devtools"))
    > library("httr")
    > library("usethis")
    > library("devtools")
    ```
6. Based on **your_project_path**, execute following command to move to the project PL API Client directory:
    ```R
    > setwd("your_project_path/petro-api-r/PLAPIClient")
    ```
7. Execute the following command to install the API Client:
    ```R
    > install(".")
    ```

## Use
- ### Run Provided Example
    1. Run the provided example that should print a list of "movements" after calling the API:
        ```R
        source("../example.R")
        ```

- ### Subsequents Example Runs
    1. Launch RStudio
    2. Run the command:
        ```R
        source("your_project_path/petro-api-r/example.R")
        ```

- ### Run Your Modified Example
    1. In the initialization of the structure `Client`:
        - Replace all credentials by yours (`api_user`, `api_password`, `api_key`, `api_hash`)
        - In `api_url` replace **.../desired_type_report** (e.g. "**.../aggregatemovementsdata**", "**.../movementsdata**", etc.)
    2. On the call of function `GetAPI`:
        - Replace **query_name** by your desired query
    3. Run the command:
        ```R
        source("your_project_path/petro-api-r/your_modified_example.R")
        ```

## Parameters
- ### `Client` Structure
    - Initialized with 5 parameters:
        - api_url
        - api_user
        - api_password
        - api_key
        - api_hash
    - Initialization
        ```R
        your_client_structure <- Client(
            api_url = "https://secure.petro-logistics.com/api/v3/desired_type_report",
            api_user = "your_http_user",
            api_password = "your_http_password",
            api_key = "your_api_key",
            api_hash = "your_api_hash"
        )
        ```

- ### `GetAPI` Function Call
    - Called with 2 parameters:
        - your_client_structure
        - query_name
    - Initialization
        ```R
        res <- GetAPI(your_client_structure, "query_name")
        ```

## Example
1. You can test/use our provided [example.R](example.R)
