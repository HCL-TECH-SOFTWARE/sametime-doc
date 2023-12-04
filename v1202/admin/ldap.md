# LDAP {#ldap .concept}

An LDAP directory is needed for Sametime user authentication. The LDAP server must be running before deploying Sametime.

## System requirements {#section_u2g_vbh_fwb .section}

Sametime works with V3-compliant LDAP servers.

## Performance {#section_kzg_qch_fwb .section}

LDAP performance is critical to a successful deployment. Sametime is going to put a heavy load on LDAP. Consider the performance requirements of all Sametime LDAP traffic:

-   Client lookups
-   Authentication
-   Contact list management
-   Invitations to meetings
-   Business card features
-   Mobile clients

Part of your deployment plan may include adding more cluster members to the LDAP cluster.

To minimize the burden on LDAP, use minimal search filters wherever possible. Log in choices such as name, email address, employee ID, and so on, create longer search filters and greater performance loads on LDAP.

When planning for LDAP, don't forget Single Sign-On \(SSO\). Talk to your company's application teams about SSO. Propose a standard way that you allow people to log in to keep logins simple and minimal. All applications should utilize LDAP in the same way. If applications have different search filters, then this creates search problems and authentication problems.

## Mail attribute {#section_jvf_rch_fwb .section}

Sametime requires the LDAP mail attribute in each person record.

The mail attribute provides performance advantages since translation between attributes is not required; it also provides consistency and integrity by using a common and well-understood attribute.

This attribute is not required for anonymous \(guest\) users. The attribute must be a unique string, which preferably follows the syntax and length restrictions of email addresses. In addition, the mail attribute must be populated for every user to support audio and video communications.

The mail attribute is not used for email purposes and does not have to be assigned as a user name for logging into Sametime. Instead, it serves as a common attribute between the various Sametime subsystems, such as calendar integration, business cards, LDAP, and REST APIs.

## Multiple directory support {#section_pkk_tch_fwb .section}

Multiple directories are supported with the following restrictions:

-   Groups may only contain members present in the same directory server and base DN specified in the LDAP Server document. Sametime does not support mixed groups at this time.
-   Multiple replicas of the same directory in the stconfig.nsf database are not supported. For effective load balancing, you should route LDAP traffic through a load balancer.
-   If the browse feature is enabled on the server, certain features such as LDAP time-outs or the maximum number of search results returned may need to be disabled.
-   If you use multiple LDAP repositories, you must ensure that the base entries do not overlap, as that causes problems when Secure Socket Layer \(SSL\) is enabled.

    For example, the following base entries have a field in common, so they overlap:

    ``` {#codeblock_ufr_3bh_fwb}
    o=renovations
    o=sales,o=renovations
    ```

    These base entries use different fields and are acceptable:

    ``` {#codeblock_bcq_lbh_fwb}
    o=renovations,c=us
    o=sales
    ```


## Contact lists {#section_yx1_wch_fwb .section}

Sametime might experience difficulties when users include large public groups in their contact lists. To avoid problems, limit the size of public groups used with Sametime to 1000 users.

## Upgrade considerations {#section_un4_xch_fwb .section}

If you are considering moving from a native Domino directory to an LDAP directory, you must convert the user’s names in the vpuserinfo.nsf file to LDAP format. This is done using the Sametime Name Conversion utility.

## Best Practices {#section_vdc_zch_fwb .section}

The [Best Practices for using LDAP with Sametime](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0081763) white paper contains an overview of LDAP components and describes how the Sametime Community Server works with LDAP to provide authentication, name look-ups, and name resolution. The article describes best practices for creating search filters, setting sametime.ini parameters, and enhancing Sametime and LDAP performance.

**Parent Topic: **[Prerequistes](c_planning_prereqs.md)

