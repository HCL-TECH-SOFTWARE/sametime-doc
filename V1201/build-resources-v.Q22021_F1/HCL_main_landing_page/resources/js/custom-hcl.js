/*
 ********************************************************************
 * Licensed Materials - Property of HCL                             *
 *                                                                  *
 * Copyright HCL Technologies Ltd. 2001, 2020. All Rights Reserved. *
 *                                                                  *
 * Note to US Government Users Restricted Rights:                   *
 *                                                                  *
 * Use, duplication or disclosure restricted by GSA ADP Schedule    *
 *                                                                  *
 * Author: Emmanuel Palogan
 ********************************************************************
 */

$(function () {
    initAccordionLinks();
});

function initAccordionLinks() {
    let accordionList = document.getElementsByClassName('wh_main_page_toc_accordion_header');
    for (let element of accordionList) { 
        element.classList.add("expanded");
        let link = element.getElementsByTagName('a')[0];
        link.onclick = function(){
            let classLst = element.classList
            if(classLst.contains("expanded")) {
                classLst.remove('expanded');
            } else {
                classLst.add('expanded');
            }
            return false;
        };
    }
}