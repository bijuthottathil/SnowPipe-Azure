#   Continuous Data Loading with Azure Blob Storage and SnowPipe

![image](https://github.com/user-attachments/assets/b3f8b5e9-1993-41d2-a8d4-a4b5a0ac1d6b)

![image](https://github.com/user-attachments/assets/70e763a6-cc90-4a94-bcb5-de25b0bbe603)

![image](https://github.com/user-attachments/assets/d8982cba-6987-4715-8d77-f7fe2c7e8d80)

Storage Account and Container are created in Azure

![image](https://github.com/user-attachments/assets/f6798b6e-f412-4590-bb08-c7fe0f673000)

SnowFlake DB is created

![image](https://github.com/user-attachments/assets/1a2256fa-89c1-4a1f-b01a-40e4a1c91523)


![image](https://github.com/user-attachments/assets/1643ad06-7a1a-4adb-8349-1f715df56ca7)

![image](https://github.com/user-attachments/assets/f1295aa6-3987-49d1-8256-830fee4319ab)

Open below link in browser and provide access 

![image](https://github.com/user-attachments/assets/b340bca7-0388-4dc4-9001-bfc1d4495aa2)

Next step . Provide access to storage account to snowflake

![image](https://github.com/user-attachments/assets/181b644f-4d6d-4619-9a69-b5831995a592)

For this usecase, we need only read access

![image](https://github.com/user-attachments/assets/5a4fefd3-887f-49df-98fa-00a674e74498)

![image](https://github.com/user-attachments/assets/d05e5e7c-a866-42c5-9d8b-f807ad5dc3c1)

![image](https://github.com/user-attachments/assets/6b41fa2d-20e8-4c31-abf8-8a389097f5b7)

Next we will create file format and stage

![image](https://github.com/user-attachments/assets/042a5886-b046-4f03-9fc1-94c021c6a4b9)

![image](https://github.com/user-attachments/assets/8b471749-6c89-40e8-9fa4-3d0bf3ac6715)


![image](https://github.com/user-attachments/assets/45904b01-0c74-4fdb-b64c-906fb09af9e8)

![image](https://github.com/user-attachments/assets/bef616cd-46a7-486f-bd0b-bf10256f82a3)

Next step is to create notification setup in Azure and then create integration object in   snowflake


![image](https://github.com/user-attachments/assets/b107f368-0cad-41a5-8d1c-96175defa997)

![image](https://github.com/user-attachments/assets/3c9b1d1b-f0c6-41e5-a7db-e97d98e2f525)

![image](https://github.com/user-attachments/assets/444bf628-5d23-42a1-9440-cde222507ec8)

![image](https://github.com/user-attachments/assets/bb921670-4993-43f7-b663-9bab12afc9fe)

![image](https://github.com/user-attachments/assets/bf8ac3d1-4938-454b-9237-def5ad0e7b01)

We need to register EventGrid

![image](https://github.com/user-attachments/assets/a62ad3fc-b7e4-47c6-a2f3-8063bd5d35e6)

![image](https://github.com/user-attachments/assets/51fbd300-55c8-46f9-a2ce-084e25e97159)


![image](https://github.com/user-attachments/assets/5e3bd44f-b932-4c3d-b630-22956f5c4248)


![image](https://github.com/user-attachments/assets/fe4bc47e-3570-490c-b29a-84ed88bd9c3e)

Click the url provided above and provide access

![image](https://github.com/user-attachments/assets/5315a057-07af-4d43-b658-878d37e765ec)

Rememeber to add another role access to queue in azure


![image](https://github.com/user-attachments/assets/a76bfb64-2a0c-4278-aedb-beb8f12efd3c)

Upload csv file

![image](https://github.com/user-attachments/assets/5d0cbdfc-2530-41ca-9104-fac561e20a5b)


![image](https://github.com/user-attachments/assets/48225d19-dea0-495c-863c-89506db4e730)


![image](https://github.com/user-attachments/assets/d21754b1-ad9c-4f9b-8ca7-1e6792bc1068)

Load data in to table

![image](https://github.com/user-attachments/assets/411c3349-f647-4a0e-8cad-71dbcec27484)

Next we will create snowpipe. As soon as any new file is loaded in the storage account, those data should be automatically add to above table we created


![image](https://github.com/user-attachments/assets/e531b10f-1d9e-4a57-a812-71d4dff07b1b)


To test our pipe, I deleted all contents in table

![image](https://github.com/user-attachments/assets/911a070d-7d3f-4562-8bae-a7c34075ce13)


And, removed csv file from the storage account

![image](https://github.com/user-attachments/assets/3ae20f05-4090-43ef-83f8-45df618b096f)

Now I am placing csv file in the container, so immediatley, it should load data in snowflake table

![image](https://github.com/user-attachments/assets/02b69e58-7bf2-4739-84cf-b746ff7c3f28)

pipe is working fine. you can see fresh data loaded in the table

![image](https://github.com/user-attachments/assets/9d5e4f4e-e085-4174-90c9-518607b4df21)


![image](https://github.com/user-attachments/assets/e943ef65-75ab-4fff-b8f8-02a0060a9e2f)

Happy coding... Happy learning...









