# -*- coding: utf-8 -*-
"""
Created on Fri Aug  3 19:29:28 2018

@author: stang
"""

## CHANGE THE API KEY BEFORE RUNNING

## Write to csv
import requests 

import PyPDF2
from PyPDF2 import PdfFileWriter, PdfFileReader

def pdfToTable(PDFfilename, apiKey, fileExt, downloadDir):

    PDFfilename = '2017VerizonAnnualReport.pdf'
    fileData = (PDFfilename, open(PDFfilename, 'rb')) #"rb" stands for "read bytes"
    files = {'f': fileData} 
    apiKey = "i6cbqxal2a9w" #### THIS IS MY API KEY, DO NOT USE IT!!!
    fileExt = "csv" #format/file extension of final document
    postUrl = "https://pdftables.com/api?key={0}&format={1}".format(apiKey, fileExt)
    #the .format puts value of apiKey where {0} is, etc
    response = requests.post(postUrl, files=files)
    response.raise_for_status() # ensure we notice bad responses
    downloadDir = "example.csv" #directory where you want your file downloaded to 
    with open(downloadDir, "wb") as f:
        f.write(response.content) #write data to csv
