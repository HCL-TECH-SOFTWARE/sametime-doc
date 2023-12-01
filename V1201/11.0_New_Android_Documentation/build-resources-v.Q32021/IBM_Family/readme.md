# Product Landing Page Build Source

## Sample Product Landing Page

To gain experience with the process, you can use the sample product landing page in this [connections landing page repo](https://git.cwp.pnp-hcl.com/CWPdoc/connections_prod_doc_landing_page). Use `all-onprem.ditamap` as the file to build.


## How to Use Build Resources to Build Your Own Page

1. Clone the git.cwp.pnp-hcl.com/CWPdoc/build-resources repo to your local machine, or if no access, extract the zip posted on Sharepoint.

2. Open your **Oxygen XML Author**.

3. Open your main document ditamap for the landing page for your family of products.

4. On the **Transformation Scenarios**, click the plus (**+**) icon and select **DITA-OT Transformation**.

5. Select **WebHelp Responsive** and click _OK_.

6. In the _Templates_ tab, click **Configure Publishing Templates Gallery**.

7. In _DITA / Publishing_, click **Add**. A dialog box will show.

8. In the dialog box, click the _folder icon_. Look and select this `build resources/product-landing-page` directory and click _Choose_ then click _OK_.

   - Your selected directory should look like this in the end of text: `/build-resources/product-landing-page`.

   - Your selected directory should show now in the list.

9. Click _OK_ to close the _Publishing_ menu dialog.

   - In _Templates_ tab, you should now see `hcl-product-landing-page` template.

10. Select the template `hcl-product-landing-page`.

11. In the _Parameters_ tab, search for `webhelp.fragment.before.body` and double click it and a dialog box will show.

12. In the _Edit Parameter_ dialog box, click the _folder_ icon and look for the `header.xml` in the `/build-resources/webhelp` directory of this repo and click _Open_. Click _OK_ to close _Edit Parameter_ dialog box.

    - You should now see that the value column of `webhelp.fragment.before.body` has been set to the directory of one you have selected.

13. In the _Parameters_ tab, search for `webhelp.fragment.footer` and double click it and a dialog box will show.

14. In the _Edit Parameter_ dialog box, click the _folder_ icon and look for the `footer.xml` in the `/build-resources/webhelp` directory of this repo and click _Open_. Click _OK_ to close _Edit Parameter_ dialog box.

    - You should now see that the value column of `webhelp.fragment.footer` has been set to the directory of one you have selected.

15. **OPTIONAL STEP FOR BIG DITA FILE SETS**

    - Go to  **Advanced** tab.

    - In the **JVM Arguments**, edit the value to `-Xmx2g` or `-Xmx4g` depends on how big your file set is. You can increase the value to `-Xmx8g` if you still encounter memory errors during build.

16. Click _OK_ to close _Edit DITA Scenario_.

17. Run the created scenario.

## How to Change the Product Logo

### Logo Requirement

- Get a product logo with the HCL branding name on the right side (logo and text as one image).
- Height of the logo is atleast `50px`.
- Length of the logo depends on how long the brand name is.
- Logo must have white or transparent background.

Using the same sample product landing page from connections:

1. Copy your logo and put it in this directory. Rename to logo.png.

   - `.../connections_prod_doc_landing_page/logo/logo.png`

2. On your ditamap, add the logo reference by adding topicref.
   - ` <topicref format="png" href="logo/logo.png" toc="no" navtitle="logo"/>`

3. Run the scenario again.
