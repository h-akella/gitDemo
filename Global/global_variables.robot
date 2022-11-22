*** Variables ***
${URL}            https://qa.healthtrackrx.com/qa/
${BROWSER_NAME}    Chrome
${USERNAME}       prakash.kamma
${PASSWORD}       HTRXqz@123
${TESTDATA_FOLDER}    ${EXECDIR}/Testdata
${LONG_WAIT}      30
${MEDIUM_WAIT}    20
${SHORT_WAIT}     5
${TIME_INTERVAL}    4s
${download}       document.querySelector("#viewer").shadowRoot.querySelector("#toolbar").shadowRoot.querySelector("#downloads").shadowRoot.querySelector("#download").shadowRoot.querySelector("#icon > iron-icon")
${sample_data}    123455
${PDF_DOWNLOAD_FOLDER}    ${EXECDIR}\\Downloads
${Attachments file-type.batch_Review}    Images
${Medication prescribe.Batch_Reviews}    Clorazepeta
${choose file.jpg}    C:\\Users\\Mahesh\\Pictures\\Screenshots\\Screenshot (1).png
${test_data_file_name}    QA_TestData.xls
${button.accesioning.attachments.save}    xpath://div[@id='limsabc_qa_custom_molecular_document_upload_form_form_submit']
${MINI_WAIT}      3
${upload_file_path_in_clientportal_for_view_document}    ${TESTDATA_FOLDER}\\requisition.pdf
${patient_sample_id}    273833
${datadriven_test_data_file}    ${EXECDIR}\\Testdata\\DataDriver.xlsx
${downloads_pdf_file}    ${EXECDIR}\\Downloads\\requisition.pdf
${headless}       False
