# Getting-and-Cleaning-Data-Course-Project

## Introduction

This repo contains the following files:

README.md - provides an overview of the project
CodeBook.md - describes the data, variables, and data processing performed to create a tidy data set
run-analysis.R - the R script the reads source data from multiple text files and creates a tidy data set
tidyData.txt - the resulting tidy data set

## Project Overview

The purpose of this project was to demonstrate my ability to collect, work with, and clean a data set. The goal was to prepare tidy data that can be used for later analysis. A tidy data set can be described as a data set where:
  - each variable forms a column;
  - each observation forms a row; and
  - each type of observational unit forms a table

The project instructions were to create one R script called run_analysis.R that:

  - merges the training and the test sets to create one data set
  - extracts only the measurements on the mean and standard deviation for each measurement
  - uses descriptive activity names to name the activities in the data set
  - appropriately labels the data set with descriptive variable names
  - creates a second, independent tidy data set with the average of each variable for each activity and each         subject

## Tidy Data Set

The tidy data set "tidyData.txt" was created with the run.analysis.R script using R version 3.4.0 on Windows 10 and used the dplyr package.

## Source Data

The data linked to for this project represent data collected from the accelerometers and gyroscopoes from the Samsung Galaxy S smartphones worn on the waists of 30 volunteers performing 6 different activities (walking, walking upstairs, walking downstairs, sitting, standing and laying).

The specific data obtained for this project was obtained from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
