{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "47623ccd",
   "metadata": {
    "_cell_guid": "b1076dfc-b9ad-4769-8c92-a6c4dae69d19",
    "_uuid": "8f2839f25d086af736a60e9eeb907d3b93b6e0e5",
    "papermill": {
     "duration": 0.009889,
     "end_time": "2022-07-03T18:18:49.056618",
     "exception": false,
     "start_time": "2022-07-03T18:18:49.046729",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# LeadersUp x Google Data Analytics: Case Study - Cyclistic Bikeshare\n",
    "\n",
    "This case study was completed as part of the last course of the Google Data Analytics Certificate. Results from the analysis will be shared here, on Kaggle, as well as GitHub.\n",
    "\n",
    "## Scenario:\n",
    "\n",
    "In this case study scenario, I am a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director\n",
    "of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve my recommendations, so they must be backed up with compelling data insights and professional data\n",
    "visuthaalizations.\n",
    "\n",
    "## Getting Started:\n",
    "My marketing director and manager, Lily Moreno, has asked these things of me:\n",
    "\n",
    "<ins>Deliverables</ins>\n",
    "1. A clear statement of the business task\n",
    "2. A description of all data sources used\n",
    "3. Documentation of any cleaning or manipulation of data\n",
    "4. A summary of your analysis\n",
    "5. Supporting visualizations and key findings\n",
    "6. Your top three recommendations based on your analysis\n",
    "\n",
    "To complete this case study, I'll use the six-step data analysis process discussed throughout the course:\n",
    "1. Ask\n",
    "2. Prepare\n",
    "3. Process\n",
    "4. Analyze\n",
    "5. Share\n",
    "6. Act\n",
    "\n",
    "## Ask\n",
    "\n",
    "<ins>Case Study Roadmap - Ask</ins>\n",
    "\n",
    "|  id  | Case Study Roadmap Questions |   Answer  |\n",
    "|------|------------------------------|-----------|\n",
    "| 1    | **Q:** What is the problem you're trying to solve? | *A:* I want to use the provided data to help my team find out how to convert casual users into annual members|\n",
    "| 2    | **Q:** How can your insights drive business decisions? | *A:* By using the data to understand Cyclistic's users, I can help Cyclistic determine what business decisions will have an impact in line with their current objective |  \n",
    "\n",
    "For this project, the key stakeholders are the Cyclistic Executive Team, whose approval is needed for my recommendations to be put into action. The task at hand is the analysis of Cyclistic's user data to give insight into the service's usage and customer behavior. \n",
    "\n",
    "<ins>Statement</ins>  \n",
    "Analyze user data and define a new marketing strategy to boost annual memberships.\n",
    "\n",
    "## Prepare\n",
    "\n",
    "For this case study, I'll be analyzing data from May, 2021 through April, 2022. The data is stored on my local device, organized by year, and will be uploaded to Kaggle for analysis. I believe the data were indeed collected from the sources mentioned in the document and contain no bias or lack of credibility. In said document is discussed the data's origins and specific licensing, further adding to its credibility. Trip data from Divvy can be found [here](https://ride.divvybikes.com/system-data) with the same fields seen in the provided datasets. The data are enough to complete the stated business task. There are no issues with the data.\n",
    "\n",
    "<ins>Data Description</ins>  \n",
    "All analyzed data comes from the provided datasets. The dataset I will be using contains a year of data, from 2021 to 2022. The data describes the Ride ID, Date, Rideable Type (that is, the type of bike used), Trip Duration, Trip Starting and Endpoints, and Membership Type--this will be a frequently used variable. \n",
    "\n",
    "## Process and Analyze\n",
    "\n",
    "I have chosen to use the [R](https://www.r-project.org/) statistical software and programming language for this case study. R's versatility and modularity give me a lot of flexibility when doing data analysis. If in the script there is a package that was not used, it is because I intended to use it and later found its use unnecessary for this specific project. I am extremely thankful for the R community and those in it who take the time to create and build upon such useful tools. The included packages will be cited at the end of this document. The data will be analyzed and visualized using [VS Code](https://code.visualstudio.com/). Then, the script and its resulted will be reworked into the Kaggle notebook and a GitHub repository for sharing. \n",
    "\n",
    "I should note that I manipulate and analyze the data as I go through the analysis, based on the information I need at a given point. Therefore, this phase and the Analyze phase have been combined."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "756c4ff2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:18:49.076438Z",
     "iopub.status.busy": "2022-07-03T18:18:49.073765Z",
     "iopub.status.idle": "2022-07-03T18:21:04.386188Z",
     "shell.execute_reply": "2022-07-03T18:21:04.384194Z"
    },
    "papermill": {
     "duration": 135.325585,
     "end_time": "2022-07-03T18:21:04.389736",
     "exception": false,
     "start_time": "2022-07-03T18:18:49.064151",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.7     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.9\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.0     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "\n",
      "Attaching package: ‘janitor’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    chisq.test, fisher.test\n",
      "\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'../input/cyclistic-one-year/one_year/202105-divvy-tripdata.csv'</li><li>'../input/cyclistic-one-year/one_year/202106-divvy-tripdata.csv'</li><li>'../input/cyclistic-one-year/one_year/202107-divvy-tripdata.csv'</li><li>'../input/cyclistic-one-year/one_year/202108-divvy-tripdata.csv'</li><li>'../input/cyclistic-one-year/one_year/202109-divvy-tripdata.csv'</li><li>'../input/cyclistic-one-year/one_year/202110-divvy-tripdata.csv'</li><li>'../input/cyclistic-one-year/one_year/202111-divvy-tripdata.csv'</li><li>'../input/cyclistic-one-year/one_year/202112-divvy-tripdata.csv'</li><li>'../input/cyclistic-one-year/one_year/202201-divvy-tripdata.csv'</li><li>'../input/cyclistic-one-year/one_year/202202-divvy-tripdata.csv'</li><li>'../input/cyclistic-one-year/one_year/202203-divvy-tripdata.csv'</li><li>'../input/cyclistic-one-year/one_year/202204-divvy-tripdata.csv'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item '../input/cyclistic-one-year/one\\_year/202105-divvy-tripdata.csv'\n",
       "\\item '../input/cyclistic-one-year/one\\_year/202106-divvy-tripdata.csv'\n",
       "\\item '../input/cyclistic-one-year/one\\_year/202107-divvy-tripdata.csv'\n",
       "\\item '../input/cyclistic-one-year/one\\_year/202108-divvy-tripdata.csv'\n",
       "\\item '../input/cyclistic-one-year/one\\_year/202109-divvy-tripdata.csv'\n",
       "\\item '../input/cyclistic-one-year/one\\_year/202110-divvy-tripdata.csv'\n",
       "\\item '../input/cyclistic-one-year/one\\_year/202111-divvy-tripdata.csv'\n",
       "\\item '../input/cyclistic-one-year/one\\_year/202112-divvy-tripdata.csv'\n",
       "\\item '../input/cyclistic-one-year/one\\_year/202201-divvy-tripdata.csv'\n",
       "\\item '../input/cyclistic-one-year/one\\_year/202202-divvy-tripdata.csv'\n",
       "\\item '../input/cyclistic-one-year/one\\_year/202203-divvy-tripdata.csv'\n",
       "\\item '../input/cyclistic-one-year/one\\_year/202204-divvy-tripdata.csv'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. '../input/cyclistic-one-year/one_year/202105-divvy-tripdata.csv'\n",
       "2. '../input/cyclistic-one-year/one_year/202106-divvy-tripdata.csv'\n",
       "3. '../input/cyclistic-one-year/one_year/202107-divvy-tripdata.csv'\n",
       "4. '../input/cyclistic-one-year/one_year/202108-divvy-tripdata.csv'\n",
       "5. '../input/cyclistic-one-year/one_year/202109-divvy-tripdata.csv'\n",
       "6. '../input/cyclistic-one-year/one_year/202110-divvy-tripdata.csv'\n",
       "7. '../input/cyclistic-one-year/one_year/202111-divvy-tripdata.csv'\n",
       "8. '../input/cyclistic-one-year/one_year/202112-divvy-tripdata.csv'\n",
       "9. '../input/cyclistic-one-year/one_year/202201-divvy-tripdata.csv'\n",
       "10. '../input/cyclistic-one-year/one_year/202202-divvy-tripdata.csv'\n",
       "11. '../input/cyclistic-one-year/one_year/202203-divvy-tripdata.csv'\n",
       "12. '../input/cyclistic-one-year/one_year/202204-divvy-tripdata.csv'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"../input/cyclistic-one-year/one_year/202105-divvy-tripdata.csv\"\n",
       " [2] \"../input/cyclistic-one-year/one_year/202106-divvy-tripdata.csv\"\n",
       " [3] \"../input/cyclistic-one-year/one_year/202107-divvy-tripdata.csv\"\n",
       " [4] \"../input/cyclistic-one-year/one_year/202108-divvy-tripdata.csv\"\n",
       " [5] \"../input/cyclistic-one-year/one_year/202109-divvy-tripdata.csv\"\n",
       " [6] \"../input/cyclistic-one-year/one_year/202110-divvy-tripdata.csv\"\n",
       " [7] \"../input/cyclistic-one-year/one_year/202111-divvy-tripdata.csv\"\n",
       " [8] \"../input/cyclistic-one-year/one_year/202112-divvy-tripdata.csv\"\n",
       " [9] \"../input/cyclistic-one-year/one_year/202201-divvy-tripdata.csv\"\n",
       "[10] \"../input/cyclistic-one-year/one_year/202202-divvy-tripdata.csv\"\n",
       "[11] \"../input/cyclistic-one-year/one_year/202203-divvy-tripdata.csv\"\n",
       "[12] \"../input/cyclistic-one-year/one_year/202204-divvy-tripdata.csv\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# load the tidyverse, fs, janitor, treemapify, and patchwork packages.\n",
    "packages <- c(\"tidyverse\", \"fs\", \"janitor\",\n",
    "              \"patchwork\", \"treemapify\")\n",
    "\n",
    "invisible(lapply(packages, library, character.only = TRUE))\n",
    "\n",
    "# get files using the 'fs' library\n",
    "dir  <- \"../input/cyclistic-one-year/one_year\"\n",
    "files  <- list.files(dir, \"\\\\.csv$\", full.names = TRUE)\n",
    "\n",
    "# make sure the correct files are in the list\n",
    "files\n",
    "\n",
    "# save files to a data frame\n",
    "cyc_init <- do.call(rbind, lapply(files, read.csv))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "4f197fed",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:21:04.444430Z",
     "iopub.status.busy": "2022-07-03T18:21:04.412755Z",
     "iopub.status.idle": "2022-07-03T18:21:10.635292Z",
     "shell.execute_reply": "2022-07-03T18:21:10.633741Z"
    },
    "papermill": {
     "duration": 6.235029,
     "end_time": "2022-07-03T18:21:10.637622",
     "exception": false,
     "start_time": "2022-07-03T18:21:04.402593",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 5,757,551\n",
      "Columns: 13\n",
      "$ ride_id            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"C809ED75D6160B2A\", \"DD59FDCE0ACACAF3\", \"0AB83CB88C…\n",
      "$ rideable_type      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"electric_bike\", \"electric_bike\", \"electric_bike\", …\n",
      "$ started_at         \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"2021-05-30 11:58:15\", \"2021-05-30 11:29:14\", \"2021…\n",
      "$ ended_at           \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"2021-05-30 12:10:39\", \"2021-05-30 12:14:09\", \"2021…\n",
      "$ start_station_name \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\",…\n",
      "$ start_station_id   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\",…\n",
      "$ end_station_name   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\",…\n",
      "$ end_station_id     \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\",…\n",
      "$ start_lat          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.90000, 41.88000, 41.92000, 41.92000, 41.94000, 4…\n",
      "$ start_lng          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.63000, -87.62000, -87.70000, -87.70000, -87.690…\n",
      "$ end_lat            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.89000, 41.79000, 41.92000, 41.94000, 41.94000, 4…\n",
      "$ end_lng            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.61000, -87.58000, -87.70000, -87.69000, -87.700…\n",
      "$ member_casual      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"casual\", \"casual\", \"casual\", \"casual\", \"casual\", \"…\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type       started_at          ended_at        \n",
       " Length:5757551     Length:5757551     Length:5757551     Length:5757551    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       " start_station_name start_station_id   end_station_name   end_station_id    \n",
       " Length:5757551     Length:5757551     Length:5757551     Length:5757551    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "   start_lat       start_lng         end_lat         end_lng      \n",
       " Min.   :41.64   Min.   :-87.84   Min.   :41.39   Min.   :-88.97  \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Median :41.90   Median :-87.64   Median :41.90   Median :-87.64  \n",
       " Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65  \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       " Max.   :45.64   Max.   :-73.80   Max.   :42.17   Max.   :-87.49  \n",
       "                                  NA's   :4766    NA's   :4766    \n",
       " member_casual     \n",
       " Length:5757551    \n",
       " Class :character  \n",
       " Mode  :character  \n",
       "                   \n",
       "                   \n",
       "                   \n",
       "                   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# viewing and cleaning data:\n",
    "glimpse(cyc_init)\n",
    "summary(cyc_init)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "2295575d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:21:10.656373Z",
     "iopub.status.busy": "2022-07-03T18:21:10.654897Z",
     "iopub.status.idle": "2022-07-03T18:21:10.725844Z",
     "shell.execute_reply": "2022-07-03T18:21:10.724107Z"
    },
    "papermill": {
     "duration": 0.08292,
     "end_time": "2022-07-03T18:21:10.728286",
     "exception": false,
     "start_time": "2022-07-03T18:21:10.645366",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>C809ED75D6160B2A</td><td>electric_bike</td><td>2021-05-30 11:58:15</td><td>2021-05-30 12:10:39</td><td></td><td></td><td></td><td></td><td>41.90</td><td>-87.63</td><td>41.89</td><td>-87.61</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>DD59FDCE0ACACAF3</td><td>electric_bike</td><td>2021-05-30 11:29:14</td><td>2021-05-30 12:14:09</td><td></td><td></td><td></td><td></td><td>41.88</td><td>-87.62</td><td>41.79</td><td>-87.58</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>0AB83CB88C43EFC2</td><td>electric_bike</td><td>2021-05-30 14:24:01</td><td>2021-05-30 14:25:13</td><td></td><td></td><td></td><td></td><td>41.92</td><td>-87.70</td><td>41.92</td><td>-87.70</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>7881AC6D39110C60</td><td>electric_bike</td><td>2021-05-30 14:25:51</td><td>2021-05-30 14:41:04</td><td></td><td></td><td></td><td></td><td>41.92</td><td>-87.70</td><td>41.94</td><td>-87.69</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>853FA701B4582BAF</td><td>electric_bike</td><td>2021-05-30 18:15:39</td><td>2021-05-30 18:22:32</td><td></td><td></td><td></td><td></td><td>41.94</td><td>-87.69</td><td>41.94</td><td>-87.70</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>F5E63DFD96B2A737</td><td>electric_bike</td><td>2021-05-30 11:33:41</td><td>2021-05-30 11:57:17</td><td></td><td></td><td></td><td></td><td>41.88</td><td>-87.63</td><td>41.89</td><td>-87.62</td><td>casual</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 13\n",
       "\\begin{tabular}{r|lllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & C809ED75D6160B2A & electric\\_bike & 2021-05-30 11:58:15 & 2021-05-30 12:10:39 &  &  &  &  & 41.90 & -87.63 & 41.89 & -87.61 & casual\\\\\n",
       "\t2 & DD59FDCE0ACACAF3 & electric\\_bike & 2021-05-30 11:29:14 & 2021-05-30 12:14:09 &  &  &  &  & 41.88 & -87.62 & 41.79 & -87.58 & casual\\\\\n",
       "\t3 & 0AB83CB88C43EFC2 & electric\\_bike & 2021-05-30 14:24:01 & 2021-05-30 14:25:13 &  &  &  &  & 41.92 & -87.70 & 41.92 & -87.70 & casual\\\\\n",
       "\t4 & 7881AC6D39110C60 & electric\\_bike & 2021-05-30 14:25:51 & 2021-05-30 14:41:04 &  &  &  &  & 41.92 & -87.70 & 41.94 & -87.69 & casual\\\\\n",
       "\t5 & 853FA701B4582BAF & electric\\_bike & 2021-05-30 18:15:39 & 2021-05-30 18:22:32 &  &  &  &  & 41.94 & -87.69 & 41.94 & -87.70 & casual\\\\\n",
       "\t6 & F5E63DFD96B2A737 & electric\\_bike & 2021-05-30 11:33:41 & 2021-05-30 11:57:17 &  &  &  &  & 41.88 & -87.63 & 41.89 & -87.62 & casual\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 13\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;chr&gt; | ended_at &lt;chr&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | C809ED75D6160B2A | electric_bike | 2021-05-30 11:58:15 | 2021-05-30 12:10:39 | <!----> | <!----> | <!----> | <!----> | 41.90 | -87.63 | 41.89 | -87.61 | casual |\n",
       "| 2 | DD59FDCE0ACACAF3 | electric_bike | 2021-05-30 11:29:14 | 2021-05-30 12:14:09 | <!----> | <!----> | <!----> | <!----> | 41.88 | -87.62 | 41.79 | -87.58 | casual |\n",
       "| 3 | 0AB83CB88C43EFC2 | electric_bike | 2021-05-30 14:24:01 | 2021-05-30 14:25:13 | <!----> | <!----> | <!----> | <!----> | 41.92 | -87.70 | 41.92 | -87.70 | casual |\n",
       "| 4 | 7881AC6D39110C60 | electric_bike | 2021-05-30 14:25:51 | 2021-05-30 14:41:04 | <!----> | <!----> | <!----> | <!----> | 41.92 | -87.70 | 41.94 | -87.69 | casual |\n",
       "| 5 | 853FA701B4582BAF | electric_bike | 2021-05-30 18:15:39 | 2021-05-30 18:22:32 | <!----> | <!----> | <!----> | <!----> | 41.94 | -87.69 | 41.94 | -87.70 | casual |\n",
       "| 6 | F5E63DFD96B2A737 | electric_bike | 2021-05-30 11:33:41 | 2021-05-30 11:57:17 | <!----> | <!----> | <!----> | <!----> | 41.88 | -87.63 | 41.89 | -87.62 | casual |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 C809ED75D6160B2A electric_bike 2021-05-30 11:58:15 2021-05-30 12:10:39\n",
       "2 DD59FDCE0ACACAF3 electric_bike 2021-05-30 11:29:14 2021-05-30 12:14:09\n",
       "3 0AB83CB88C43EFC2 electric_bike 2021-05-30 14:24:01 2021-05-30 14:25:13\n",
       "4 7881AC6D39110C60 electric_bike 2021-05-30 14:25:51 2021-05-30 14:41:04\n",
       "5 853FA701B4582BAF electric_bike 2021-05-30 18:15:39 2021-05-30 18:22:32\n",
       "6 F5E63DFD96B2A737 electric_bike 2021-05-30 11:33:41 2021-05-30 11:57:17\n",
       "  start_station_name start_station_id end_station_name end_station_id start_lat\n",
       "1                                                                     41.90    \n",
       "2                                                                     41.88    \n",
       "3                                                                     41.92    \n",
       "4                                                                     41.92    \n",
       "5                                                                     41.94    \n",
       "6                                                                     41.88    \n",
       "  start_lng end_lat end_lng member_casual\n",
       "1 -87.63    41.89   -87.61  casual       \n",
       "2 -87.62    41.79   -87.58  casual       \n",
       "3 -87.70    41.92   -87.70  casual       \n",
       "4 -87.70    41.94   -87.69  casual       \n",
       "5 -87.69    41.94   -87.70  casual       \n",
       "6 -87.63    41.89   -87.62  casual       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# viewing data frame and removing rows that were\n",
    "# converted to empty strings during import\n",
    "\n",
    "head(cyc_init)\n",
    "\n",
    "cyc_init <- cyc_init %>%\n",
    "    select(-start_station_id, -start_station_name,\n",
    "           -end_station_id, -end_station_name)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "94d96b44",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:21:10.748317Z",
     "iopub.status.busy": "2022-07-03T18:21:10.746653Z",
     "iopub.status.idle": "2022-07-03T18:21:12.861893Z",
     "shell.execute_reply": "2022-07-03T18:21:12.859990Z"
    },
    "papermill": {
     "duration": 2.1281,
     "end_time": "2022-07-03T18:21:12.864582",
     "exception": false,
     "start_time": "2022-07-03T18:21:10.736482",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>C809ED75D6160B2A</td><td>electric_bike</td><td>2021-05-30 11:58:15</td><td>2021-05-30 12:10:39</td><td>41.90</td><td>-87.63</td><td>41.89</td><td>-87.61</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>DD59FDCE0ACACAF3</td><td>electric_bike</td><td>2021-05-30 11:29:14</td><td>2021-05-30 12:14:09</td><td>41.88</td><td>-87.62</td><td>41.79</td><td>-87.58</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>0AB83CB88C43EFC2</td><td>electric_bike</td><td>2021-05-30 14:24:01</td><td>2021-05-30 14:25:13</td><td>41.92</td><td>-87.70</td><td>41.92</td><td>-87.70</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>7881AC6D39110C60</td><td>electric_bike</td><td>2021-05-30 14:25:51</td><td>2021-05-30 14:41:04</td><td>41.92</td><td>-87.70</td><td>41.94</td><td>-87.69</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>853FA701B4582BAF</td><td>electric_bike</td><td>2021-05-30 18:15:39</td><td>2021-05-30 18:22:32</td><td>41.94</td><td>-87.69</td><td>41.94</td><td>-87.70</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>F5E63DFD96B2A737</td><td>electric_bike</td><td>2021-05-30 11:33:41</td><td>2021-05-30 11:57:17</td><td>41.88</td><td>-87.63</td><td>41.89</td><td>-87.62</td><td>casual</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 9\n",
       "\\begin{tabular}{r|lllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & C809ED75D6160B2A & electric\\_bike & 2021-05-30 11:58:15 & 2021-05-30 12:10:39 & 41.90 & -87.63 & 41.89 & -87.61 & casual\\\\\n",
       "\t2 & DD59FDCE0ACACAF3 & electric\\_bike & 2021-05-30 11:29:14 & 2021-05-30 12:14:09 & 41.88 & -87.62 & 41.79 & -87.58 & casual\\\\\n",
       "\t3 & 0AB83CB88C43EFC2 & electric\\_bike & 2021-05-30 14:24:01 & 2021-05-30 14:25:13 & 41.92 & -87.70 & 41.92 & -87.70 & casual\\\\\n",
       "\t4 & 7881AC6D39110C60 & electric\\_bike & 2021-05-30 14:25:51 & 2021-05-30 14:41:04 & 41.92 & -87.70 & 41.94 & -87.69 & casual\\\\\n",
       "\t5 & 853FA701B4582BAF & electric\\_bike & 2021-05-30 18:15:39 & 2021-05-30 18:22:32 & 41.94 & -87.69 & 41.94 & -87.70 & casual\\\\\n",
       "\t6 & F5E63DFD96B2A737 & electric\\_bike & 2021-05-30 11:33:41 & 2021-05-30 11:57:17 & 41.88 & -87.63 & 41.89 & -87.62 & casual\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 9\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;chr&gt; | ended_at &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | C809ED75D6160B2A | electric_bike | 2021-05-30 11:58:15 | 2021-05-30 12:10:39 | 41.90 | -87.63 | 41.89 | -87.61 | casual |\n",
       "| 2 | DD59FDCE0ACACAF3 | electric_bike | 2021-05-30 11:29:14 | 2021-05-30 12:14:09 | 41.88 | -87.62 | 41.79 | -87.58 | casual |\n",
       "| 3 | 0AB83CB88C43EFC2 | electric_bike | 2021-05-30 14:24:01 | 2021-05-30 14:25:13 | 41.92 | -87.70 | 41.92 | -87.70 | casual |\n",
       "| 4 | 7881AC6D39110C60 | electric_bike | 2021-05-30 14:25:51 | 2021-05-30 14:41:04 | 41.92 | -87.70 | 41.94 | -87.69 | casual |\n",
       "| 5 | 853FA701B4582BAF | electric_bike | 2021-05-30 18:15:39 | 2021-05-30 18:22:32 | 41.94 | -87.69 | 41.94 | -87.70 | casual |\n",
       "| 6 | F5E63DFD96B2A737 | electric_bike | 2021-05-30 11:33:41 | 2021-05-30 11:57:17 | 41.88 | -87.63 | 41.89 | -87.62 | casual |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 C809ED75D6160B2A electric_bike 2021-05-30 11:58:15 2021-05-30 12:10:39\n",
       "2 DD59FDCE0ACACAF3 electric_bike 2021-05-30 11:29:14 2021-05-30 12:14:09\n",
       "3 0AB83CB88C43EFC2 electric_bike 2021-05-30 14:24:01 2021-05-30 14:25:13\n",
       "4 7881AC6D39110C60 electric_bike 2021-05-30 14:25:51 2021-05-30 14:41:04\n",
       "5 853FA701B4582BAF electric_bike 2021-05-30 18:15:39 2021-05-30 18:22:32\n",
       "6 F5E63DFD96B2A737 electric_bike 2021-05-30 11:33:41 2021-05-30 11:57:17\n",
       "  start_lat start_lng end_lat end_lng member_casual\n",
       "1 41.90     -87.63    41.89   -87.61  casual       \n",
       "2 41.88     -87.62    41.79   -87.58  casual       \n",
       "3 41.92     -87.70    41.92   -87.70  casual       \n",
       "4 41.92     -87.70    41.94   -87.69  casual       \n",
       "5 41.94     -87.69    41.94   -87.70  casual       \n",
       "6 41.88     -87.63    41.89   -87.62  casual       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# viewing data frame\n",
    "head(cyc_init)\n",
    "\n",
    "# removing duplicate rows\n",
    "cyc_init <- cyc_init %>%\n",
    "    distinct()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "bef32532",
   "metadata": {
    "papermill": {
     "duration": 0.008646,
     "end_time": "2022-07-03T18:21:12.881678",
     "exception": false,
     "start_time": "2022-07-03T18:21:12.873032",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "So far, the data have been imported, saved to a variable, and cleaned. There are no duplicates, no empty strings, and no missing observations. We'll now continue by summarizing and visualizing the data."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "6d6470e5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:21:12.902038Z",
     "iopub.status.busy": "2022-07-03T18:21:12.900391Z",
     "iopub.status.idle": "2022-07-03T18:21:13.314691Z",
     "shell.execute_reply": "2022-07-03T18:21:13.312815Z"
    },
    "papermill": {
     "duration": 0.427456,
     "end_time": "2022-07-03T18:21:13.317517",
     "exception": false,
     "start_time": "2022-07-03T18:21:12.890061",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>length(ride_id)</th></tr>\n",
       "\t<tr><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>5757551</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 1\n",
       "\\begin{tabular}{l}\n",
       " length(ride\\_id)\\\\\n",
       " <int>\\\\\n",
       "\\hline\n",
       "\t 5757551\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 1\n",
       "\n",
       "| length(ride_id) &lt;int&gt; |\n",
       "|---|\n",
       "| 5757551 |\n",
       "\n"
      ],
      "text/plain": [
       "  length(ride_id)\n",
       "1 5757551        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Type</th><th scope=col>Riders</th><th scope=col>Percentage</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>2536358</td><td>44.05272</td></tr>\n",
       "\t<tr><td>member</td><td>3221193</td><td>55.94728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Type & Riders & Percentage\\\\\n",
       " <chr> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 2536358 & 44.05272\\\\\n",
       "\t member & 3221193 & 55.94728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 3\n",
       "\n",
       "| Type &lt;chr&gt; | Riders &lt;int&gt; | Percentage &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | 2536358 | 44.05272 |\n",
       "| member | 3221193 | 55.94728 |\n",
       "\n"
      ],
      "text/plain": [
       "  Type   Riders  Percentage\n",
       "1 casual 2536358 44.05272  \n",
       "2 member 3221193 55.94728  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# let's gather some basic information\n",
    "# the number of rows\n",
    "cyc_init %>%\n",
    "    summarize(length(ride_id))\n",
    "\n",
    "# getting the number of riders by type\n",
    "cyc_init %>%\n",
    "    group_by(Type = member_casual) %>%\n",
    "    summarize(Riders = length(ride_id),\n",
    "              Percentage = length(ride_id) / nrow(cyc_init) * 100)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a4855ad0",
   "metadata": {
    "papermill": {
     "duration": 0.008983,
     "end_time": "2022-07-03T18:21:13.335400",
     "exception": false,
     "start_time": "2022-07-03T18:21:13.326417",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We have 5.7M rows (in this case, users). 55% of all users are members; 44% of all users are casual users. For a visual representation, we can:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "d4ed14e2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:21:13.356946Z",
     "iopub.status.busy": "2022-07-03T18:21:13.355233Z",
     "iopub.status.idle": "2022-07-03T18:21:26.663851Z",
     "shell.execute_reply": "2022-07-03T18:21:26.661025Z"
    },
    "papermill": {
     "duration": 13.326912,
     "end_time": "2022-07-03T18:21:26.671236",
     "exception": false,
     "start_time": "2022-07-03T18:21:13.344324",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\npftt2WlP1eCN+vBsSmvnVXmWslzVhqyV5eo6bt931n8tPv4Lt9320/t+9evf3P2dH8y7YvpZ\ne972+L0faqpOKWVZ9QbP1HmoiiyVis0b+uOdp/3gmVvXX/ufl6SLb/nFWT8prxr1jfcPX/9a\n78JDDQwUwg7oATuf87nCVafNeGjxKTfPK6/Zdu6OQzodUN14cFl2ZuuyHQ48cO/2ja2rn/zx\nfz82fNfajVv0tcdvS+lD7TcLzc/f/uqazfbav7pxl26tlV/x1CN/Wta0625HnTTjqJNmpJQW\n3Tl3p4O/dMbsR5+4Zq1C7dKyp25O6cAOI/3l9lfX1O0ypdv37U2fnb3r5Sf/6HsvPjP9wZe2\nPmhhU/lbT4Sua63qxr16/KEGBgovxQI9oH7LU/dvqL575l1f/v6zW37wsrpc5yeTyqu3nbNT\n49M3/ts9L61q37jg1EOnTZv2wsZeh1b837fOvePZN28VfjDj0BWF4qH/Mbm7a618+Zo999zz\nk5c82r5lm93fm1JqXdna3ZFWvnTDzJ888+at4k2zDnu9UPzAhRsfdmOnfqUsy845+WOv5Auf\nvuz9G7LWu/FQAwOFZ+yAHpHN/dTYydeefGex+bRLJv/TI8782bfmbX/0QeN2PvyoQ3bbrvHx\nX958493/O/H4G4/dfCOfRqoaVn3JITs9fvQJ7x036NF7f7jw/udHHjj36r226O5ag7e54IBh\n190zd9+Dn/30nhPGFpc9f9v188sqmuZc9J7ujlS31W5XfnzComkn7LHt4Mfu++Gt9z23+R5n\n3HjQqI27gymlysH7njVy0NfueLK6Yb/Z277tewG7WKvHH2pgwOjrT28AA1X7p2Lbbr7+16+n\nlMqrx7zeWmzb0unrTkql0rKnfn7yYVOGN9RX1jaOn7TP+fPuzL9xbGnB+KaqzSZ3PP+Q8tyo\nj9zdfvMfL1yY3v6p2H2//8j153920pjh1eWVw0ZNPGH2vOVvLt31WvO3b6xu2L/jWqte+s1p\nUw8YNXSz8lzZoKatpxz2mYWPLmkfrNPBz9w0Ja3jU7FjDvvl07d/de8dt6our2jccodPTb/i\n729+9nZduvhUbJsnr9snpbTrF37XceN61+ri7gOBZaWSX0YD0ANqy3LDD7nn2YUf7NnTPnzu\npD0u+cPCV1Yd2vTWZzjepbWAgc4bLgD6r2J+yanfXDRo5Fkdqw5gXbzHDqCfOuW0s1c9fetD\nr7d85tbpfT0LMDAIO4CecfiRRzbsPqwHT3j/zdc91zr42C/ecv0BW73bawExeI8dAEAQ3mMH\nABCEsAMACELYAQAEIewAAIIQdgAAQQg7AIAghB0AQBDCDgAgCGEHABDE/wNPrk70cnYORQAA\nAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#visualizing the data we just summarized\n",
    "cyc_init %>%\n",
    "    ggplot(aes(x = member_casual, fill = member_casual)) +\n",
    "    geom_bar() +\n",
    "    ylab(\"Total # of Members\") +\n",
    "    labs(fill = \"Members v. Casuals\",\n",
    "         title = \"Number of Riders by Membership Type\") +\n",
    "   scale_x_discrete(\"Membership Type\",\n",
    "                     labels = c(\"Casual\", \"Member\")) +\n",
    "    theme(legend.position = c(0.07, 0.90),\n",
    "          legend.justification = \"left\",\n",
    "          plot.title = element_text(hjust = 0.5,\n",
    "                                    face = \"bold\",\n",
    "                                    size = rel(2))) +\n",
    "    theme(axis.ticks.y = element_blank(),\n",
    "          axis.text.y = element_blank(),\n",
    "          axis.ticks.x = element_blank(),\n",
    "          axis.text.x = element_blank())"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9fc7dd81",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-01T13:14:22.42005Z",
     "iopub.status.busy": "2022-07-01T13:14:22.418219Z",
     "iopub.status.idle": "2022-07-01T13:14:22.432345Z"
    },
    "papermill": {
     "duration": 0.019181,
     "end_time": "2022-07-03T18:21:26.701702",
     "exception": false,
     "start_time": "2022-07-03T18:21:26.682521",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "After plotting this, I decided that it would be good to look at the entire year by month. This will demonstrate any large general changes throughout the chosen time period. I manipulated the data further to get this information. After creating a new column for the months, I decided to create a new column for the days of the week. A week-by-week analysis for the entire year could be messy; on the other hand, analyzing four weeks' worth of data for just one month would be too limiting. So, I believed it best to get an average for the entire year based on the day of the week. This will become clear in a moment. For now, let's finish manipulating the data."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "075ae9a4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:21:26.724825Z",
     "iopub.status.busy": "2022-07-03T18:21:26.723156Z",
     "iopub.status.idle": "2022-07-03T18:21:59.466623Z",
     "shell.execute_reply": "2022-07-03T18:21:59.464776Z"
    },
    "papermill": {
     "duration": 32.757679,
     "end_time": "2022-07-03T18:21:59.469158",
     "exception": false,
     "start_time": "2022-07-03T18:21:26.711479",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# modifying the data further\n",
    "# the code here will get the name of the month in which each trip was taken\n",
    "cyc_init <- cyc_init %>%\n",
    "    mutate(rides_monthly = lubridate::month(started_at,\n",
    "                                            label = TRUE, abbr = TRUE))\n",
    "\n",
    "# taking care of this as well before continuing\n",
    "# this code renames our data frame variable\n",
    "# and gets the name of the days of the week\n",
    "\n",
    "cyclistic <- cyc_init %>%\n",
    "    mutate(rides_daily = lubridate::wday(started_at, label = TRUE, abbr = TRUE))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c5b57afb",
   "metadata": {
    "papermill": {
     "duration": 0.010203,
     "end_time": "2022-07-03T18:21:59.489410",
     "exception": false,
     "start_time": "2022-07-03T18:21:59.479207",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "While reviewing this analysis, I noticed that the months were not in the correct order. To fix that, I went back and added this bit of code to the file:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "5946c7c5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:21:59.511753Z",
     "iopub.status.busy": "2022-07-03T18:21:59.510233Z",
     "iopub.status.idle": "2022-07-03T18:21:59.657793Z",
     "shell.execute_reply": "2022-07-03T18:21:59.655534Z"
    },
    "papermill": {
     "duration": 0.161827,
     "end_time": "2022-07-03T18:21:59.660629",
     "exception": false,
     "start_time": "2022-07-03T18:21:59.498802",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Jan'</li><li>'Feb'</li><li>'Mar'</li><li>'Apr'</li><li>'May'</li><li>'Jun'</li><li>'Jul'</li><li>'Aug'</li><li>'Sep'</li><li>'Oct'</li><li>'Nov'</li><li>'Dec'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Jan'\n",
       "\\item 'Feb'\n",
       "\\item 'Mar'\n",
       "\\item 'Apr'\n",
       "\\item 'May'\n",
       "\\item 'Jun'\n",
       "\\item 'Jul'\n",
       "\\item 'Aug'\n",
       "\\item 'Sep'\n",
       "\\item 'Oct'\n",
       "\\item 'Nov'\n",
       "\\item 'Dec'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Jan'\n",
       "2. 'Feb'\n",
       "3. 'Mar'\n",
       "4. 'Apr'\n",
       "5. 'May'\n",
       "6. 'Jun'\n",
       "7. 'Jul'\n",
       "8. 'Aug'\n",
       "9. 'Sep'\n",
       "10. 'Oct'\n",
       "11. 'Nov'\n",
       "12. 'Dec'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"Jan\" \"Feb\" \"Mar\" \"Apr\" \"May\" \"Jun\" \"Jul\" \"Aug\" \"Sep\" \"Oct\" \"Nov\" \"Dec\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'May'</li><li>'Jun'</li><li>'Jul'</li><li>'Aug'</li><li>'Sep'</li><li>'Oct'</li><li>'Nov'</li><li>'Dec'</li><li>'Jan'</li><li>'Feb'</li><li>'Mar'</li><li>'Apr'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'May'\n",
       "\\item 'Jun'\n",
       "\\item 'Jul'\n",
       "\\item 'Aug'\n",
       "\\item 'Sep'\n",
       "\\item 'Oct'\n",
       "\\item 'Nov'\n",
       "\\item 'Dec'\n",
       "\\item 'Jan'\n",
       "\\item 'Feb'\n",
       "\\item 'Mar'\n",
       "\\item 'Apr'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'May'\n",
       "2. 'Jun'\n",
       "3. 'Jul'\n",
       "4. 'Aug'\n",
       "5. 'Sep'\n",
       "6. 'Oct'\n",
       "7. 'Nov'\n",
       "8. 'Dec'\n",
       "9. 'Jan'\n",
       "10. 'Feb'\n",
       "11. 'Mar'\n",
       "12. 'Apr'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"May\" \"Jun\" \"Jul\" \"Aug\" \"Sep\" \"Oct\" \"Nov\" \"Dec\" \"Jan\" \"Feb\" \"Mar\" \"Apr\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "months <- cyclistic$rides_monthly %>%\n",
    "    levels()\n",
    "\n",
    "months\n",
    "\n",
    "correct_month_order <- c(\"May\", \"Jun\", \"Jul\", \"Aug\", \"Sep\", \"Oct\",\n",
    "                         \"Nov\", \"Dec\", \"Jan\", \"Feb\", \"Mar\", \"Apr\")\n",
    "\n",
    "cyclistic$rides_monthly <- cyclistic$rides_monthly %>%\n",
    "    fct_relevel(correct_month_order)\n",
    "\n",
    "cyclistic$rides_monthly %>% levels()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ae87aa3f",
   "metadata": {
    "papermill": {
     "duration": 0.009743,
     "end_time": "2022-07-03T18:21:59.679988",
     "exception": false,
     "start_time": "2022-07-03T18:21:59.670245",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The above code looks at the order of the months, corrects them, and saves them to the data frame in the order that they appear in our directory (May 2021 - April 2022). Now that this has been corrected, we can summarize and plot some more data."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "2a00be5a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:21:59.704401Z",
     "iopub.status.busy": "2022-07-03T18:21:59.702724Z",
     "iopub.status.idle": "2022-07-03T18:22:00.012503Z",
     "shell.execute_reply": "2022-07-03T18:22:00.010668Z"
    },
    "papermill": {
     "duration": 0.324067,
     "end_time": "2022-07-03T18:22:00.014759",
     "exception": false,
     "start_time": "2022-07-03T18:21:59.690692",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 12 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Month</th><th scope=col>Rides</th><th scope=col>Percentage</th></tr>\n",
       "\t<tr><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>May</td><td>531633</td><td> 9.233665</td></tr>\n",
       "\t<tr><td>Jun</td><td>729595</td><td>12.671968</td></tr>\n",
       "\t<tr><td>Jul</td><td>822410</td><td>14.284025</td></tr>\n",
       "\t<tr><td>Aug</td><td>804352</td><td>13.970384</td></tr>\n",
       "\t<tr><td>Sep</td><td>756147</td><td>13.133136</td></tr>\n",
       "\t<tr><td>Oct</td><td>631226</td><td>10.963446</td></tr>\n",
       "\t<tr><td>Nov</td><td>359978</td><td> 6.252276</td></tr>\n",
       "\t<tr><td>Dec</td><td>247540</td><td> 4.299397</td></tr>\n",
       "\t<tr><td>Jan</td><td>103770</td><td> 1.802329</td></tr>\n",
       "\t<tr><td>Feb</td><td>115609</td><td> 2.007954</td></tr>\n",
       "\t<tr><td>Mar</td><td>284042</td><td> 4.933382</td></tr>\n",
       "\t<tr><td>Apr</td><td>371249</td><td> 6.448037</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 12 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Month & Rides & Percentage\\\\\n",
       " <ord> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t May & 531633 &  9.233665\\\\\n",
       "\t Jun & 729595 & 12.671968\\\\\n",
       "\t Jul & 822410 & 14.284025\\\\\n",
       "\t Aug & 804352 & 13.970384\\\\\n",
       "\t Sep & 756147 & 13.133136\\\\\n",
       "\t Oct & 631226 & 10.963446\\\\\n",
       "\t Nov & 359978 &  6.252276\\\\\n",
       "\t Dec & 247540 &  4.299397\\\\\n",
       "\t Jan & 103770 &  1.802329\\\\\n",
       "\t Feb & 115609 &  2.007954\\\\\n",
       "\t Mar & 284042 &  4.933382\\\\\n",
       "\t Apr & 371249 &  6.448037\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 12 × 3\n",
       "\n",
       "| Month &lt;ord&gt; | Rides &lt;int&gt; | Percentage &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| May | 531633 |  9.233665 |\n",
       "| Jun | 729595 | 12.671968 |\n",
       "| Jul | 822410 | 14.284025 |\n",
       "| Aug | 804352 | 13.970384 |\n",
       "| Sep | 756147 | 13.133136 |\n",
       "| Oct | 631226 | 10.963446 |\n",
       "| Nov | 359978 |  6.252276 |\n",
       "| Dec | 247540 |  4.299397 |\n",
       "| Jan | 103770 |  1.802329 |\n",
       "| Feb | 115609 |  2.007954 |\n",
       "| Mar | 284042 |  4.933382 |\n",
       "| Apr | 371249 |  6.448037 |\n",
       "\n"
      ],
      "text/plain": [
       "   Month Rides  Percentage\n",
       "1  May   531633  9.233665 \n",
       "2  Jun   729595 12.671968 \n",
       "3  Jul   822410 14.284025 \n",
       "4  Aug   804352 13.970384 \n",
       "5  Sep   756147 13.133136 \n",
       "6  Oct   631226 10.963446 \n",
       "7  Nov   359978  6.252276 \n",
       "8  Dec   247540  4.299397 \n",
       "9  Jan   103770  1.802329 \n",
       "10 Feb   115609  2.007954 \n",
       "11 Mar   284042  4.933382 \n",
       "12 Apr   371249  6.448037 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "cyclistic %>%\n",
    "    group_by(Month = rides_monthly) %>%\n",
    "    summarize(Rides = length(ride_id),\n",
    "              Percentage = length(ride_id) / nrow(cyclistic) * 100)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6e85ea8e",
   "metadata": {
    "papermill": {
     "duration": 0.010299,
     "end_time": "2022-07-03T18:22:00.035134",
     "exception": false,
     "start_time": "2022-07-03T18:22:00.024835",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "As shown by this summary, the service is used most during the summer and fall months, after which usage begins to decline rapidly. We know that members make up the majority of users. Is this also true for each month, or could it only be for those warmer seasons? This information will help us understand more about users and their reasons for using Cyclistic."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "08d749c7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:22:00.058574Z",
     "iopub.status.busy": "2022-07-03T18:22:00.056954Z",
     "iopub.status.idle": "2022-07-03T18:23:35.013128Z",
     "shell.execute_reply": "2022-07-03T18:23:35.010362Z"
    },
    "papermill": {
     "duration": 94.98293,
     "end_time": "2022-07-03T18:23:35.028045",
     "exception": false,
     "start_time": "2022-07-03T18:22:00.045115",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n8OD66UdS7qgaIyIv39P7sFbhq8M/3hbjEBGR51cOrHX/lJ4TR98/vFzE1fYmIqcPfDVw+f6X\n768kIqK/OKdfrV5vvd31k2HLWpe+7L5S/pyY9Nr2tf1rX36Qurtb64m+yHt+/G1V5VCriAwb\n2r54kUYjHvzs4a2dNgxdYrKX/PmnL0vZzSIiMi6uRPhba94WaelJPzB43V8l7/1w3cJ2/p7a\nhdVvPWfz8vj0jnEhue8zl26v9NgEGT6KBQAg2Fmdlf05TEQc0S3DzKbYaq/6c5iIxN1+p4ik\nZ/lExJO2e/yehMqPzTuXtEREWoyaJiKL3zxwtb35uYr2PZvqRESzdJu6wmk2fT1q45XsSzT7\ne4/UvJIxphyd+mViRp0Xp/lTnYg4ohuufPP1kQ/Hikj7b/Yf/2vPufgluu9Mpq7r3jQR0Uwh\nNk2S9i7f/meKf+ltL24+efLkZVNd7t0WUMzYAQAQ7EyWmJxPLZrY46Kyn2oma/bjjITVXl3f\n+cot2ivnd3J65+mr7c0vqnr7f63vqNAy2vHZ8a8zEk5edl82V81C1iuaRUr+dYOI1G9UOGfj\nnQ8/dqeIiDgjoxO+XzNvzabdB3774/Chvb/8fDQp0xEpImK2l/x8crdWz71/S+mFpavdenu9\neg0aNevQ/p5oy+U+iM212wKKYAcAgEJMNhGpPmR29pxcNnvEFc2cXejCfGTRRDPZr2Rfmin0\nCvfiy/SJiE27eBpbNrBxh6kbitdqdN/d9VrVv3fguJuO9m3a/8TZpQ2GzDvx0LCVKz/ZuOmb\nzWvnLpg5dcAz9Vbu2tA0x1RiNt2nX2G3BRHBDgAAdTiiW5i1pz1JNzRrdnt2oyd937JVPxe5\nyXltfSbsWinSNPupN/PQx6cywm9r7IiuEcB9hVeqLbJ287Z4KR2e3bh+6GPzT0W9PbV1x6kb\nSrZ4649P+mYvmnPuQVbq/h93J8XcVKdT30Gd+g4Skb2rx1dtMeqpETv2vHmbv+ScOzq+PcH/\nwJ3ybS7dFlCcYwcAgDosjgpjqkb/Or/HumP/nCi28PE2nTt3Pnytf/NT/3rjuU8PnnvmXTCo\nTarX1+bF+oHdV3jpYTe5bN89Oej3jLM5zH16a/dpMz/ZVsiTts+r69E162SvnPb3lleOpojo\nInLm+Jv16tV74Pkd2UvL3FxXRDxnPCLiNJsyEj6NP3fKYMapb/utP+p/nHu3BVR+z9iN7Nz+\n5zPu9m8u6F7clbP9p5f6jvr6WOnWL0/vXelS2wIAgMt6+rM3Zlbq0rx8tfs7ta5TMXrX+sXz\n1x6o/tD8boWuccbOHud4vnXVXV161S0ftmPDkhVfHSrZbPyM2woHdl+aOeKj9/tVvH9a9QoN\ne3ZtVsSatGLmW397Q2d8+JAzztEkpt+Gl1r1tw6qU8J5cPe37761qnwRh/vPH1/7YGmvB8Y0\niXtn3fgGLQ72rHdjOV/SoZXvzjZbY8ZMqiUirbtVGjvh+5sadR/StVHWsX1zp0w7HmuTIx4R\nccZ1yqXbhzu3v1zJwciAGTvNrH393oF/NemeOd/Hmy/xsToAALhyrlIP/PLLJ73uKbVp+ayR\n46d9fzJ69MzVP87ues0d3vrqlpkju//5zYpJE1795vewXiNm7vp0uJYH+yrdZurez95sXO70\ne9PHj586R7/xvnmb9j9aKVJMjpU7Pu7aqPTK6aOfHvHyNwd8M7cfXLl0ZKkw9+BHHz+th63a\n+WX/DnfsXv3B+OeenTLzo8g7Hvxw2/4HS7hEpNbYja8P6Bz257rBj/UePOalpOqdvljS8Oz+\ncu02yePLrdZgpel6vs43juzc/vhtVU5+fWrxkhnZJ0ieOTq/61NfN3Qm/dZgwhXO2Hkzz5jt\nFzkf0+fzJSQkBLLiiwkLC3Ns3Z7Xe0GQyFi92OgS8lzK4FFGl3BxTqfT6XTmz+91/ouKikpL\nS8vMzDS6kABzOBwul0tE4uPjja4l8CIiItxud3p6egD7jI2NDWBvuBRfZvKRk55SJaID2KdR\nL/JcXjMGzNiFl+5eRP6efzg1u+XA+19HV+8dkqMW9+l9b04a1r3TA23bte/d/9mlm4/42x+8\nv80nJ+NnvzD8od5T87lsAABQcJns4YFNdcHJiKtiTfbetWPfmLvn4dG3iojoWbN/OFnvpSq+\n0f+sMm/I2C1hdz41sme0zbv7qznvvjSwQd2FhW0mEdk8fexNDXpM7lE+e+U5c+Z8//33/seh\noaGTJk3K6xGYzea83gWQnyIiIowu4eJMJpOIaJoWtBVeD5PJ5HQ6HY6L3I6hQPMfNQni19X1\nsFgsJpPJZrMZXUjBc2hFq1q9Nueygj2i4bFDK/OtnoAw5EXu8+X2GbExtzu5ofudCU+9m+67\nJcSkpf614IivyMulXHNzrFCoWYcnGre6OcImIiWKPDBz1biDmZ7CNpuInC7cp1OTGjl7++23\n37Zt2+Z/HBUVZbWef2dFALkL8t8aTdOCvMJrZjabFf5HkaOGnMrc/0ni/UYXEWiGvMi9Xm8u\nS40Jdq5iD5Y2rZx7KPmxchEH3vsmpuYj9n9fOdG6bfOd321Zfvjo8ePHft/7fc5FRRuXPK+3\nunXrOp1nr74JCQnJyMjI0+JF3Xcr/Gflw2/NtbFYLBaLRdd19U5EExG73e7xeHJ/jy6IzGaz\n/00yaF9X18Nms/l8Po/HE8A+1Zu1/e8w5EXu8/myY8+FDLpBsWbpeWvctNk7Hxt/y6wf4+tP\nuSHnQl9W/IR+/Q+EVm1Wv+aNdSs3bd1wwJPjspc6w86vuU2bNm3atDm7bX5dPJHXuwDyU2pq\n6uVXMoLT6fQHu6Ct8HpYrdaMjAz1MqvD4fAHOyWPWl5cPEGwK7iMepEHX7ATqdilUcLjs/4+\nfOAvKdalxL9yUuqRWT+ccM9bPjLSrIlI5umNxpQIAABQoBj2zRPOwu0rWpPHvbw2rvbDtn/f\nwM4aVlHXPSs27TwRf3zfj+tfGj5PRA7/nVQg7ycDAACQX4z7SjHN/FD9Qkf/OHNn9xvOWxIS\n227MQy22zX+xX/8h7674qcWwGc0qxi4a2v9ghmpnogAAAARQft+gOK9xg2IEHDcoNhA3KC6I\nuEHx1eIGxQUXNygGAABAXjHs4gkAAJC7lJSUPOqZ2zuoimAHAEDwsk0YHvA+3SMmBrxPBAk+\nigUAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAACA8aKt5od/\nTTS6igKPYAcAAKAIgh0AAIAiCHYAAOAfWam7hzzYvFLxSGdk4cadBu1MzfK3p5/Y8tj9DYpE\nuix2Z9lqd05aus/ffmjNWy3rVo0OtccWL9fm0eeTvbqIiJ6padrEP//5rttidov/k9ZL9YOA\nINgBAIBzdHefWvVn7416Yc6n65a/VejnWXfdOsy/5Nn6LZf9VXXWqnXbv1n7dFPfyM63/J7h\ndSd/XaPV43LvM59t+nbJ64N+mDuixfQ9ue/hov3k/cD+KyxGFwAAAIJFwt7B7x10b0yY2yDC\nJiI11sW36rLgb7evqM1Upu+wWQ890TIuREQql3/u6Vdb7TjjjklZk+L1PdKvS72iTqlT68tl\nRX91xuS+i4v2U9YRkg+j+y8g2AEAgLOOrNriiLrHn+pEJLRYnw0b+vgfPz3gsQ2rlr24a/+h\nQwd/+uZTf6OrxDNd685pV6Zsw+b33FG/ftPmbe+rViT3XVy0HwQKH8UCAICzfJk+zeS4sN2b\n+WeriiU6jlt42hxzZ6uury39wN9ussTO33Zk5/o5reuW2Lv+vaY1SzR/du1Fe87w6bn0g0Bh\nxg4AAJxVvFWNjPHLtqdm3eyyikja8fnlaw6Zs+fQzYcHrv4j4++MjwtbTSKSduJsIDu+ecrk\nFe5XX362Sv0WT4nseev2WoOHyPM7/EsTsnz+B2knliZ6fCKSuO/i/SBQmLEDAABnxdacfl9h\nX8smfT/ZsO3Hzav73fNMhqv1vVF2e0xd3ed+edHGP478vuXzeZ0aDRWRPb+dsBRKmfbKsO4T\n5n67Y+d3G1dOnrE/4oYOIiKavV64fVGfST/s/2Pn1tW9Gj9q0jQRuVQ/XD0RKMzYAQCAszSz\na/HO9YP6PPfUg01PeiPqNOm98c1xIhJWYvCaFw89+VzH15MtN93SeMyy3UW6VR97R7XmCQmr\nX4kf+vrQBmMSIgqXrNOo98Y3B/u7WvXF9E69J91548vpXl/9nq93PDEk936MHLZCNF3Xja4h\nkHw+X0LevzjCwsLsdrvb7U5OTs7rfeUzTdNiYmISExO9XtX+fXK5XA6Hw+PxJCUlGV1L4MXE\nxCQnJ2dlZRldSIA5nU6n05k/v9f5LyoqKi0tLTMz0+hCAszhcLhcLhGJj483upbAi4iIcLvd\n6enpAewzNjb2UotSUlJsE4YHcF9+7hETw8LCAt7tRem+9OMJepFYZ/7sLp8Z9SLP5TXDjB0A\nAMgrmimkyCVDCAKPc+wAAAAUQbADAABQBMEOAABAEZxjd420jZuNLgH/FRmrF192HbeIQ+Qi\nNxUt+PxXFlzzad4pg0cFrBQACHrM2AEAACiCYAcAAKAIPooFACB4uUdMNLoEFCTM2AEAACiC\nGTsAAIJX+A+/BLzP5Do1At4nggQzdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgB\nAAAogmAHAACgCIIdAADIV2nHZ2madijTa3QhCiLYAQAAKIKjSeNwAAARjElEQVRgBwAALuTN\n8hm4+SV50pLypF9VEOwAAMA/itktI9bOrlUkzG6xFqlw6zvbTm6fN7hy0Si7K/bW+5+OP5fX\nfO6/Jj/e/qaKJRyumOoNO8zdcuyqNheRE9/OaVKzTIjNUeyGW8e890Pu3UZbzdMP/zmww93F\ny3bPxx9GwUOwAwAA/zLl/lcenf3lgV2b24cd7Hdn9XaL9Dmfb/tq8Zi9H0/vtOx3/zrDG9Z+\n6SttyLT5W9Ytf/Q2ebhBhXd/PX3lm4tI61aTGj41Zf26j55sYBv3UN3hW4/n3u2HvVtEtBj0\n1dZ38veHUcBouq4bXUMg+Xy+hISEvN5LWFiYY+v2vN4L4JexerHRJRRgKYNHGV3CJUVFRaWl\npWVmZhpdSIA5HA6XyyUi8fHxRtcSeBEREW63Oz09PYB9xsbGXmpRSkpK+A+/BHBffsl1aoSF\nhV1qaTG7pdyM3d/0vkFEjm1tWaz+mp9TM6s7LSIyoWzkwhZrds+ol3p0anjJQRsS0hpG2v1b\nvVolZkqJeYfXtrqSzdOOzwot0rv1wv/7qFN5/+bP3Rjzjow69IXvUt1GW82Fe63d+3ajgP80\nrodRL/JcXjOW/KwDAAAEv8L1z+YGa6TDbC/lj2UiEmMx6T5dRJL2rdF1311RjpxbRbr3i7S6\nks39+t9bIvtxl74Vp4xakrTPlUu3FR6qGtBRqolgBwAAcnGRs7asESEmS+TppCNajkbNZLvC\nzS9cYIu2aSZr7t2GR1+0f/wL59gBAICrE1Guj+49/fZfWaFnOUe3adb3/YNX1cmML//Kfrzw\nlb0RlboFpNv/OINn7HRvcs8Huidk+frPW3LPv6deAQBAcHJEt5zatPiwO1q7Xht2W6WotbMG\nTdt89LOlZa6qk4+7N30hY2rjCqGb5k8cszP51V1tHNFR19/tf5zBwS5xzzuJHomzmj9acuie\nRyobWwwAALhCT3zyQ9qTfSf1e+BYpr1yrbvnb1rZNMp+5ZubbUU/n9Jh6Ng+o//MqFCzzkvL\ndz1ZJer6u4XBV8V+8nS391ObDC7z9aRdMUsXvXD+B8O6V9fM2sU29GaeMdtDL2znqlioh6ti\nrwdXxeY/roq9WsF2VSyuXBBeFWvkOXbezMNzDyVX6HpPpW63ZKXtXfx3mr89M2ltmzbtD34x\nq1enDm3b/q/n40M+3Pynf9GD97f55GT87BeGP9R7qnGFAwAABCMjP4o9sXVmlm55uF4hl61b\nIdvqDfP2dX629rmFWc++s+X+RwbWKhayZ+PSeS8+aZr2XrsyYSKyefrYmxr0mNyjfHY/X3zx\nxf79+/2PHQ5H165d87pyi4WriYGCITT0IlP7QcJkMtntdvXeT7JHFMw//GtmNpttNpvJxKWH\nEDHoRe7z5fZlbUa+oaye/6urRJeyDrNISM8bIl/ePjNDf8OhaSKi6/qN/cZ3blRMRCrfWDt1\nT5cVr33bbkpTETlduE+nJjVy9rNp06Y1a9b4H0dFRfXp0yffhwIgSIWEhBhdQm5sNpVv3xDk\nP/xrZjKZrFar0VUgKBjyIvd6vbksNSzYuVO2fxSfXqlXmcOHD4tIeONS3p075hxMfqx8hH+F\n5nX/+fz4rnuLrlqwUaSpiBRtXPK8rooVK1alShX/Y5fL5fF48rp4s9mc17sAEBD58IZwzcxm\ns8/nU+zrf0TEZDL5J7SC+Yd/zcxms67ruU+ZXC31Zm3/Owx5kft8vlxyiGEvpiOffaDr+v5Z\nY/rnaPxu1k+PTWrof/yvmxNaTLp+9mfnDDu/5n79+vXr18//ON8unsjrXQAIiKSkJKNLuCTl\nL54I5h/+NcvniycQ5Ix6kQfjV4otWPVnWOmHPpjeLrtl67jeL+x4N9HTwCkiIp/vSKjboIh/\n0ZY1f4XEdTaiTAAAgALDmNM/M+I/3pbirvvo3Tkba/Ru7POefmf3Kf/TndNHfbhh268Hdn70\n9sgFh1JbPXWHEZUCAAAUGMbM2P36/mdmR6lHqkTmbAwt1qmma9nOWVtlnENERo/v/MGMtxYd\nTY0rXf7BgdM6VogwpFQAAAyUXKfG5VcCzjEm2FV/+s0VT1/YrI1b8KGIZCatFZHwcg0mTr/7\nvDUWrPgoH8oDACAYcEo3rhZ34gEAAFBEcAY7k9r3dgIAAMgLwXjvHHtk4w8/bGx0FQAAAAVM\ncM7YAQAA4KoR7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFBONVsQAA/HfEx8cbXYLYbLbw8HAR\nOXXqlK7rRpcTYGFhYT6f78yZM0YXkh+YsQMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQ\nBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRhMbqAgkq/q77b\n7U5OTja6kADTNC0mJiYxMdHr9RpdS4C5XC6Hw+HxeJKSkoyu5eqkVBt12XViYmKSk5OzsrLy\noZ785HQ6nU6nz+dLSEgwuhYAKACYsQMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEO\nAABAEQQ7AAAARXAfu2vh9XqzsrI8Ho/RheSJrKwsXdeNriLw/EdNvfvz+al91Hw+n9GF5AlV\nh+bz+VR9QYqIx+NR8m3Ef9SMriKveL1eJX/XLkpT9XcPAADgv4aPYgEAABRBsAMAAFAEwQ4A\nAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsABhgU+eKmqaV+9/cCxf9NLaO\npmnLT6XnxX6dZlPFzpvyoucrsXhE55JxrtgKvS5clPzHCO0CthBX2eq3PfP8ovQc98wfVToi\nrGifS+3C30+X/Ql5UT+A4MdXigEwzKEVvSZsbzni5jijC8kPZ47N7DRxUZm2g15uf++l1il8\ne/dutxc690xPP338qxUfvjqs8xf7zLvndvC3miwWs4//yQFcHMEOgGFiLKZJzXs8/venURbN\n6FryXPrJT0Wkz2ujHioZdql1it/zzEuja+ZsyZo6tHbh2rvnd9n7xv1VnBYRGfPbqTF5XCqA\ngot/+wAYZtbrrdPjVzcb/U0A+tLdmZ78++Zrnyfpar8HXvf5RMRuuroIaw2t9vzNhXRf1scJ\nefLZNADFEOwAGKZi14XPVIv54YUWy/4+c6l1hpQMDy85JGeL/yS8Q5leEVlUJTai9Kjv3xlQ\nIsIVYjNHFirX9bn3fCLb5w6tVaZwiN1VtuqtYxbuOa/PXz6c3LB66VCbPbZ45c5PvXLU/U9I\nS/1j09OdmpWKi7SHRleu1Wjs259ln94254aYqPJTM5O2db2rqsseneq9SI48/t2SLs1vi4t0\n2UIjKtVtMm7uRn/7yhvjCtX8WEQGlQgLjetwVT8lT4ZXRErZz37AMqlsZM5z7L5f9HyTmyuE\nOWwxRSt2eurVE25fzm1zGY4vK37Gs71qlC/isFrDY0o27vjkt/EZV1UYgCBEsANgGE0zj//i\nbaek9W06wnf51S8u7cQHd/Sfe8+jI9+c9nz9mMQPJve4tVPDBoPXt3xkxKSRffXffxzX7eZv\nkt3Z65/8cVTtjqNDbrxn4JDH65dLW/TaoJq3Pu6/OuHMXytrVmnyxscHGnfsM2pw3xoRf4x5\ntGWdHnOzt/V5EnrUvPd4yaaTXnsj5IK5t5PbX650R+elXye07PL4iCd6lE79YXTPu5uO/EpE\nbn9nyeI36olIn/dXfLRk+JWPzpP+fxP3JIQWbtshLuTCpb/M6HRL52GbD4V36DPw4bb1dswa\nckuHpdlLcx/Oqy1qPvHie3G3tBs+btwjD9yybdmMJjU6ZeXfpCeAvKEDQL77qlMFEdmblqXr\n+qbn6orIA+/96l+0Y0xtEVkWn+Z/OrhEWFiJwTm39a/we4ZH1/WFlWNEZNC6o/5F6ac+ERGz\nvdg3iRn+lv9b0EhEHtgd73/qT2MDl+8/25cva/aj1USk3UeHdF0fc2OM1VllS3x69r5WDKgp\nIhN+S9J1fXalaE3Tmk3/4RJj8j1QyGl1Vtn09xn/c2/WyYG1YjWTY9PpTF3XT/x0n4i8fCTl\nohufPjRcRIrc0fPZfwx98tHuNQqFuErd+cmfqdlrTiwT4SrSW9d1T/qvhWxmZ+H7diW7/YtS\nj6y7wWkVkQf3ncp9OFlp+02aVqr5suxFWwbfHhsbu+hE2iVGB6BgINgBMEDOYOfLOtU8NsQS\nUuGnVLd+9cHO6qycc2mY2VS4zpLsp6cPjRaR+3464X8aYtJcRfvmXD8r/Ven2RR309ysM7vM\nmlZ94LacSzOTvhKR6oO26f5gZ3Icd3svOqK0kx+KSLWnvs3ZmLB3kIjcveQ3/cqC3UXV7vjs\n0cx/dpod7P7e3F5E2q45nLOfbYOq+4Nd7sPxZBx2mLTwMl2+P5x80XoAFFB8FAvAYJolet7q\nYd6M39o8+N41bG6yxOR8atHEHhf1T+cm63nrR1Vv/6/1HRVaRjvSjn+dkbDaq+s7X7kl553k\n7JENReT0ztP+lW2umoWsF3/bzEhcIyLlupfN2egq2V1E/v7i2BWOpfaYHTnfoM+cOrp0Ursf\nFz/foMfaC1c+8fUhEelUOzZnY/metc7Wk+twzPaSn0/upv+58JbSkWVr3N6l74C3F32ekI9X\nnwDII9zuBIDx4m4eOavN7F4re4/57r62l1tZ911X/rjwqlSLJprJLiabiFQfMvulRsXOW8Ee\ncfYWJJopNJe6LrIvzSIi+rUGJmd0sfbDlt79Yui3X0wTaXbeUpPFJCLnnelncpwLtZcbToMh\n8048NGzlyk82bvpm89q5C2ZOHfBMvZW7NjSNcVxbtQCCATN2AIJC1/dXVQyxvtiyW7znwhuJ\n/Kvl+Pbr+lqFhF0r/9V15qGPT2WEl2vsiG5h1jRP0g3NcmjcoHRSUpJWxnnZbh1RzUTk9w8O\n5WxMPTJfRAo3Lnwd9ZqaRNqz0vdfuCDuzrIisuinUzkbj637/mw9uQ4nK3X/d999dyS8Qqe+\ng956f+XO3xP2fDYu7di3T43YcR2lAjAewQ5AULCGVl89s136qS/az/u/nO1Osykj4dP4rLNX\nzWac+rbf+qPXs6PUv9547tOD5555Fwxqk+r1tXmxvsVRYUzV6F/n91h3LC175YWPt+ncufPh\nK3inDIn9X7s45763H9568uxNQ3RPwuQu72om+6hWJa+nYLOmeTP/vrA9tsbkQjbzFz2e2n/G\n429xn/750SE/+h/nPpwzx9+sV6/eA8//E+PK3FxXRDznugJQQPFRLIBgUb7LggHPfzll17+m\noFp3qzR2wvc3Neo+pGujrGP75k6ZdjzWJkeuPX/Y4xzPt666q0uvuuXDdmxYsuKrQyWbjZ9x\nW2ERefqzN2ZW6tK8fLX7O7WuUzF61/rF89ceqP7Q/G6FLj9jJ2J68+ORX9Qfflf5Oj0evr+s\nK/2r5XM+35PYaPi6xpH2a65WREqHWHRf0jfJ7jvCbTnbzY6ya19ud9OTS2uVva1b13sLyfFP\n5s4/Xe9BWTPbv0Iuw9FjxjaJe2fd+AYtDvasd2M5X9Khle/ONltjxkyqdT2lAjCeUVdtAPgv\ny3lVbE6pf30YZjZJjqtifd4zrw/ofEPpIlZNE5Hi9bt/s6W55Lgq1h5eP2cPURZTqXvXZj9N\nPjxB/n1VbIMPfnx3dJ+aZYs4LLa4UtV7jZh52uPLXj9p/5pH2jYsEumyOaMr17xj9MzVWecW\nzq4U7YhsnPu4/vrmg05Nb4kJD7E4wsrXvnvsnA3Zi67kqtjzLp7w+2lSHRGp+OBC/9Psq2L9\nvv1g4t21yrnslrDYkv97/PWU1D1y7nYnuQ8n7djmJzo2KRUbbjGZw2JKNGz78Iod8bmPDkDw\n03Sdy6AAFAC+zOQjJz2lSkQbXQgABC+CHQAAgCK4eAIAAEARBDsAAABFEOwAAAAUQbADAABQ\nBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFDE/wP6\nTIy4dG5KwwAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "cyclistic %>%\n",
    "    ggplot(aes(x = rides_monthly, y = length(ride_id), fill = member_casual)) +\n",
    "    geom_col() +\n",
    "    coord_flip() +\n",
    "    scale_x_discrete(limits = rev) +\n",
    "    labs(title = \"Riders per Month\",\n",
    "         subtitle = \"by membership type\",\n",
    "         x = \"Months\",\n",
    "         y = \"Number of Rides\",\n",
    "         colors = \"Membership Type\") +\n",
    "    theme(plot.title = element_text(face = \"bold\"),\n",
    "          plot.title.position = \"panel\",\n",
    "          legend.position = c(0.85, 0.10),\n",
    "          legend.direction = \"vertical\",\n",
    "          axis.ticks.x = element_blank(),\n",
    "          axis.text.x = element_blank())"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ff4baa38",
   "metadata": {
    "papermill": {
     "duration": 0.010715,
     "end_time": "2022-07-03T18:23:35.049474",
     "exception": false,
     "start_time": "2022-07-03T18:23:35.038759",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "It appears that casual users use the service as much as, if not more than, annual members in those warmer months. This might suggest that annual members (some of them, at least) use the service for work or school commutes, in addition to leisurely trips around the city. On a weekly basis:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "f68d1870",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:23:35.074147Z",
     "iopub.status.busy": "2022-07-03T18:23:35.072641Z",
     "iopub.status.idle": "2022-07-03T18:23:35.470206Z",
     "shell.execute_reply": "2022-07-03T18:23:35.468455Z"
    },
    "papermill": {
     "duration": 0.412441,
     "end_time": "2022-07-03T18:23:35.472552",
     "exception": false,
     "start_time": "2022-07-03T18:23:35.060111",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 7 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Day</th><th scope=col>Rides</th><th scope=col>Percentage</th></tr>\n",
       "\t<tr><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Sun</td><td> 865074</td><td>15.02503</td></tr>\n",
       "\t<tr><td>Mon</td><td> 734664</td><td>12.76001</td></tr>\n",
       "\t<tr><td>Tue</td><td> 769230</td><td>13.36037</td></tr>\n",
       "\t<tr><td>Wed</td><td> 791837</td><td>13.75302</td></tr>\n",
       "\t<tr><td>Thu</td><td> 783904</td><td>13.61523</td></tr>\n",
       "\t<tr><td>Fri</td><td> 811484</td><td>14.09426</td></tr>\n",
       "\t<tr><td>Sat</td><td>1001358</td><td>17.39208</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 7 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Day & Rides & Percentage\\\\\n",
       " <ord> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Sun &  865074 & 15.02503\\\\\n",
       "\t Mon &  734664 & 12.76001\\\\\n",
       "\t Tue &  769230 & 13.36037\\\\\n",
       "\t Wed &  791837 & 13.75302\\\\\n",
       "\t Thu &  783904 & 13.61523\\\\\n",
       "\t Fri &  811484 & 14.09426\\\\\n",
       "\t Sat & 1001358 & 17.39208\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 7 × 3\n",
       "\n",
       "| Day &lt;ord&gt; | Rides &lt;int&gt; | Percentage &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| Sun |  865074 | 15.02503 |\n",
       "| Mon |  734664 | 12.76001 |\n",
       "| Tue |  769230 | 13.36037 |\n",
       "| Wed |  791837 | 13.75302 |\n",
       "| Thu |  783904 | 13.61523 |\n",
       "| Fri |  811484 | 14.09426 |\n",
       "| Sat | 1001358 | 17.39208 |\n",
       "\n"
      ],
      "text/plain": [
       "  Day Rides   Percentage\n",
       "1 Sun  865074 15.02503  \n",
       "2 Mon  734664 12.76001  \n",
       "3 Tue  769230 13.36037  \n",
       "4 Wed  791837 13.75302  \n",
       "5 Thu  783904 13.61523  \n",
       "6 Fri  811484 14.09426  \n",
       "7 Sat 1001358 17.39208  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    " cyclistic %>%\n",
    "    group_by(Day = rides_daily) %>%\n",
    "    summarize(Rides = length(ride_id),\n",
    "              Percentage = length(ride_id) / nrow(cyclistic) * 100)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f26c6d57",
   "metadata": {
    "papermill": {
     "duration": 0.011007,
     "end_time": "2022-07-03T18:23:35.494489",
     "exception": false,
     "start_time": "2022-07-03T18:23:35.483482",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Users, regardless of their membership type, use the service more on the weekends. Which of the two types of members use the service the most on a weekly basis? Drilling down will allow us to further shape our idea of users' needs and habits."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "c51738e1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:23:35.520071Z",
     "iopub.status.busy": "2022-07-03T18:23:35.518525Z",
     "iopub.status.idle": "2022-07-03T18:24:57.874772Z",
     "shell.execute_reply": "2022-07-03T18:24:57.871654Z"
    },
    "papermill": {
     "duration": 82.390035,
     "end_time": "2022-07-03T18:24:57.895423",
     "exception": false,
     "start_time": "2022-07-03T18:23:35.505388",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd2CU9f3A8e9dLoMMRgARERUBxQUozrpxVcTVOlDrXlW02op74Wzr1mrVn7Va\ntdbZqrVV60Dr3nuhoqKgIrIC2cn9/jhMETFc4MiRr6/XX8dzT57nky9weedy9ySRTqcDAAAd\nXzLfAwAAkBvCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOWIA5X1yV+AHJ\nZGHXnituu+cxj38+p2X/184alrm319r3t37kTbqUZPYc8/HMJfxJ5N/jew3MfLKpkuUb57kY\nfO20+1rWc/uHPpv3Q/5v9R6Z7WW99sr5PLetNvfgG17+ds4PDiwNhB3QNul048ypEx++44pt\nB63/9Mz6fI+zVFvzxC0yN5rqJt37TU3L9hnjb2q5/f61H877Idd/XpW5sfxPj1zi8wHRSeV7\nAGBp13e1NboUJDK3000NX0748Ju6phBCw5x39jv44Y/u2iGEULJM/zXXrA8hVA6oyOOoS5tu\nq53RqeD6mqZ0COHm92b8fJNOme0f/+Wdln2+fv6uELbM3G6Y8/oLVXNbecsxq7fvsEAMhB2w\nEL974oW9e5a2/LFxzqcHrTX45o9nhRAmPXxeCDuEEAYdccebR+RtwqVWQXHfMX07n/PJzBDC\nezdMCJv0zmx/4qHJIYSC4oKmuqbqr26a2XRlJp1nT/pTZodkQenpq3bL09RAB+ZHsUDbpMpW\nPPXUtTK36+e8lt9hln4/P3RA5saXjz767bbma7+YE0IYePjBIYTmptnXfzn31YqT7n8hc6N8\n+d/0KfL4DLSZBw6gzdJNc98IUFg6t/B+6M0TL9z2+xEbDOpWWtx1mb47Hnjq+7MbfuCIDf/5\n01k7brpWz67lnbr2WnPdTcZcdMvkuqb59mqs/vjyUw/baHD/LmUlhZ3KlxsweNeDT3jg7Wmt\nT3vDqt0zs2187XtTnv/Lzzdbs7K8pO9q6+916K/vfeWrRZhk3K4rZw446MCnm+o+O/fwHVbo\nWb7f+wseo//+c98DMfvL/8u8f6J22r8+qW0MIQw/4vSuqWQI4b7/zh3jnb99mrkx4OCft3Vx\nst3tuxpmv75Zj06ZT2f9o25tfWegA0gDfM/syVe2PEr8dcqcee9qrPl8/5U6Z+4a+IuHMhtf\nHbtOZssyQ//Zsudtv950vgecihV3W720MHP7uAkzMrs1N8488acrfv/Rqaz3Jo98Wd1ytLqZ\nz2zSs9P3d0skS47724etfC5/XqUys+caY07snPrOd7OJROH+lzzfsmeWkzy2S7/M9lX2H3f0\n+stkbu/93jcLPn1z3YBOc1/0ctfX1el0+otn50bb23Mafr18RQihzxZzF22Hyrmf4PkTZ7Vp\npCx3+9ug7pntG1z2VjqdbmqYevCacxdn4O4XNzS3sopAxyDsgAWYN+xWXHPI0BaD11y2dG6m\ndBm48/jqhsz+3w+7z/9zTMsROvcbsuOuPx3Y6ztZ1hJ2444bltlS1GX1Y0899/djT9qi39x3\nYFT0HVX7bW3ctf0KmY2lvdYbffypp580ZpeN5wZWQVHvCTWNP/S5tIRdCCGRSA3eaOtdttmo\nsnBu4SULyv75TU2bJmkJu/J+/VuO/INhl07fvH6vzD67PDk5nU4/e8TqIYSSrsPT6fQTowaE\nEEp77p5OpxtrJxYkEiGEVPEK1U3pNo2U5W7fDbumC7/9RHpvfnxVo6yDGAg7YAHmDbsFWn74\nr6fUN7Xs//2wO6B3eWZL/1EXZqKhsXbiYWt1ny/sGms/6VVUEEJIJEvunDw787GNtZ+uX1GU\n2e3A577MbNyia0lmy2FvTZ171uaGQ1depry8vLy8/Mjx03/oc2kJu0Qicfo/3stsnPHuPSuV\nzC3UNY99vk2TtIRdCGHdfU976KmX33//3VbK8uN7ts3svOrBT6XT6d/26xJCWGadv6bT6c8f\n3SGEkEikJtY2zvzkzMxuPYdc9+3Zsxop+8nnDbv7T5r7fGq31febVNeUBqIg7IAFWGjYhRBW\nHXlWy/7zhV3t9EfmtlRBp7fnNLTsNn387+YLu6/fODjzx/JlD5k6j3+MnPuDxZV2ejjzsXt+\n+87cwvJ+ux5w9JV/+cfbE38w5ubVEnbd1/rdvNufP3lIZnvnvie3aZKWsKvoMzqbIGpZjS4r\nnpVON2WCcv1L3kyn09VTbsvcddKEGeP/Mre0Nr/lg8wHZjlS9pO3hF3vrTaf+xeU7PT8rLps\nlhHoEIQdsAA/9Bq7mhlf/f3CXVruunxSVWb7fGE3bfzc1Cjtucd3D9yUeW6pJeze+eNGC4rG\n/+m68sWZj5z4rzGdvr2cXoteA9be+6izHv9wViufS0vYDTv3tXm3T/9wdGZ7Sdct2zRJS9gN\nGPVEluu5c/dOIYSC4j5VU+/LfOxvPpyeTqfTzQ19igtCCBte8fa/hi+fuevOr+e+Ki7LkbKf\nvCXs5rXVpa9n+VkASz/vigXaoKTLMruOubvftz/EfOCDWQvcranmm7m3EvM9yCSX/TbsMuqn\nLeR3VzTVfZK50XfEhV99+Pwfzz9h5KZDWgrvqw9fvfXKM7dafeANn1QtfPrvzpJIzH0bR6Kg\nok2TtCgoKVjQjgtw7DZ9QghNdZNueu7aEEIikTyiT3kIISRSR/YuDyFM+Mvrd749PYRQ3Pkn\nu/WY+2LELEdahMlDCEVdls3cePykES9U/cC7lYGORtgBbZVseWfr7AmzF7hHUee5vzWh9pv7\nP6xtbNleX/XCW3O+0xBdh8y9DG/loD8v8LvPWZ9f0bJzxUrrHXHy7//539dmzZj06N9vPP7Q\n3TLP/zXVfzX2yOcXOventz867x8n3v105kbpstu3dZK2WvOkub9b4tyxz4YQirttO+DbOB4+\nok8IYcb4S++YWhNCWGbDk1s+KsuRFmHyksqNHv1w/F7LlYcQmuom7bHPzYv8qQFLFWEHtFlN\n89zr2NV9XbfAHcqWO6K8IBlCaG6aPfLwP9Y0hxBCunHGRfvt2ZROz7tnr58ck0wkQghVE3//\nYe3/Lro27vxf7bvvvvvuu+/Jt3wUQpj58Qn9+vXr16/fqoP3rG0OqfLew3fd/4L/u/Oewwdl\n9m+YXhMW5ps3jj/33xMyt2d99MBeZ829uvL6p26T/SSLpttqZ5YWJEMIX7w0LYTQdcBBLXet\nfOBaIYT6qherm5pDCOufsk7LXVmOtAiTDz7t/zbpUXHZP47K/HHi/Ydc+NZCLgcIdAh+pRjQ\nZk1hbpw1/MAFhwuKlr9ik2UPemJyCOH9m45Z/vlbthza58PnH3n9k/mf4SupHPmHrfuMfvjz\nhur311lty0P23m7lnkWvP3Hnn+55MYRQUNT7gcuvCyGU9TpwxucXz2hsDuGTARvX7rXl0G6l\nyS8+fPWmv76bOc52564TFiadbj5jx0H3bLJNv/I5/33kqSn1TSGEkq6b3bhbv+wnWTQFRX3G\n9K04+5OZmT/223/Nlru6DDg0hNsztxOJ5KnDerZ1cRZh8kQyEUJYZv3fnrn2n856dWo6nT57\n+6OO/vTWEt/sQ0e3SK/MAyLXygWK0+n0fr3KMnf12+XBzJbvX+6k+uv71+haPN8DTnmfkYO+\nd4Hihur391irMnxPYWn/y5+Y3HLSN689rDA5/5snMgbtfkErF2FrefPEoKN/lXnarEWqePnr\nX//f9eeynKTlzROrHvBU9kv6+vnrthzwpG8/94w1yuauSVmv/ef7qCxHynK3+S5QnE6nqz69\nIZWYu6rbX/1O9p8OsHTy3RnQZr/YfO7r7j/95+6ZV4Z9X6ceO7z2+bvXnv3rnYZvsGzn4s7d\nl9tu7+Oefuvu7qn5H3ZSnVa57ZUPbr1wzPBhA7uWF3fquuxa625yyEkXvfb527/arHfLbmse\ndu1nL9835uCfrz1oxYrSkmQyVVHZe70tdvndDY++fcfxCy6+76pc44gPxl2700aDunQqrOix\n3LZ7H/PY+PcOGvy/HspykkWz8n57Z24kEgW/XK583ruO7Dv3YsJ9dzxsvo/KcqRFnrx8hQNu\n3GnuVVEe/vWI1+d4FwV0bIn0d1/vAhCZG1btftD4aSGEn1zz7tPfviYPIEqesQMAiISwAwCI\nhLADAIiEy50Akdv091fdOLMuhLDMRov7BgiApZw3TwAARMKPYgEAIiHsAAAiIewAACIh7AAA\nIiHsAAAiIewAACIh7AAAIiHsAAAi0d6/eWLOnDmNjY3tfNLc6tSpUzKZbGhoqK+vz/csHVtR\nUVFhYWFzc3NNTU2+Z+nYUqlUcXFxCGHOnDn5nqVjSyQSpaWlIYTa2tqmpqZ8j9OxlZaWJhKJ\n+vr6hoaGfM/SsRUXF6dSqaamptra2nzP0rEVFhYWFRWl0+nq6up8z7K4unTp8kN3tXfYNTY2\ndvT/5GVlZalUKoJPJO+KioqsZE4kk8lUKhVCaGxs9LtkFkfLSjY1NflnuZgKCgqSyWRdXZ2V\nXEwlJSWpVKq5udlKLqZUKvVjWEk/igUAiISwAwCIhLADAIhEe7/Grri4OPMq744rmUyGEAoL\nC8vLy/M9S8eWeTFTMpm0koupoKAgc6OsrCy/k3R0iUQic6NTp04d/ZEq7zKLWVxc3PLvk0WT\neahMpVIeKhdTZiUTiURHX8nm5uZW7k2080utGxsbMysLAEBbNTU1tfL9Uns3VlNTU0d/114q\nlUokEs3Nza6GsJgyb5pLp9Md/Qo4eZdMJjP/yeN+q1c7SCQS3l+cK5mHyqamptafXWChMg+V\nvugsvmgeKpubm5eisKutre3oC9q1a9dUKlVfXz979ux8z9KxlZWVderUqampaebMmfmepWMr\n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\n19hg21+fe9kvNlo2hDDns0dHH3bqIy++VVXYa51hPznugis2rPnTetuMndxQNuGbLyqnP3/i\nMWfe++gLk6fN6dSt9zqbbnfsmb/fZWj3EEK6ufqPxx/yh7vHTZj4VUM63Wfj/W6/8OtNfvJA\n5gLFrR/2jtV6nDpj4+pv7l/gqFVVVUXnnpr9p5al+tPOq6hop4tNpptrvpqWXrbHIhZ/i6qq\nqs4vv5GTkVrMGja43dahnU2dOrXdzpVMJisrK0MuHqmorKxMJpNz5sypqanJ9ywdW0VFRXFx\ncX19/axZs/I9S9sshRcoXmq19QLFrbRQhGFHTjTXzfr868YVlq/M1QEjCLtcEXZtIuw6KGGX\nK8LuxyCHYedHsSxYsrjzCssvfDcAYOkh7JZSn/xj5NoHPd3KDsVdNv/yk3vabR4AYOkn7JZS\nK+16//Rd8z0EANCh/NgvdwIAEA1hBwAQCWEHABAJr7Gj/dSfdl6+R1hazBo2ON8jABAhYUc7\nifUqa4vAUgCwhPhRLABAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCQ63m+emDp1an4H6Nq1ayqVqq2tnT17dn4n6ejKyso6derU2Ng4Y8aMfM/SsRUXF2d+m8U3\n33yTTqfzPQ4AeeMZOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEik2vl8xcXFJSUl7XzS\n3EomkyGEwsLCioqKfM/SsaVSqRBCQUGBlVxMmX+TIYTy8vL8TtLRJRKJzI3S0tLm5ub8DtPR\nZRazuLg48z+dRVZYWBhCSKVSHioj1qa/3HQ63cq97f3/LZ1Otz5QR5FOpxNAsVYAACAASURB\nVD3uL6bMvwQrufhacsRKLqZ5V9Ji5oT/4Iuv4z5U+plg9tr0l9v6zu0ddvX19Q0NDe180twq\nLCxMJpONjY1z5szJ9ywdW1lZWSqVam5utpKLqbi4uKioKIRQXV0dxzdO+ZJMJjM/Uqitre3o\nj1R5V1xcnEgk6uvra2pq8j1Lx5ZMJgsKCpqamjrcQ6UnGLPX1r/csrKyH7praX+GvOLCs/M9\nwvyaQmgKIbH0/ZOtOv6MfI8AAOSTJ0oBACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewA\nACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHs\nAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh\n7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIpHK9wAAsLSouPDsfI+wAHUhhBAq\n8jzFAlQdf0a+R2B+nrEDAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIRCrfAwA/XkvhL1zP/Lb1khBK8jzI/Py2dSAbnrEDAIiEsAMA\niISwAwCIhLADAIiEsAMAiIR3xQJ0eEvh+4sbQgghpEKoyPMg8/P+YuLmGTsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASLhAMbTZUngx2LoQQgjleZ5iAVwMFqA9ecYO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBKpfA9A+6m48Ox8jzC/uhBCCBV5nmIBqo4/I98jAECbecYOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nqXY+X2lpaTLZhppsXHKjRKdbt26t72Axs9f6YlrJ7FnJXLGSuWIlc8hi5spCv4LPq7m5uZV7\n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\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYAAJEQdgAAkRB2AACREHYAAJFItfP5EolEIpFo55P+SFjYHLKYuWIlc8VK5oqVzCGLmSs5\nXMn2DrvS0tJUqr1P+iPRvXv3fI8QD4uZK1YyV6xkrljJHLKYudKmlWxqamrlXj+KBQCIRHs/\neVZXV1dTU9POJ/2RqKqqyvcI8bCYuWIlc8VK5oqVzCGLmSttWsl0Ot25c+cfure9w66xsbGh\noaGdT/ojUVdXl+8R4mExc8VK5oqVzBUrmUMWM1dyuJJ+FAsAEAlhBwAQCWEHABAJYQcAEAlh\nBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJ\nYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQ\nCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcA\nEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEH\nABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlh\nBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJ\nYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQ\nCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcA\nEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEH\nABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlh\nBwAQiVQ7ny+RSCQSiXY+6Y+Ehc0hi5krVjJXrGSuWMkcspi5ksOVbO+wKy0tTaXa+6Q/Et27\nd8/3CPGwmLliJXPFSuaKlcwhi5krbVrJpqamVu5t78aqrq5ufSAW2fTp0/M9QjwsZq5YyVyx\nkrliJXPIYuZKm1YynU5XVlb+0L3tHXbpdFrYLSEWNocsZq5YyVyxkrliJXPIYuZKDlfSmycA\nACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHs\nAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh\n7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAi\nIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAA\nIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewA\nACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHs\nAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh\n7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAi\nIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAA\nIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewA\nACIh7AAAIiHsAAAiIewAACIh7AAAIpFq5/MVFBS08xl/PAoLC/M9QjwsZq5YyVyxkrliJXPI\nYuZKDleyvcOupKQklWrvk/5IdOnSJd8jxMNi5oqVzBUrmStWMocsZq60aSWbmppauTeRTqcX\ne542aGxsFHYAAIumqamplZ9/tndjVVdXNzQ0tPNJc6tLly6pVKq2tnbOnDn5nqVjKysrKykp\naWxsnDlzZr5n6diKiooqKipCCNOmTWvnb9Uik0wmu3XrFkKYNWtWR3+kyrtu3bolk8nq6uqa\nmpp8z9KxVVRUFBUV1dfXV1VV5XuWjq1Tp06lpaXNzc3Tp0/P9yyLq3v37j90V3uHXTqdjuYL\nTzSfSL60LKCVzJWY/n/lxbz/Jq1kTljJxeehMld+JCvpXbEAAJEQdgAAkRB2AACREHYAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACRSKTT6fY838yZMxsaGtrzjDn3+eefV1dXd+vWrWfPnvme\npWObOnXqtGnTSkpKVlhhhXzP0rHNnj178uTJIYQBAwYkk75bW3RNTU0fffRRCKFv376dOnXK\n9zgd24QJExobG3v27NmtW7d8z9KxffHFF1VVVeXl5cstt1y+Z+nYZsyYMWXKlIKCgv79++d7\nlsXVo0ePH7qrvcMuAgcccMBbb721xx57nHDCCfmepWO75JJLbr311kGDBt1yyy35nqVj+89/\n/nPKKaeEEJ555pmioqJ8j9OBffnllyNHjgwhXHvttcOGDcv3OB3biBEjpkyZMnr06AMPPDDf\ns3RsJ5544qOPPrrZZptdcskl+Z6lY7vlllsuu+yybt26Pfzww/meZQnyzT0AQCSEHQBAJIQd\nAEAkvMauzV544YVZs2b17dt31VVXzfcsHdv48eMnTpzYuXPn9ddfP9+zdGxfffXVm2++GUIY\nPny4N08sjtra2qeeeiqEMGzYMC/5X0xPPvlkXV3dgAEDVlpppXzP0rG98cYbU6ZM6dmz55Ah\nQ/I9S8c2ceLE8ePHFxUVbbbZZvmeZQkSdgAAkfDNPQBAJIQdAEAkUvkeYGn05iO33fHvJ8ZP\n/LKpoHSZvgM3337PPbdaLd9DdTCn77Xb63Pqd7v61v36lM+7/bULDzvjyS9X3OmiPxyySr5m\n63CePHKfCz+v+v72RKLo3nvvav95OqL3rxl9woNTbrr7ji4FicyWh371iz9+Ovvi2+8eUFKQ\n2fLKWQef82byzjuvSyWyOuZfDx710tbnX7rXykto5qVc6/8s9//ZLoP/cPNxfSraf7CO7uXj\n9z/r/enzbezU42e3//mA+TbutNNOu1x320G9Sttpsg5lEb6Oz/7i86qSZXp36/CXAhV28/v0\nvnNOu/61rfY4aLeDBxY3z57wxjM3X3nS+7MvPWPnH+nD9yJLFCSevGn8fiev879N6cYbXpxa\nkMjuyybfGvzr08+vawwhpJuqTj39t6secfL+fStCCImEZ9yztdwOg9P//te9U2v261UaQkin\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    " cyclistic %>%\n",
    "    ggplot(aes(x = rides_daily, y = length(ride_id), fill = member_casual)) +\n",
    "    geom_col() +\n",
    "    labs(title = \"Rides per Week\",\n",
    "         x = \"Day of Week\",\n",
    "         y = \"# of Rides\") +\n",
    "    theme(plot.title = element_text(face = \"bold\", hjust = 0.5),\n",
    "          plot.title.position = \"panel\",\n",
    "          legend.position = c(0.24, 0.95),\n",
    "          legend.direction = \"horizontal\",\n",
    "          axis.ticks.y = element_blank(),\n",
    "          axis.text.y = element_blank())"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "85e4f4a5",
   "metadata": {
    "papermill": {
     "duration": 0.012167,
     "end_time": "2022-07-03T18:24:57.919182",
     "exception": false,
     "start_time": "2022-07-03T18:24:57.907015",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We now have a clearer picture of why and when Cyclistic users use the service. This context is important for the following sections. We also need to know *how* they use the service. Which bikes are preferred? Does the preferred bike depend on the day of the week? Does it depend on the month? "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "2b6443a1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:24:57.945911Z",
     "iopub.status.busy": "2022-07-03T18:24:57.944323Z",
     "iopub.status.idle": "2022-07-03T18:24:58.463737Z",
     "shell.execute_reply": "2022-07-03T18:24:58.461784Z"
    },
    "papermill": {
     "duration": 0.535697,
     "end_time": "2022-07-03T18:24:58.466268",
     "exception": false,
     "start_time": "2022-07-03T18:24:57.930571",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'Type'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 5 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Type</th><th scope=col>Membership</th><th scope=col>Rides</th><th scope=col>Percentage</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>classic_bike </td><td>casual</td><td>1234410</td><td>21.439845</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>member</td><td>1968374</td><td>34.187695</td></tr>\n",
       "\t<tr><td>docked_bike  </td><td>casual</td><td> 291391</td><td> 5.061023</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>casual</td><td>1010557</td><td>17.551855</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>member</td><td>1252819</td><td>21.759581</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 5 × 4\n",
       "\\begin{tabular}{llll}\n",
       " Type & Membership & Rides & Percentage\\\\\n",
       " <chr> & <chr> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t classic\\_bike  & casual & 1234410 & 21.439845\\\\\n",
       "\t classic\\_bike  & member & 1968374 & 34.187695\\\\\n",
       "\t docked\\_bike   & casual &  291391 &  5.061023\\\\\n",
       "\t electric\\_bike & casual & 1010557 & 17.551855\\\\\n",
       "\t electric\\_bike & member & 1252819 & 21.759581\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 5 × 4\n",
       "\n",
       "| Type &lt;chr&gt; | Membership &lt;chr&gt; | Rides &lt;int&gt; | Percentage &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| classic_bike  | casual | 1234410 | 21.439845 |\n",
       "| classic_bike  | member | 1968374 | 34.187695 |\n",
       "| docked_bike   | casual |  291391 |  5.061023 |\n",
       "| electric_bike | casual | 1010557 | 17.551855 |\n",
       "| electric_bike | member | 1252819 | 21.759581 |\n",
       "\n"
      ],
      "text/plain": [
       "  Type          Membership Rides   Percentage\n",
       "1 classic_bike  casual     1234410 21.439845 \n",
       "2 classic_bike  member     1968374 34.187695 \n",
       "3 docked_bike   casual      291391  5.061023 \n",
       "4 electric_bike casual     1010557 17.551855 \n",
       "5 electric_bike member     1252819 21.759581 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "cyclistic %>% \n",
    "    group_by(Type = rideable_type, Membership = member_casual) %>%\n",
    "    summarize(Rides = length(ride_id),\n",
    "              Percentage = length(ride_id) / nrow(cyclistic) * 100)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "f724cc76",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:24:58.494022Z",
     "iopub.status.busy": "2022-07-03T18:24:58.492366Z",
     "iopub.status.idle": "2022-07-03T18:25:08.008505Z",
     "shell.execute_reply": "2022-07-03T18:25:08.006561Z"
    },
    "papermill": {
     "duration": 9.532697,
     "end_time": "2022-07-03T18:25:08.010836",
     "exception": false,
     "start_time": "2022-07-03T18:24:58.478139",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n/g9YVNhX3jypdwAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "cyclistic %>%\n",
    "    ggplot(aes(x = rideable_type, fill = member_casual)) +\n",
    "    geom_bar(position = position_dodge(width = 1)) +\n",
    "    labs(title = \"Preferred Rideable Type\",\n",
    "         subtitle = \"by membership type\",\n",
    "         x = \"Type of Rideable\",\n",
    "         y = \"# of Users\") +\n",
    "    theme(plot.title = element_text(face = \"bold\"),\n",
    "          plot.title.position = \"panel\",\n",
    "          legend.position = c(0.89, 0.97),\n",
    "          legend.justification = \"top\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0f01bdfa",
   "metadata": {
    "papermill": {
     "duration": 0.01312,
     "end_time": "2022-07-03T18:25:08.036508",
     "exception": false,
     "start_time": "2022-07-03T18:25:08.023388",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The classic bike appears to be the favorite, followed by the electric bike and the docked bike. No data have been provided on bike performance. User opinions or ratings might be a useful variable to add. It may also prove beneficial to explore the average ride length for each bike type. Perhaps each bikes level of popularity is related to the amount of control the users have, as well as the time in which they are able to get to their destination. We'll examine this shortly."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "cf352abf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:25:08.065049Z",
     "iopub.status.busy": "2022-07-03T18:25:08.063376Z",
     "iopub.status.idle": "2022-07-03T18:25:15.361680Z",
     "shell.execute_reply": "2022-07-03T18:25:15.359860Z"
    },
    "papermill": {
     "duration": 7.31466,
     "end_time": "2022-07-03T18:25:15.363934",
     "exception": false,
     "start_time": "2022-07-03T18:25:08.049274",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\np285HuExAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "cyclistic %>%\n",
    "    ggplot(aes(x = rides_daily, fill = rideable_type)) +\n",
    "    geom_bar(position = position_dodge()) +\n",
    "    facet_wrap(~ member_casual) +\n",
    "    labs(title = \"Preferred Weekly Rideable Type\",\n",
    "         subtitle = \"by membership type\",\n",
    "         x = \"Day of Week\",\n",
    "         y = \"# of Users\") +\n",
    "    theme(axis.ticks.y = element_blank(),\n",
    "          axis.text.y = element_blank(),\n",
    "          plot.title = element_text(face = \"bold\"),\n",
    "          plot.title.position = \"panel\",\n",
    "          legend.position = \"right\",\n",
    "          legend.direction = \"vertical\",\n",
    "          legend.justification = \"top\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7c7844ca",
   "metadata": {
    "papermill": {
     "duration": 0.013651,
     "end_time": "2022-07-03T18:25:15.390803",
     "exception": false,
     "start_time": "2022-07-03T18:25:15.377152",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "For casual users, the classic bike is preferred. Some prefer the electric bike and some prefer the docked bike. Usage, regardless of bike type, increases on the weekend. Members prefer either the classic bike or the electric bike, with usage peaking in the middle of the week, rather than on the weekends. The docked bike is not attached to any observations where the user is an annual member. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "617ed40d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:25:15.421716Z",
     "iopub.status.busy": "2022-07-03T18:25:15.420063Z",
     "iopub.status.idle": "2022-07-03T18:25:23.623488Z",
     "shell.execute_reply": "2022-07-03T18:25:23.620883Z"
    },
    "papermill": {
     "duration": 8.222765,
     "end_time": "2022-07-03T18:25:23.626873",
     "exception": false,
     "start_time": "2022-07-03T18:25:15.404108",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nAABFUOwAAAAUQbEDAABQBMUOAABAERQ7AAAARVDsAAAAFEGxAwAAUATFDgAAQBEUOwAAAEW4\n7Q5gA9/UaZFIpLKy0u4gAHbgmzotGo1Go1G7g9QIBoNut7u0tNTuIACQFkbsAAAAFEGxAwAA\nUATFDgAAQBEUOwAAAEUciF+eGD5TRMIiYbuDiIjc32+L3REApxg+U0SCIkG7g+ys0O4AIrxd\nAEgDI3YAAACKoNgBAAAogmIHAACgCIodAACAIih2AAAAiqDYAQAAKIJiBwAAoAiKHQAAgCIo\ndgAAAIqg2AEAACiCYgcAAKAIih0AAIAiKHYAAACKoNgBAAAogmIHAACgCIodAACAIih2AAAA\ninDbHcAGs1r32tWszV2XWZkEAAAggxixAwAAUATFDgAAQBEWFbs7Bw/s27fv8z+V1Zn+5QMj\n+/bte8Mza62JAQAAoDDrRuw0l/bB8zsWODMx6x9bXJpmWQYAAACFWVfsmp3aacvnz1SZZvWU\n8g3z1xmFJ+f40l9JsrK8EaIBAACowLpil33I5QfJz3PW1RyNXfvnD/KPGRGoFaGqZM2Me8de\nfvGF5/cfOOL621/8cH1q+iUX9PvL5i3PTh0/bMTDlgUGAADYv1h4uRPdN6Jb4ePPfX3lxP8T\nETHjz362+bgHjjQm1iwy+9a7PwqfOPrOK/K9ya/em/XMAzef1GN+M68uIh9Ov7vzSUPvG9q2\n9ir79++fTCZTt88666yRI0fuY8a8vLx9XMPe0XVdRLxery1br5emaSKi67pdj0m9Uqlyc3PN\nWkO/tks9fYFAwO/3252lRiqVZU9fZWXlrmZpmpZODJfLldFECko9jNqvp6/k5ubaGqcuTdPC\n4bAD902fz+fxeOzOUkPTtDR3ioxIJBLWbAgOYel17NpffmLR6GcqjJ4BXSvbMG+9cdCDrbOe\nq7VA0zMH3dDn3O45XhFpedCFT78y6dvKRDOvV0RKml118Wmd6qxww4YN1S/Z4uLiff9gsPej\nxZkfbA5MlXqzdhpnprLs6Wv413fgq2h/lBj3u9QN39Rp4shH1Zl7gaZpDnysLItkGIY1G4JD\nWFrsslpccoi+9LnvS689LGft838r6HK1b8dvTvQ9/+xVKz9avO6nX37Z+N3qf9Se1bxPq51X\nOGrUqOq/Dtu2bVtevvsz8EKhUANz01lDY/D5fKZpVlVV2bL1enk8Hq/Xa5pmNBq1O0sNTdOC\n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\nDgAAQBH/D2Y75mmycWPGAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "cyclistic %>%\n",
    "    ggplot(aes(x = rides_monthly, fill = rideable_type)) +\n",
    "    geom_bar(position = position_dodge()) +\n",
    "    facet_wrap(~ member_casual) +\n",
    "    coord_flip() +\n",
    "    scale_x_discrete(limits = rev) +\n",
    "    labs(title = \"Preferred Monthly Rideable Type\",\n",
    "         subtitle = \"by membership type\",\n",
    "         x = \"Month\",\n",
    "         y = \"# of Users\") +\n",
    "    theme(axis.ticks.x = element_blank(),\n",
    "          axis.text.x = element_blank(),\n",
    "          plot.title = element_text(face = \"bold\"),\n",
    "          legend.justification = \"top\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6e7db992",
   "metadata": {
    "papermill": {
     "duration": 0.014046,
     "end_time": "2022-07-03T18:25:23.655370",
     "exception": false,
     "start_time": "2022-07-03T18:25:23.641324",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Usage of the electric bike is higher in a few spots than the classic bike in spite of its overall popularity. "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3c5692be",
   "metadata": {
    "papermill": {
     "duration": 0.0139,
     "end_time": "2022-07-03T18:25:23.683056",
     "exception": false,
     "start_time": "2022-07-03T18:25:23.669156",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Summary of the Analysis:\n",
    "\n",
    "After cleaning and manipulating data by removing unused observations and duplicates and formatting other observations to summarize and visualize them, the data has shown these things:\n",
    "\n",
    "- The majority of users are annual members.\n",
    "- During a given week, ridership increases during the weekends in warmer months.\n",
    "- Also, annual member ridership increases throughout the week. \n",
    "- Overall, the most popular month is July; the most popular day is Saturday; and the most popular rideable type is the classic bike.\n",
    "\n",
    "## Recommendations:\n",
    "\n",
    "I believe that gathering data on bike performance and user reviews would help drill down into the results uncovered in the preferred rideable type summary. I've yet to find such data from Divvy or other bikeshare companies. To boost annual membership, the marketing team could attempt to partner with other companies, such as restaurants and other venues, to offer promotions to [those would hopefully become] members, focusing on the emphasis of the Cyclistic bikeshare service as an already popular choice for leisurely summer activities. Discounts for new members could also be advertised to persuade those casual users who would like to become members, yet still need some financial incentive (irrespective to any individual's circumstances). For those colder months, there may be a way to boost overall ridership and annual memberships by providing bikes equipped with studded tires or some similar winter alternative, albeit I don't know how likely this is. Before attempting such a strategy change, customers should recieve an optional survey regarding the aforementioned recommendations. The completion of said survey could also give non-members a discount on an annual membership. Given that the data shows only individual rides, it is possible that some of the observations recorded are from families. Offering promotions for groups of riders could also boost annual membership. This concludes my analysis of the Cyclistic Bikeshare data. I'm open to any criticisms or tips anyone might have. Thank you!"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "4def19f4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-03T18:25:23.714813Z",
     "iopub.status.busy": "2022-07-03T18:25:23.713209Z",
     "iopub.status.idle": "2022-07-03T18:25:23.783055Z",
     "shell.execute_reply": "2022-07-03T18:25:23.780894Z"
    },
    "papermill": {
     "duration": 0.08897,
     "end_time": "2022-07-03T18:25:23.785859",
     "exception": false,
     "start_time": "2022-07-03T18:25:23.696889",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message in FUN(X[[i]], ...):\n",
      "“no date field in DESCRIPTION file of package ‘patchwork’”\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "[[1]]\n",
       "\n",
       "  Wickham et al., (2019). Welcome to the tidyverse. Journal of Open\n",
       "  Source Software, 4(43), 1686, https://doi.org/10.21105/joss.01686\n",
       "\n",
       "A BibTeX entry for LaTeX users is\n",
       "\n",
       "  @Article{,\n",
       "    title = {Welcome to the {tidyverse}},\n",
       "    author = {Hadley Wickham and Mara Averick and Jennifer Bryan and Winston Chang and Lucy D'Agostino McGowan and Romain François and Garrett Grolemund and Alex Hayes and Lionel Henry and Jim Hester and Max Kuhn and Thomas Lin Pedersen and Evan Miller and Stephan Milton Bache and Kirill Müller and Jeroen Ooms and David Robinson and Dana Paige Seidel and Vitalie Spinu and Kohske Takahashi and Davis Vaughan and Claus Wilke and Kara Woo and Hiroaki Yutani},\n",
       "    year = {2019},\n",
       "    journal = {Journal of Open Source Software},\n",
       "    volume = {4},\n",
       "    number = {43},\n",
       "    pages = {1686},\n",
       "    doi = {10.21105/joss.01686},\n",
       "  }\n",
       "\n",
       "\n",
       "[[2]]\n",
       "\n",
       "To cite package ‘fs’ in publications use:\n",
       "\n",
       "  Jim Hester, Hadley Wickham and Gábor Csárdi (2021). fs:\n",
       "  Cross-Platform File System Operations Based on 'libuv'. R package\n",
       "  version 1.5.2. https://CRAN.R-project.org/package=fs\n",
       "\n",
       "A BibTeX entry for LaTeX users is\n",
       "\n",
       "  @Manual{,\n",
       "    title = {fs: Cross-Platform File System Operations Based on 'libuv'},\n",
       "    author = {Jim Hester and Hadley Wickham and Gábor Csárdi},\n",
       "    year = {2021},\n",
       "    note = {R package version 1.5.2},\n",
       "    url = {https://CRAN.R-project.org/package=fs},\n",
       "  }\n",
       "\n",
       "\n",
       "[[3]]\n",
       "\n",
       "To cite package ‘janitor’ in publications use:\n",
       "\n",
       "  Sam Firke (2021). janitor: Simple Tools for Examining and Cleaning\n",
       "  Dirty Data. R package version 2.1.0.\n",
       "  https://CRAN.R-project.org/package=janitor\n",
       "\n",
       "A BibTeX entry for LaTeX users is\n",
       "\n",
       "  @Manual{,\n",
       "    title = {janitor: Simple Tools for Examining and Cleaning Dirty Data},\n",
       "    author = {Sam Firke},\n",
       "    year = {2021},\n",
       "    note = {R package version 2.1.0},\n",
       "    url = {https://CRAN.R-project.org/package=janitor},\n",
       "  }\n",
       "\n",
       "\n",
       "[[4]]\n",
       "\n",
       "To cite package ‘patchwork’ in publications use:\n",
       "\n",
       "  Thomas Lin Pedersen (2022). patchwork: The Composer of Plots.\n",
       "  https://patchwork.data-imaginist.com,\n",
       "  https://github.com/thomasp85/patchwork.\n",
       "\n",
       "A BibTeX entry for LaTeX users is\n",
       "\n",
       "  @Manual{,\n",
       "    title = {patchwork: The Composer of Plots},\n",
       "    author = {Thomas Lin Pedersen},\n",
       "    year = {2022},\n",
       "    note = {https://patchwork.data-imaginist.com,\n",
       "https://github.com/thomasp85/patchwork},\n",
       "  }\n",
       "\n",
       "\n",
       "[[5]]\n",
       "\n",
       "To cite package ‘treemapify’ in publications use:\n",
       "\n",
       "  David Wilkins (2021). treemapify: Draw Treemaps in 'ggplot2'. R\n",
       "  package version 2.5.5. https://CRAN.R-project.org/package=treemapify\n",
       "\n",
       "A BibTeX entry for LaTeX users is\n",
       "\n",
       "  @Manual{,\n",
       "    title = {treemapify: Draw Treemaps in 'ggplot2'},\n",
       "    author = {David Wilkins},\n",
       "    year = {2021},\n",
       "    note = {R package version 2.5.5},\n",
       "    url = {https://CRAN.R-project.org/package=treemapify},\n",
       "  }\n",
       "\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# this isn't the best way to accomplish this but here are citations for \n",
    "# all packages and considered packages for any employer or other person\n",
    "# working on the certificate who wants to cite their sources.\n",
    "\n",
    "lapply(packages, citation)"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 398.544154,
   "end_time": "2022-07-03T18:25:24.122474",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-07-03T18:18:45.578320",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
