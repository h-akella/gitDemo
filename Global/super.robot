*** Settings ***
Library           String
Library           OperatingSystem
Library           Screenshot
Library           DateTime
Resource          global_variables.robot
Resource          ../ObjectRepository/loginscreen.robot
Resource          ../Keywords/common.robot
Resource          ../ObjectRepository/homepage.robot
Resource          ../Keywords/application_keywords.robot
Library           SeleniumLibrary    run_on_failure=Capture Page Screenshot
Resource          ../Keywords/application_keywords.robot
Resource          ../ObjectRepository/Accesioning.robot
Resource          ../ObjectRepository/Create_New_Patient_for_Requisition.robot
Resource          super.robot
Resource          ../Keywords/Accesioning.robot
Resource          ../ObjectRepository/Result_Review.robot
Library           Collections
Resource          ../ObjectRepository/Create_the_requisition_page.robot
Resource          ../ObjectRepository/Exceptions.robot
Resource          ../Keywords/Client_Portal.robot
Resource          ../Keywords/Result_review.robot
Resource          ../ObjectRepository/Result_Review.Batch_review.robot
Library           ../Library/CustomLibrary.py
Resource          ../ObjectRepository/ClientPortal.robot
Resource          ../Keywords/Create_New_Requisition.robot
Resource          ../ObjectRepository/Batch.robot
Resource          ../Keywords/Common_RF.robot
Resource          ../ObjectRepository/Patient_Manager.robot
Resource          ../Keywords/Patient_Manager.robot
Resource          ../ObjectRepository/Patient_Manager.robot
Library           DependencyLibrary
Resource          ../Keywords/Exceptions.robot