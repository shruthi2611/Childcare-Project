<h2>Web scrapping & Data Analysis of childcare data</h2>
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
 <br>[1.Data Extraction & cleansing](https://github.com/shruthi2611/DEProjects/blob/main/simulation_src_code.ipynb)</br> 
      <br>Python code to scrape from the source,cleanse the data and load the files to S3</br>
      <br>The following 4 files would be loaded to S3 in csv format </br>
      <br>1.Subsidy fee - Details on the center name and if the centre is eligible for fee subsidy</br>
      <br>2.Centre Information -Contact,location information for each center</br>
      <br>3.Early years program information -Programs offered,vacancy for young children</br>
      <br>4.Before and after school program information -Centres that provide after and before school children care</br>
 <br>[2.Setup Redshift](https://github.com/shruthi2611/DEProjects/blob/main/Write_to_kinesis.py)</br>
 <br>Setup a Redshift cluster and create the tables </br>
 <br>[3.Setup AWS Glue](https://github.com/shruthi2611/DEProjects/blob/main/Write_to_kinesis.py)</br>
 <br>create a crawler for s3 file</br>
 <br>Either create tables in the catalog or use a classifier to get the column headers</br> 
 <br>create a second crawler for redshift tables</br>
 <br>A VPC and an endpoint has to be configured for glue to access Redshift</br>
 <br>Create &test the Redshift connection to be used for teh crawler and glue jobs</br>
 <br>[4.S3 Event notification & lambda trigger](https://github.com/shruthi2611/DEProjects/blob/main/Write_to_kinesis.py)</br>
 <br>Configure S3 event notification for the files getting posted to the bucket/folder</br>
 <br>Write a lambda function to trigger glue crawler that crawls data from files in s3</br>
 <br>use the s3 notification as the trigger event for lambda function</br>
 <br>[5.Amazon Eventbridge](https://github.com/shruthi2611/DEProjects/blob/main/write_kinesis_to_s3.py)</br>
 <br>Upon completion of the crawler for s3 ,the crawler for redshift has to be triggered</br>
 <br>write a lambda function to trigger Redshift crawler </br>
 <br>create a rule in AWS eventbridge to trigger the lambda function post completion of the crawler for s3 files</br>
 <br>[6.Loading to Redshift](https://github.com/shruthi2611/DEProjects/blob/main/Kinesis_to_Dynamodb.py)</br>
      <br>create a glue job to move data from s3 to Redshift using the data catalog tables and edit the spark script for the job to truncate and load the tables for every load</br>
      <br>Lambda function to trigger the glue jon</br>
      <br>create an eventbridge rule to associate the completion of the redshift crawler to trigger teh lambda function</br>
 <h3><p id="Analysis">Analysis</p></h3>
<br>[1.Accessing Customer and Invoice data](https://github.com/shruthi2611/DEProjects/blob/main/Write_to_kinesis.py)</br>

 <br>Using Api gateway we can access a single customer or invoice information,this will be useful in scnarios where the customer has to access thier purchase information</br>

<br>2.Data from redshift can be analyzed to derive insights.</br>
 
<br>1.Products with the maximum unit price countrywise</br>
 
![alt text](https://github.com/shruthi2611/DEProjects/blob/main/max_unit_price.PNG "Priceflow")

<br>2.Products that show highest sales countrywise</br>
 
![alt text](https://github.com/shruthi2611/DEProjects/blob/main/product_max_sales.PNG "Product")

<br>3.Total sales</br>
 
![alt text](https://github.com/shruthi2611/DEProjects/blob/main/Total_sales.PNG "sales")
   
     
     

