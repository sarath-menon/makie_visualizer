module gui_task

include("gui.jl")
import .gui


function selv()
    print("sel")
end


function setup()::Task
    gui_task = @task begin

        ## initialize the gui
        gui_handle = gui.gui_init()
        gui_data = gui.reset_plot(gui_handle)
        fps::Integer = 1000

        display(gui_handle.fig)

        # # wait for data to become available in the channel
        # wait(data_channel)

        duration = 5
        count = duration * 1000000



        for i in 1:count
            println("Waiting for data in gui:")

            sample::GyroData = take!(data_channel)

            println("Data received $(i) :", sample)

            println("plotting data")
            plot_gyro(gui_data, i, sample)

            sleep(1 / fps)
        end


    end

    return gui_task
end

end