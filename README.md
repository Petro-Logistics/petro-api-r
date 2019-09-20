# README
---

## R API Client
This module is a R API client (with example) for retrieving data with with the [Petro-Logistics API](https://secure.petro-logistics.com/client/api).

## Dependencies
- Running environment [R](https://cran.rstudio.com/)
- Building R tools [R Tools](https://cran.rstudio.com/)
- Development tool [RStudio](https://www.rstudio.com/products/rstudio/download/#download)


## Install
- ### Opening the project source in RStudio IDE
    1. Download and install [R](https://cran.r-project.org/mirrors.html), [R Tools](https://cran.rstudio.com/) and [RStudio](https://www.rstudio.com/products/rstudio/download/#download).
    2. Download or clone this project and eventually extract it to a folder in your machine. After that, you are able to see the following structure
        ```
        path_to_your_folder/petro-api-r/
                                    |
                                    |> PLAPIClient/
                                    |   |
                                    |   |> man/
                                    |   |   |
                                    |   |   |> GetData.Rd
                                    |   |   |> Client.Rd
                                    |   |
                                    |   |> R/
                                    |   |   |
                                    |   |   |> plapi.R
                                    |   |
                                    |   |> DESCRIPTION
                                    |   |> NAMESPACE
                                    |   |> PLAPIClient.Rproj
                                    |
                                    |> .gitignore
                                    |> example.R
                                    |> README.md

        ```
    3. Open **RStudio**.
    4. Locate prompt, that starts with `>` character and is located in a subdivided window named **Console**
    5. Now in the prompt, execute sequentially the following commands, to install and use **devtools**:
        ```R
        > install.packages("devtools")
        > library(devtools)
        ```
    6. Based on **path_to_your_folder**, execute following command to move to the project PL API Client directory:
        ```R
        > setwd("path_to_your_folder/petro-api-r/petrologistics")
        ```
    7. Execute the following command to install the API Client:
        ```R
        > install(".")
        ```


- ### Running the example
    1. Run the example that should print a list of "movements" after calling the API:
        ```R
        source("path_to_your_folder/petro-api-r/example.R")
        ```


- ### Subsequents example runs
    1. Launch RStudio
    2. Run the command:
        ```R
        source("path_to_your_folder/petro-api-r/example.R")
        ```


- ### Testing example with other queries
    1. In the initialization of the structure **Client**, eventually change **_requested_report_type_** of your choice in **api_url** 
    2. In the function calling, change the **_query_name_** of your choice
    3. Run the command:
        ```R
        source("path_to_your_folder/petro-api-r/example.R")
        ```


## Parameters
- **Client** structure is initialized with 5 parameters:
    - api_url
    - api_user
    - api_password
    - api_key
    - api_hash

- **GetData** function is called with 2 parameters:
    - client
    - query_name

## Usage
- ### Structure initialization Example
    ```R
    your_client_structure_name <- Client(
        api_url = "https://secure.petro-logistics.com/api/v2/requested_report_type",
        api_user = "your_http_user",
        api_password = "your_http_password",
        api_key = "your_api_key",
        api_hash = "your_api_hash"
    )
    ```


- ### Function execution Example
    ```R
    res <- GetAPI(your_client_structure_name, "query_name")
    ```


## Example
1. An example of how to test/use PLAPIClient is available in **example.R** located [here](example.R)
