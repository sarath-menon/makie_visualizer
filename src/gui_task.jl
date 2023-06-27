
include("gui.jl")

function gui_task_func(data_channel::Channel)

    gui_task = @async begin

        ## initialize the gui
        gui = gui_init()
        gui_data = reset_plot(gui)
        fps::Integer = 1000

        display(gui.fig)

        # # wait for data to become available in the channel
        # wait(data_channel)

        duration = 5
        count = duration * 1000
        Core.println("Waiting for data in gui :")



        for i in 1:count


            sample::ImuData = take!(data_channel)

            # println("Index :", i)
            # Core.println("Timestamp: ", sample.timestamp)

            Core.println("Data received $(sample.timestamp):", sample.gyro.ẋ)

            gui_data.points_x[] = push!(gui_data.points_x[], [i sample.gyro.ẋ])
            # gui_data.points_y[] = push!(gui_data.points_y[], [1 sample.gyro.ẏ])
            # gui_data.points_z[] = push!(gui_data.points_z[], [1 sample.gyro.ż])

            # println("plotting data")
            # plot_gyro(gui_data, i, sample.gyro)

            # sleep(1 / fps)
        end


    end

    return gui_task

end
# end

