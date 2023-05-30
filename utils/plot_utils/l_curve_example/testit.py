import l_curve_plotter

path = './'
stdout, content = l_curve_plotter.get_labels(path)
l_curve_plotter.plot_l_curve(content, stdout)