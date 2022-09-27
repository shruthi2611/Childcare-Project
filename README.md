<h2>Extraction & Data Analysis of childcare data</h2>
<h3>Introduction</h3>
<br>Focus of the project is to extract data and build a data pipeline to consolidate the contact information,vacancy details of licensed childcare centres of Toronto.Information is scraped using Python beautifulSoup from The city of Toronto website which provides a list of childcare centres for each ward and a data pipeline is developed in AWS to load the data to Redshift for further analysis.</br> 
 <h3>Contents</h3>
 <br><a href="#Dataset">Dataset</a></br>
 <br><a href="#Process">Process</a></br>
 <br><a href="#Analysis">Analysis</a></br>
 <h3><br id="Dataset">Dataset</br></h3>
 <br>Source data is extracted from 
 
 [A - Z list of Licensed Child Care Centres](https://www.toronto.ca/data/children/dmc/a2z/a2za.html)</br>
 <h3><p id="Process">Process</p></h3>
 
 ![alt text](https://github.com/shruthi2611/Childcare-Project/blob/main/process_flow.png "Process flow")
 <br>[1.Data Extraction & cleansing](https://github.com/shruthi2611/Childcare-Project/blob/main/Web%20scraping%20%26data%20cleansing.ipynb)</br> 
      <br>Python code to scrape from the source,cleanse the data and load the files to S3</br>
      <br>The following 4 files would be loaded to S3 in csv format </br>
      <br>1.Subsidy fee - Details on the center name and if the centre is eligible for fee subsidy</br>
      <br>2.Centre Information -Contact,location information for each center</br>
      <br>3.Early years program information -Programs offered,vacancy for young children</br>
      <br>4.Before and after school program information -Centres that provide after and before school children care</br>
 <br>2.Setup Redshift</br>
 <br>Setup a Redshift cluster and create the tables </br>
 <br>[3.Setup AWS Glue](https://github.com/shruthi2611/DEProjects/blob/main/Write_to_kinesis.py)</br>
 <br>create a crawler for s3 file</br>
 <br>Either create tables in the catalog or use a classifier to get the column headers</br> 
 <br>create a second crawler for redshift tables</br>
 <br>A VPC and an endpoint has to be configured for glue to access Redshift</br>
 <br>Create &test the Redshift connection to be used for the crawler and glue jobs</br>
 <br>[4.S3 Event notification & lambda trigger](https://github.com/shruthi2611/Childcare-Project/blob/main/lambda%20glue%20crawler.txt)</br>
 <br>Configure S3 event notification for the files getting posted to the bucket/folder</br>
 <br>Write a lambda function to trigger glue crawler that crawls data from files in s3</br>
 <br>use the s3 notification as the trigger event for lambda function</br>
 <br>[5.Amazon Eventbridge](https://github.com/shruthi2611/Childcare-Project/blob/main/Event%20pattern.txt)</br>
 <br>Upon completion of the crawler for s3 ,the crawler for redshift has to be triggered</br>
 <br>write a lambda function to trigger Redshift crawler </br>
 <br>[code for Crawler](https://github.com/shruthi2611/Childcare-Project/blob/main/lambda%20Redshift%20crawler.txt)</br>
 <br>create a rule in AWS eventbridge to trigger the lambda function post completion of the crawler for s3 files</br>
 ![alt text](https://github.com/shruthi2611/Childcare-Project/blob/main/eventbridge.PNG "eventbridge")   
 <br>[6.Loading to Redshift](https://github.com/shruthi2611/Childcare-Project/blob/main/lambda%20glue%20job.txt)</br>
      <br>create a glue job to move data from s3 to Redshift using the data catalog tables and edit the spark script for the job to truncate and load the tables for every load</br>
      <br>Lambda function to trigger the glue jon</br>
      <br>create an eventbridge rule to associate the completion of the redshift crawler to trigger teh lambda function</br>
 <br>7.Email Notification </br>
      <br>Create a SNS topic and subscribe a valid email address to receive notification upon Glue job completion</br>
 <h3><p id="Analysis">Analysis </p></h3>
 
 <br>[Data from redshift can be analyzed to derive insights](https://github.com/shruthi2611/Childcare-Project/blob/main/data_analysis_query.sql)</br>
<br>1.List of all the child care centres in the City "Scarborough" that have a vacancy</br>
 
![alt text](https://github.com/shruthi2611/Childcare-Project/blob/main/List_of_schools_at_scarborough.PNG "list")

<br>2.Total Capacity for each program(Toddler,Preschool,Infant) in every ward</br>
 
![alt text](https://github.com/shruthi2611/Childcare-Project/blob/main/count_of_programs_per_ward.PNG "Capacity")

<br>3.List of childcare centres in city of Toronto that provide the Before/After school care</br>
 
![alt text](https://github.com/shruthi2611/Childcare-Project/blob/main/torontop.PNG "Toronto")
   
     
     

