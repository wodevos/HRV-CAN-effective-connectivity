function remove_double_files(folder, subject)
% removes all the files that are not necessary

    thepath=[folder '/' subject '/func']

    files=dir(thepath)

    for i=1:length(files)

        disp(files(i).name)


        if length(files(i).name)>2
            if not(string(files(i).name(1:3))=="sws")
                delete([files(i).folder '/' files(i).name])

            end


        end

    end



end

