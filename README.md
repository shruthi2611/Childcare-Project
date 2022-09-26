<h2>Web scrapping & Data Analysis of childcare data</h2>
<h3>Introduction</h3>
<br></br> Focus of the project is to extract data and build a data pipeline to consolidate the contact information,vacancy details of licensed childcare centres of Toronto.Information is scraped using Python beautifulSoup from The city of Toronto website which provides a list of childcare centres for each ward and a data pipeline is developed in AWS to load the data to Redshift for further analysis.
 <h3>Contents</h3>
 <br><a href="#Dataset">Dataset</a></br>
 <br><a href="#Process">Process</a></br>
 <br><a href="#Analysis">Analysis</a></br>
 <h3><br id="Dataset">Dataset</br></h3>
 Source data is extracted from [A - Z list of Licensed Child Care Centres](https://www.toronto.ca/data/children/dmc/a2z/a2za.html)
 
[kaggle](https://www.kaggle.com/datasets/carrie1/ecommerce-data) as a csv file
 <h3><p id="Process">Process</p></h3>
 
![alt text](https://github.com/shruthi2611/DEProjects/blob/main/process.png "Process flow")
 <br>[1.Simulation of streaming](https://github.com/shruthi2611/DEProjects/blob/main/simulation_src_code.ipynb)</br> 
      <br>Python code to stream data from csv file record by record </br>
 <br>[2.Data ingestion from source to kinesis via API](https://github.com/shruthi2611/DEProjects/blob/main/Write_to_kinesis.py)</br>
 <br>Configure a lambda fucntion to write from the API gateway to kinesis</br>
 <br>Setup the API gateway to trigger lambda</br>
![alt text](https://github.com/shruthi2611/DEProjects/blob/main/Apigateway.PNG "Api")
 <br>[3.Storing unprocessed data in S3](https://github.com/shruthi2611/DEProjects/blob/main/write_kinesis_to_s3.py)</br>
 <br>Create a bucket in s3 to store the client data</br>
 <br>[4.Writing data to DynamoDB](https://github.com/shruthi2611/DEProjects/blob/main/Kinesis_to_Dynamodb.py)</br>
      <br>Create Customer and Invoice tables in Dynamodb</br>
      <br>Customer table will have the customerid and the invoices related to the customer</br>
      <br>Invoice table will have the stockcode,item purchased ,quantity,unitprice for each invoice</br>
 <br>[5.Creating delivery stream in Kinesis Firehose](https://github.com/shruthi2611/DEProjects/blob/main/Copy%20command.txt)</br>
      <br>Create redshift table for the source data</br>
      <br>Setup a delivery stream in Kinesis firehose to move data to Redshift with the kinesis stream as the source</br>
      <br>Kinesis uses an S3 bucket as intermediate to move records to redshift</br>
      <br>Edit the copy command to include redshift table name,aws role details and S3 bucket name to be used as an intermediate</br>
![alt text](https://github.com/shruthi2611/DEProjects/blob/main/KinesisFirehose.PNG "kinesis")</br>
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
   
     
     

