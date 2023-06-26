

include("socket_udp.jl")

using Sockets
using Serialization

function socket_task_func(data_channel::Channel)
    # socket_task = @task begin
    @tspawnat 2 begin

        socket_profile::SocketProfile = socket_init()
        # recdata()

        println("Waiting for data")

        while true

            pck = recv(socket_profile.udp_socket)

            # Deserialize function takes stream as parameter
            msg = deserialize(IOBuffer(pck))

            # shutdown the receiver is exit msg is received
            if msg == :exit
                println("Shutting down receiver")
                break
            end

            # println("Data received:", msg)

            # push data to data buffer
            put!(data_channel, msg)
        end

        socket_close(socket_profile)

    end

end



