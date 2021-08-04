
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
x_values = []
y_values = []
MATRIX_LENGTH = 20
COOR_LENGTH = 75000

cells_number = np.zeros((MATRIX_LENGTH,MATRIX_LENGTH))

# start file stream #
with open(FILE_NAME, 'r') as f:
    lines = f.readlines()

    # cells description section #
    for i in range(len(lines)):
        # line split #
        line_content = lines[i].split()

        for j in range(len(line_content)):
            if(line_content[j] == "COMPONENTS"):
                start_flag = 1
            if(line_content[j] == "END"):
                if(line_content[j+1] == "COMPONENTS"):
                    end_flag = 1

        if(start_flag == 1 and end_flag == 0):
            context.append(i+1)

    # store coordinates info #
    for cells_index in range(len(context)-1):
        cell_info = lines[context[cells_index]].split()
        if(cell_info[2] != "FILL"):
            x_values.append(cell_info[6])
            y_values.append(cell_info[7])
    
    f.close()

# data info for heatmap #

STEP_SIZE = COOR_LENGTH/MATRIX_LENGTH

for k in range(len(x_values)):
    for i in range(MATRIX_LENGTH):
        for j in range(MATRIX_LENGTH):
            if(STEP_SIZE*(i) < int(x_values[k]) < STEP_SIZE*(i+1) and STEP_SIZE*(j) < int(y_values[k]) < STEP_SIZE*(j+1)):
                cells_number[i][j] = cells_number[i][j] + 1

fig = plt.figure(figsize=(12,12))
r = sns.heatmap(cells_number, cmap='BuPu')
r.set_title("Heatmap of "+SYSTEM+" system module cells")
plt.ylim(0, MATRIX_LENGTH)
plt.show()

