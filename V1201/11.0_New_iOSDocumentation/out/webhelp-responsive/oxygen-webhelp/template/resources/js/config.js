/*
 ********************************************************************
 * Licensed Materials - Property of HCL                             *
 *                                                                  *
 * Copyright HCL Software 2020. All Rights Reserved.                *
 *                                                                  *
 * Note to US Government Users Restricted Rights:                   *
 *                                                                  *
 * Use, duplication or disclosure restricted by GSA ADP Schedule    *
 *                                                                  *
 * Author: Emmanuel Palogan                                         *
 * Release Version: v.Q32021                                         *
 ********************************************************************
 */
export const LNG_IDX = 3;
export const VER_IDX = 3;
export const LND_IDX = 1;
export const LANGUAGE = "Language";
export const VERSION = "Version";
export const PAGE_IDX_LOC = "welcome/index.html";
export const ENABLE_LANG_EN = false; // This should be the same configuration for all the languages within the same version.
export const LEARNING_ACADEMY_LINK = true // Set to true to enable Learning Academy link in the header.

//Change Product Name to your actual product name. ex: Digital Experience
export const VERSION_LIST = {
    "0" : "Sametime",
    "12": "Version 12",
    "11.0.0": "Version 11"
}

export const VERSION_LIST_URL = {
    "12": "https://help.hcltechsw.com/sametime/12/ios/index.html",
    "11.0.0": "https://help.hcltechsw.com/sametime/11.0.0/ios/index.html",
}

//Change the list base on your product languages availability.
export const PROD_LANG_LIST = []
// export const PROD_LANG_LIST = ["en", "ar", "bg", "ca", "zh_CN", "zh_TW", "hr", "cs", "da", "nl", "fi", "fr", "de", "iw", "it", "hu", "ja", "kk", "ko", "no", "pl", "pt_BR", "pt", "ro", "ru", "sk", "sl", "es", "sv", "th", "tr"]