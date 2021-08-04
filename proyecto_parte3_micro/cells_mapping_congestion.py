
import os
from IPython.core.display import HTML
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.ticker as ticker
import matplotlib.cm as cm
import matplotlib as mpl
import matplotlib.pyplot as plt


# change file extension #
SYSTEM_CHOICE = int(input())

if(SYSTEM_CHOICE == 0):
    FILE_NAME = "area_sys.txt"
    CURRENT_FILE_NAME = "area_sys.def"
    SYSTEM = "area"
elif(SYSTEM_CHOICE == 1):
    FILE_NAME = "perf_sys.txt"
    CURRENT_FILE_NAME = "perf_sys.def"
    SYSTEM = "performance"
else:
    print("Digit a valid input")

if not os.path.exists(FILE_NAME):
    pre, ext = os.path.splitext(CURRENT_FILE_NAME)
    os.rename(CURRENT_FILE_NAME, pre + ".txt")

count = 0
start_flag = 0
end_flag = 0
context = []

x_values1 = []
x_values2 = []

y_values2 = []
y_values1 = []
MATRIX_LENGTH = 20
COOR_LENGTH = 75000



# start file stream #
with open(FILE_NAME, 'r') as f:
    lines = f.readlines()

    # cells description section #
    for i in range(len(lines)):
        # line split #
        line_content = lines[i].split()

        for j in range(len(line_content)):
            if(line_content[j] == "NETS"):
                start_flag = 1
            if(line_content[j] == "END"):
                if(line_content[j+1] == "NETS"):
                    end_flag = 1

        if(start_flag == 1 and end_flag == 0):
            context.append(i+1)

    # store coordinates info #
    for cells_index in range(len(context)-1):
        cell_info = lines[context[cells_index]].split()
        if(len(cell_info) > 1):

            if(cell_info[1] == "metal4" and cell_info[8] == "*"):
                x_values1.append(cell_info[3])
                y_values1.append(cell_info[4])
                if(cell_info[7] == "*"):
                    x_values2.append(cell_info[3])
                else:
                    x_values2.append(cell_info[7])
                if(cell_info[8] == "*"):
                    y_values2.append(cell_info[4])
                else:
                    y_values2.append(cell_info[8])

    for i in range(len(x_values1)):
        x_values1[i] = int(x_values1[i])
        x_values2[i] = int(x_values2[i])

    for i in range(len(y_values1)):
        y_values1[i] = int(y_values1[i])
        y_values2[i] = int(y_values2[i])


    

    #print(min(x_values1), min(x_values2), min(y_values1), min(y_values2))

                #print(x_values1, x_values2, y_values1, y_values2)

    f.close()

    temp_array = [max(x_values1), max(x_values2), max(y_values1), max(y_values2)]
    MATRIX_LENGTH = ((max((temp_array))/100)) 
    cells_number = np.zeros((int(MATRIX_LENGTH),int(MATRIX_LENGTH)))

    for i in range(len(x_values1)):
        if x_values1[i] > x_values2[i]:
            temp = x_values2[i]
            x_values2[i] = x_values1[i]
            x_values1[i] = temp
        print(x_values1[i], x_values2[i])
    
    for i in range(len(x_values1)):
        x_values1[i] = int(x_values1[i]/100)
        x_values2[i] = int(x_values2[i]/100)
        y_values1[i] = int(y_values1[i]/100)
        
    print(max(x_values1), max(x_values2), max(y_values1))
    k = 0
    for i in range(len(y_values1)):
        for j in range(x_values1[i], x_values2[i], 1):
            cells_number[y_values1[i]][j] = cells_number[y_values1[i]][j] + 1
             
    
        


# data info for heatmap #

STEP_SIZE = COOR_LENGTH/MATRIX_LENGTH

""" for k in range(len(x_values1)):
    for i in range(MATRIX_LENGTH):
        for j in range(MATRIX_LENGTH):
            if(STEP_SIZE*(i) < int(x_values1[k]) < STEP_SIZE*(i+1) and STEP_SIZE*(j) < int(y_values1[k]) < STEP_SIZE*(j+1)):
                cells_number[i][j] = cells_number[i][j] + 1 """



fig = plt.figure(figsize=(12,12))
r = sns.heatmap(cells_number, cmap='BuPu')
r.set_title("Heatmap of "+SYSTEM+" system module cells")
plt.ylim(0, MATRIX_LENGTH)
plt.show()
