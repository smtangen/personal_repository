# -*- coding: utf-8 -*-
"""
Created on Wed Aug 29 20:23:55 2018

@author: stang
"""
import pandas as pd


def extp_2017():
    data = pd.read_csv("pbp_2017.csv", index_col=0, na_values="NA")
    data = data[(data["PlayType"] == "Field Goal") | (data["PlayType"] == "Extra Point")]
    
    # Extra point pct by team
    extp = data.groupby(["posteam", "ExPoint_Prob", "ExPointResult"]).size()
    extp = extp.unstack()
    extp = extp.fillna(0)
    extp.to_csv("extrapoints_2017.csv")
    
    return extp
  
def fg_2017():  
    data = pd.read_csv("pbp_2017.csv", index_col=0, na_values="NA")
    data = data[(data["PlayType"] == "Field Goal") | (data["PlayType"] == "Extra Point")]
    fg = data.groupby(["posteam",  "Field_Goal_Prob", "FieldGoalResult"]).size()
    fg = fg.unstack()
    fg = fg.fillna(0)
    fg["Total"] = fg["Good"] + fg["No Good"]
    fg.to_csv("field_goals_2017.csv")

    return fg
