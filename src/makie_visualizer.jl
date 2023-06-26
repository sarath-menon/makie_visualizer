module makie_visualizer

include("tasks.jl")
# include("gui_task.jl")


gui_task1 = gui_task.setup()
schedule(gui_task1)


# gui_task()

end # module makie_visualizer
