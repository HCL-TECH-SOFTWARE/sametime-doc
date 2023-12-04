# Using MongoDB on cloud {#mongodb_cloud .task}

MongoDB Atlas is a cloud-based database MongoDB that can be used to maintain Sametime data.

Before you can the MongoDB Atlas to communicate with the Sametime server, you'll to to have an account. To sign-up for an account, refer to the [Try MongoDB Atlas](https://www.mongodb.com/atlas-signup-from-mlab?msclkid=fff48907b3931bd342f5ec5dc39ab285&utm_source=bing&utm_campaign=search_bs_pl_evergreen_atlas_core_prosp-brand_gic-null_amers-us_ps-all_desktop_eng_lead&utm_term=mongodb%20atlas&utm_medium=cpc_paid_search&utm_ad=p&utm_ad_campaign_id=415204521&adgroup=1223756911396639&msclkid=fff48907b3931bd342f5ec5dc39ab285) to obtain the URL needed to complete the configuration. You'll receive the Atlas MongoDB URL during sign-up to use as the MongoDB connection information during the Sametime installation process.

1.  Log into your MongoDB Atlas account.

2.  Access the Atlas user interface.

3.  Click **Connect**.

    1.  Select the driver from the dropdown list.

    2.  Select whether to use password or x.509 encryption.

    In the box under **View full code example**, is the URL to the MongoDB on Atlas. You can use the copy icon to copy the URL. The following is an example URL:

    ``` {#codeblock_lyw_4kr_mzb}
    mongodb+srv://Admin:<password>@cluster0.EXAMPLE.mongodb.net/?retryWrites=true&w=majority
    ```

4.  Atlas requires TLS to connect to the service.

    1.  You must update the URL to add your truststore file location.

        ``` {#codeblock_xmq_lmd_pzb}
        mongodb+srv://Admin:<password>@cluster0.EXAMPLE.mongodb.net/?retryWrites=true&w=majority&tlsCAFile=truststore\_location
        ```

    2.  Map the truststore file into the Community container.

        ``` {#codeblock_bnj_4md_pzb}
        volumes:
          - truststore\_location
        ```


**Parent Topic: **[Installing MongoDB](installation_mongodb.md)

