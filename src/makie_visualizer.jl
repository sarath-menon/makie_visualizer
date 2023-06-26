module makie_visualizer

include("tasks.jl")
include("comm_utils.jl")


data_channel = Channel{GyroData}(100)

gui_task1 = gui_task.setup()
schedule(gui_task1)

socket_task_handle = socket_task.setup()
schedule(socket_task_handle)


end # module makie_visualizer
