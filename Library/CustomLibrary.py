from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver import ActionChains
from selenium.common.exceptions import NoSuchElementException
import xlrd
import calendar
import time
from PIL import Image,ImageChops
import re
import configparser
import os
import subprocess
from PyPDF2 import PdfFileReader
import requests
from urllib import request
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
import re
import os
import PyPDF2
from pdfminer.pdfinterp import PDFResourceManager, PDFPageInterpreter
from pdfminer.converter import TextConverter
from pdfminer.layout import LAParams
from pdfminer.pdfpage import PDFPage
from io import StringIO
import csv


class CustomLibrary(object):

        def __init__(self):
                pass

        @property
        def _sel_lib(self):
            return BuiltIn().get_library_instance('SeleniumLibrary')

        @property
        def _driver(self):
            return self._sel_lib.driver
        
        def open_chrome_browser(self,url,headless="False",clear_cache="False"):
            """Return the True if Chrome browser opened """
            download_folder = BuiltIn().get_variable_value("${PDF_DOWNLOAD_FOLDER}")            
            selenium = BuiltIn().get_library_instance('SeleniumLibrary')
            try:                
                options = webdriver.ChromeOptions()
                options.add_argument("--disable-extensions")
                options.add_argument('--no-sandbox')
                options.add_argument("use-fake-ui-for-media-stream")
                options.add_experimental_option("excludeSwitches",["enable-automation","load-extension"])
                prefs = {"credentials_enable_service": False,"profile.password_manager_enabled": False,"profile.default_content_setting_values.notifications" : 1,"profile.default_content_setting_values.automatic_downloads": 1, "download.default_directory":download_folder,"plugins.plugins_list": [{"enabled": False, "name": "Chrome PDF Viewer"}], "download.extensions_to_open": "applications/pdf","plugins.always_open_pdf_externally": True}
                options.add_experimental_option("prefs", prefs)
                if headless=="True":
                        options.add_argument("--headless")
                        options.add_argument("--window-size=1400,600");
                selenium.create_webdriver('Chrome', executable_path=ChromeDriverManager().install(), chrome_options=options)
                selenium.go_to(url)
                print(clear_cache)                
                if clear_cache=="True":
                        self._driver.delete_all_cookies()
            except Exception as e:
                raise e 

        def javascript_click_by_xpath(self,xpath):
            element = self._driver.find_element_by_xpath(xpath) 
            self._driver.execute_script("arguments[0].click();", element)    

        def wait_until_time(self,arg):
                time.sleep(int(arg))

        
        def get_ms_excel_row_values_into_dictionary_based_on_key(self,filepath,keyName,sheetName=None):
            """Returns the dictionary of values given row in the MS Excel file """
            workbook = xlrd.open_workbook(filepath)
            snames=workbook.sheet_names()
            dictVar={}
            if sheetName==None:
                sheetName=snames[0]      
            if self.validate_the_sheet_in_ms_excel_file(filepath,sheetName)==False:
                return dictVar
            worksheet=workbook.sheet_by_name(sheetName)
            noofrows=worksheet.nrows
            dictVar={}
            headersList=worksheet.row_values(int(0))
            for rowNo in range(1,int(noofrows)):
                rowValues=worksheet.row_values(int(rowNo))
                if str(rowValues[0])!=str(keyName):
                    continue
                for rowIndex in range(0,len(rowValues)):
                    cell_data=rowValues[rowIndex]
                    if(str(cell_data)=="" or str(cell_data)==None):
                        continue                    
                    cell_data=self.get_unique_test_data(cell_data)
                    col_name = str(headersList[rowIndex])              
                    dictVar[col_name]=str(cell_data)
            return dictVar

        def get_all_ms_excel_row_values_into_dictionary(self,filepath,sheetName=None):
            """Returns the dictionary of values all row in the MS Excel file """
            workbook = xlrd.open_workbook(filepath)
            snames=workbook.sheet_names()
            all_row_dict={}
            if sheetName==None:
                sheetName=snames[0]      
            if self.validate_the_sheet_in_ms_excel_file(filepath,sheetName)==False:
                return all_row_dict
            worksheet=workbook.sheet_by_name(sheetName)
            noofrows=worksheet.nrows
            headersList=worksheet.row_values(int(0))
            for rowNo in range(1,int(noofrows)):
                each_row_dict={}
                rowValues=worksheet.row_values(int(rowNo))
                for rowIndex in range(0,len(rowValues)):
                    cell_data=rowValues[rowIndex]
                    if(str(cell_data)=="" or str(cell_data)==None):
                        continue
                    cell_data=self.get_unique_test_data(cell_data)
                    each_row_dict[str(headersList[rowIndex])]=str(cell_data)
                all_row_dict[str(rowValues[0])]=each_row_dict
            return all_row_dict

        def get_all_ms_excel_matching_row_values_into_dictionary_based_on_key(self,filepath,keyName,sheetName=None):
            """Returns the dictionary of matching row values from the MS Excel file based on key"""
            workbook = xlrd.open_workbook(filepath)
            snames=workbook.sheet_names()
            all_row_dict={}
            if sheetName==None:
                sheetName=snames[0]      
            if self.validate_the_sheet_in_ms_excel_file(filepath,sheetName)==False:
                return all_row_dict
            worksheet=workbook.sheet_by_name(sheetName)
            noofrows=worksheet.nrows
            headersList=worksheet.row_values(int(0))
            indexValue=1
            for rowNo in range(1, int(noofrows)):
                rowValues=worksheet.row_values(int(rowNo))
                if str(rowValues[0])!=str(keyName):
                    continue
                each_row_dict={}
                for rowIndex in range(0,len(rowValues)):
                    cell_data=rowValues[rowIndex]
                    if(str(cell_data)=="" or str(cell_data)==None):
                        continue
                    cell_data=self.get_unique_test_data(cell_data)
                    
                    each_row_dict[str(headersList[rowIndex])]=str(cell_data)
                all_row_dict[str(indexValue)]=each_row_dict
                indexValue+=1
            return all_row_dict

        def get_unique_test_data(self,testdata):
            """Returns the unique if data contains unique word """
            ts = calendar.timegm(time.gmtime())
            unique_string=str(ts)
            testdata=testdata.replace("UNIQUE",unique_string)
            testdata=testdata.replace("Unique",unique_string)
            testdata=testdata.replace("unique",unique_string)
            return testdata

        def validate_the_sheet_in_ms_excel_file(self,filepath,sheetName):
            """Returns the True if the specified work sheets exist in the specifed MS Excel file else False"""
            workbook = xlrd.open_workbook(filepath)
            snames=workbook.sheet_names()
            sStatus=False        
            if sheetName==None:
                return True
            else:
                for sname in snames:
                    if sname.lower()==sheetName.lower():
                        sStatus=True
                        break
                if sStatus==False:
                    print ("Error: The specified sheet: "+str(sheetName)+" doesn't exist in the specified file: " +str(filepath))
            return sStatus

        
        def compare_images(self,expected_file_path,actual_image_path,):
            actual_image = Image.open(actual_image_path)
            expected_image = Image.open(expected_file_path)
            diff = ImageChops.difference(expected_image, actual_image)
            print(diff)
            if list(actual_image.getdata()) == list(expected_image.getdata()):
                    print ("Identical")
                    return False
            else:
                print ("Different")
                return True

        def wait_until_element_clickable(self,locator,wait):
                """ An Expectation for checking that an element is either invisible or not present on the DOM."""
                by_type_and_locator = self.get_element_bytype_and_value(locator)
                by_type = by_type_and_locator[0]
                by_locator = by_type_and_locator[1]
                WebDriverWait(self._driver, int(wait)).until(EC.element_to_be_clickable((by_type_and_locator[0], by_type_and_locator[1]))) 
                        
        def wait_until_element_is_displayed(self,locator):
                        """ An Expectation for checking that an element is either invisible or not present on the DOM."""
                        """ Needs to deprecate this function and use wait_until_element_function function """
                        longWait = BuiltIn().get_variable_value("${LONG_WAIT}")
                        longWait = int(longWait)
                        print(longWait)
                        by_type_and_locator = self.get_element_bytype_and_value(locator)
                        by_type = by_type_and_locator[0]
                        by_locator = by_type_and_locator[1]
                        WebDriverWait(self._driver, longWait).until(EC.presence_of_element_located((by_type_and_locator[0], by_type_and_locator[1])))

        def wait_until_element_is_present(self,locator):
                        """ An Expectation for checking that an element is either invisible or not present on the DOM."""
                        """ Needs to deprecate this function and use wait_until_element_function function """
                        longWait = BuiltIn().get_variable_value("${LONG_WAIT}")
                        longWait = int(longWait)
                        print(longWait)
                        by_type_and_locator = self.get_element_bytype_and_value(locator)
                        by_type = by_type_and_locator[0]
                        by_locator = by_type_and_locator[1]
                        WebDriverWait(self._driver, longWait).until(EC.visibility_of_element_located((by_type_and_locator[0], by_type_and_locator[1])))                   
                          
        def scroll_to_element(self, locator):
            """scroll to element using javascript"""
            element=self.get_element_locator(locator)
            #element = self._driver.find_element_by_xpath(locator)
            self._driver.execute_script("arguments[0].scrollIntoView(false);", element)
            
        def drag_and_drop_by_xpath(self, locator, target):
            """drag and drop using javascript"""
            try:
                element1 = self._driver.find_element_by_xpath(locator)
                target1 = self._driver.find_element_by_xpath(target)
                #xto = target.location['x']
                #yto = target.location['y']
                self._driver.execute_script("function createEvent(typeOfEvent) {\n" +"var event =document.createEvent(\"CustomEvent\");\n" +"event.initCustomEvent(typeOfEvent,true, true, null);\n" +"event.dataTransfer = {\n" +"data: {},\n" +"setData: function (key, value) {\n" +"this.data[key] = value;\n" +"},\n" +"getData: function (key) {\n" +"return this.data[key];\n" +"}\n" +"};\n" +"return event;\n" +"}\n" +"\n" +"function dispatchEvent(element, event,transferData) {\n" +"if (transferData !== undefined) {\n" +"event.dataTransfer = transferData;\n" +"}\n" +"if (element.dispatchEvent) {\n" + "element.dispatchEvent(event);\n" +"} else if (element.fireEvent) {\n" +"element.fireEvent(\"on\" + event.type, event);\n" +"}\n" +"}\n" +"\n" +"function simulateHTML5DragAndDrop(element, destination) {\n" +"var dragStartEvent =createEvent('dragstart');\n" +"dispatchEvent(element, dragStartEvent);\n" +"var dropEvent = createEvent('drop');\n" +"dispatchEvent(destination, dropEvent,dragStartEvent.dataTransfer);\n" +"var dragEndEvent = createEvent('dragend');\n" +"dispatchEvent(element, dragEndEvent,dropEvent.dataTransfer);\n" +"}\n" +"\n" +"var source = arguments[0];\n" +"var destination = arguments[1];\n" +"simulateHTML5DragAndDrop(source,destination);",element1, target1);
                #self._driver.execute_script("function simulate(f,c,d,e){var b,a=null;for(b in eventMatchers)if(eventMatchers[b].test(c)){a=b;break}if(!a)return!1;document.createEvent?(b=document.createEvent(a),a==\"HTMLEvents\"?b.initEvent(c,!0,!0):b.initMouseEvent(c,!0,!0,document.defaultView,0,d,e,d,e,!1,!1,!1,!1,0,null),f.dispatchEvent(b)):(a=document.createEventObject(),a.detail=0,a.screenX=d,a.screenY=e,a.clientX=d,a.clientY=e,a.ctrlKey=!1,a.altKey=!1,a.shiftKey=!1,a.metaKey=!1,a.button=1,f.fireEvent(\"on\"+c,a));return!0} var eventMatchers={HTMLEvents:/^(?:load|unload|abort|error|select|change|submit|reset|focus|blur|resize|scroll)$/,MouseEvents:/^(?:click|dblclick|mouse(?:down|up|over|move|out))$/}; simulate(arguments[0],\"mousedown\",0,0); simulate(arguments[0],\"mousemove\",arguments[1],arguments[2]); simulate(arguments[0],\"mouseup\",arguments[1],arguments[2]); ",element,xto,yto)
            except Exception as e:
                print(e)
                
        def drag_and_drop_by_actions(self, locator, target):
            """drag and drop using actions class"""
            try:
                element1 = self._driver.find_element_by_xpath(locator)
                target1 = self._driver.find_element_by_xpath(target)
                action = ActionChains(self._driver)
                action.drag_and_drop(element1, target1).perform()
            except Exception as e:
                    print(e)
                    
        def assign_job_to_technician_in_empty_slot(self, job_name, technician_name):
            row_index = self.get_row_index_by_technician_name(technician_name)
            grid_boxes_element_based_on_technician_name = f"//span[text()]/../../../following-sibling::div[1]/div[1]/div[@class='ng-star-inserted'][{row_index}]/div/div/div"
            all_grid_boxes_of_technician = self._driver.find_elements_by_xpath(grid_boxes_element_based_on_technician_name)
            grid_boxes_count = len(all_grid_boxes_of_technician)
            self.scroll_to_element("//span[text()='Unassigned & Jeopardy Jobs']")
            self.wait_until_time(1)
            self._driver.find_element_by_xpath("//span[text()='Unassigned & Jeopardy Jobs']").click()
            for grid_box_index in range(1, grid_boxes_count):
                each_grid = grid_boxes_element_based_on_technician_name +"[" + str(grid_box_index) + "]"
                self.scroll_to_element(each_grid)
                self.wait_until_time(1)
                job_locator = f"//span[contains(text(),'{job_name}')]"
                self.scroll_to_element(job_locator)
                self.wait_until_time(1)
                self.drag_and_drop_by_actions(job_locator, each_grid)
                confirm_message_status = self.wait_till_element_is_displayed("//h1[text()='Confirm Schedule']", 2)
                if not confirm_message_status:
                    continue
                else:
                    return True
            return False
        
        def get_row_index_by_technician_name(self, exp_technician_name):
            technician_name_list_locator = f"//div[contains(@class,'dhtechnicianname')]/following-sibling::div"
            all_tech_names = self._driver.find_elements_by_xpath(technician_name_list_locator)
            technician_count = len(all_tech_names)
            for technician_index in range(1, technician_count):
                technician_name_locator = technician_name_list_locator + "[" + str(technician_index) + "]//span[text() and not(@class)]"
                act_technician_name = self._driver.find_element_by_xpath(technician_name_locator).text
                print(act_technician_name)
                if exp_technician_name.lower() == act_technician_name.lower():
                    return technician_index
                else:
                    continue
            raise ValueError(f'{exp_technician_name} is not in the technician name list')  

        def wait_for_notification(self):
            for counter in range(0, 30):
                notifications = self._driver.find_elements_by_css_selector("div.ui-growl-message")
                notifications_count = len(notifications)
                print(notifications_count)
                if notifications_count > 0:
                    return
                else:
                    self.wait_until_time(1)
                    continue
            raise Exception("no success notifications were found")

            
        def download_button(self): 

            shadow_host = driver.find_element(By.CSS_SELECTOR, '#shadow_host')
            shadow_root = shadow_host.shadow_root
            shadow_content = shadow_root.find_element(By.CSS_SELECTOR, '#shadow_content')

        def javascript_click(self,xpath):
            element = self.get_element_locator(xpath) 
            self._driver.execute_script("arguments[0].click();", element)

        def get_element_locator(self,locator):
                """ This functions used to get the type of the element
                locator and it will split the locator with : and returns the type of the locator and locator value.
                :param locator: locator of the element """
                try:
                        """Get locator to split """
                        locator_value = locator.split(":", 1)
                        """ Locator type"""
                        locator_type = locator_value[0]
                        """ Locator value"""
                        locator_value = locator_value[1]
                        """ Check the locator type of given locator"""
                        if locator_type == "id":
                                return self._driver.find_element_by_id(locator_value)
                        elif locator_type == "name":
                                return self._driver.find_element_by_name(locator_value)               
                        elif locator_type == "classname":
                                return self._driver.find_element_by_class_name(locator_value)             
                        elif locator_type == "css":
                                return self._driver.find_element_by_css_selector(locator_value)            
                        elif locator_type == "xpath":
                                return self._driver.find_element_by_xpath(locator_value)
                        elif locator_type == "linktext":
                                return self._driver.find_element_by_link_text(locator_value)
                        elif locator_type == "tagname":
                                return self._driver.find_element_by_tag_name(locator_value)
                        elif locator_type == "partiallinktext":
                                return self._driver.find_element_by_partial_link_text(locator_value)
                except ValueError:
                                print("Given "+str(locator_type)+"  locator type is not valid")
                                return False

        def get_driver_path_with_browser(self,browsername):
           if browsername.lower() == 'chrome':
               print(browsername)
               driver_path=ChromeDriverManager().install()
           if browsername.lower() == 'firefox':
               driver_path = GeckoDriverManager().install()
           print(driver_path)
           return driver_path

        def read_digit(self,data):
            """This function is used to dinf the all the digits present in data"""
            x=re.findall('[0-9]+', data)
            print(x)
            return x

        def filterNumber_status(self, data):
            """This method filters and returns the 6 digit numbers"""
            x=self.read_digit(data)
            finalNumber = list(filter(self.filterNumber,x))
            return finalNumber

        
        def filterNumber(self,n):
            if len(n)==6:
                return True
            else:
                return False

        def read_file_path(self,path):
            """This method returns all the file paths in the given directory"""
            file_paths=[]
            for root, directories, files in os.walk(path):
                for filename in files:
                    filepath = os.path.join(root, filename)
                    file_paths.append(filepath)     
            return file_paths    
                             
        def read_pdf(self,path):
            """this method used for reading the pdf content"""
            f = open(path, "rb")
            pdf = PyPDF2.PdfFileReader(f)
            page1=pdf.getPage(0)
            text=page1.extractText()
            f.close()
            return text
        
        def read_coloured_pdf(self,path):
            """this method used for reading coloured and tabular format pdf content"""
            rsrcmgr = PDFResourceManager()
            retstr = StringIO()
            codec = 'utf-8'
            laparams = LAParams()
            device = TextConverter(rsrcmgr, retstr, codec=codec, laparams=laparams)
            fp = open(path, 'rb')
            interpreter = PDFPageInterpreter(rsrcmgr, device)
            password = ""
            maxpages = 1
            caching = True
            pagenos=set()
            for page in PDFPage.get_pages(fp, pagenos, maxpages=maxpages, password=password,caching=caching, check_extractable=True):
                interpreter.process_page(page)
                fp.close()
                device.close()
                str = retstr.getvalue()
                retstr.close()               
            return str

        def read_xls(self,path):         
            workbook = xlrd.open_workbook(path, ignore_workbook_corruption=True)         
            worksheet = workbook.sheet_by_index(0)
            headerValues=worksheet.row_values(int(1))
            rowValues=worksheet.row_values(int(1))
            return(headerValues)
            return(rowValues)

        def read_csv(self,path):         
            file=open(path)
            csvreader=csv.reader(file)
            rows=[]
            for row in csvreader:
                rows.append(row)
            return rows    
                
        def get_element_bytype_and_value(self,locator):
                """ This functions used to get the type of the element
                locator and it will split the locator with : and returns the type of the locator and locator value.
                :param function_param: This method is to get_element_bytype_and_value 
                :param locator: locator of the element
                :retunrn: locator_type & locator_value
                """
                try:
                        """Get locator to split """
                        locator_value = locator.split(":", 1)
                        """ Locator type"""
                        locator_type = locator_value[0]
                        """ Locator value"""
                        locator_value = locator_value[1]
                        """ Check the locator type of given locator"""
                        if locator_type == "id":
                                return [By.ID, locator_value]
                        elif locator_type == "name":
                                return [By.NAME, locator_value]               
                        elif locator_type == "classname":
                                return [By.CLASS_NAME, locator_value]             
                        elif locator_type == "css":
                                return [By.CSS_SELECTOR, locator_value]              
                        elif locator_type == "xpath":
                                return [By.XPATH, locator_value]
                        elif locator_type == "linktext":
                                return [By.LINK_TEXT, locator_value]
                        elif locator_type == "tagname":
                                return [By.TAG_NAME, locator_value]
                        elif locator_type == "partiallinktext":
                                return [By.PARTIAL_LINK_TEXT, locator_value]
                except ValueError:
                                print("Given "+str(locator_type)+"  locator type is not valid")
                                return False
        def get_current_window(self):
            window_handle=self._driver.current_window_handle    
            return window_handle

        def Do_Drag_and_Drop(self,documentation_name,target_locator):
            src_locator = f"//div[contains(text(),'{documentation_name}')]"           
            self.drag_and_drop_by_actions(src_locator, target_locator)         


           
