
import Pkg;
Pkg.activate(@__DIR__);
##

using Revise
using GLMakie
using Sockets
using Serialization

GLMakie.activate!(inline=false)

# using makie_visualizer
import makie_visualizer

gui_task = makie_visualizer.gui_task()
schedule(gui_task)

# gui = gui_init()
# gui_data = reset_plot(gui)
# display(gui.fig)

makie_visualizer.qwe()

