
import Pkg;
Pkg.activate(@__DIR__);

##
using Revise
import makie_visualizer
using DataStructures
using GLMakie
using ThreadPools

using Sockets
using Serialization


GLMakie.activate!(inline=false)
##

include("src/comm_utils.jl")


data_channel = Channel{GyroData}(100);


include("src/tasks.jl")

# schedule(socket_task)
socket_task_func(data_channel)

gui_task = gui_task_func(data_channel)







