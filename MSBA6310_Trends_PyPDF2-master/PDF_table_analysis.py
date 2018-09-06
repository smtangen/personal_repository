# -*- coding: utf-8 -*-
"""
Created on Sat Aug  4 19:51:16 2018

@author: stang
"""

import pandas as pd


def table(file):
    data = pd.read_table(file, header=None, names=["1"], escapechar="$")
    data = data[335:351]
    data = data["1"].str.split(',,', expand=True)  # initial split
    data.columns = ["0", "1", "2", "3", "4", "5", "6"]
    data["0"] = data["0"].map(lambda x: x.lstrip(','))
    # Adjusting date row - possible to loop this?
    data["1"][335] = data["2"][335]
    data["2"][335] = data["3"][335]
    data["3"][335] = data["4"][335]
    data["4"][335] = data["5"][335]
    data["5"][335] = data["6"][335]
    data.drop(['6'], axis=1, inplace=True)
    # Dropping None values
    data = data.replace([None], [''], regex=True)
    # Dealing with rows with $
    data.iloc[3].str.split(r'"$"', expand=True)
    # Stripping rest of the data - this should be looped?
    data["1"] = data["1"].map(lambda x: x.lstrip(',"').rstrip(r'"').replace(",",""))
    data["2"] = data["2"].map(lambda x: x.lstrip(',"').rstrip(r'"').replace(",",""))
    data["3"] = data["3"].map(lambda x: x.lstrip(',"').rstrip(r'"').replace(",",""))
    data["4"] = data["4"].map(lambda x: x.lstrip(',"').rstrip(r'"').replace(",",""))
    data["5"] = data["5"].map(lambda x: x.lstrip(',"').rstrip(r'"').replace(",",""))
    new_header = data.iloc[0]  # grab the first row for the header
    data = data[1:]  # take the data less the header row
    data.columns = new_header
    # Converting to number
    years = ["2017", "2016", "2015", "2014", "2013"]
    data[years] = data[years].apply(pd.to_numeric, axis=1)

    # Calculate CAGR
    data["CAGR (%)"] = ((data["2017"] / data["2013"]) ** (1/len(years)) - 1) * 100
    data.to_csv("example_output.csv")

    return data
