module makie_visualizer

include("tasks.jl")
include("comm_utils.jl")


data_channel = Channel{GyroData}(100)

gui_task1 = gui_task.setup(data_channel)
schedule(gui_task1)

socket_task_handle = socket_task.setup(data_channel)
schedule(socket_task_handle)


end # module makie_visualizer
