import matplotlib.pyplot as plt
import numpy as np
from cycler import cycler
import sys
import os

def get_labels(path):
    files = os.listdir(path)
    result = []
    out_files = []
    for file in files:
        if file.endswith('.out'):
            with open(os.path.join(path, file), 'r') as f:
                lines = f.readlines()
                if len(lines) >= 100:
                    line = lines[100]
                    print(line)
                    result.append(line.split())
            out_files.append(file)
    return out_files, result

def plot_l_curve(content, label):
    model_misfit = []
    data_misfit = []
    for iter in content:
        model_misfit.append(np.double(iter[3]))
        data_misfit.append(np.double(iter[2]))
    plt.rcParams['axes.prop_cycle'] = cycler(color=plt.cm.tab20.colors)
    colors = plt.rcParams['axes.prop_cycle'].by_key()['color']
    colors = colors[:len(model_misfit)]
    # generate labels
    labels = [s.rstrip('.out') for s in label]
    double_array = np.array(list(map(float, labels)))
    sorted_index = np.argsort(double_array)
    # Plot
    plt.figure()
    for iter in sorted_index:
        plt.scatter(model_misfit[iter], data_misfit[iter], alpha=0.5, color=colors[iter], label=labels[iter],s=80)
    plt.legend(ncol=2)
    plt.xlabel('Model Misfit')
    plt.ylabel('Data Misfit')
    plt.show()