local slot_no = 1      -- Duration of the signal in seconds
local signal_duration = 1      -- Duration of the signal in seconds
local signal_side = "top"      -- Duration of the signal in seconds
local side_disable = "back"  -- The side that disables the program

turtle.select(slot_no)

while true do

    if redstone.getInput(side_disable) then
        print("Program disabled by redstone signal on the right side.")
        sleep(5)
    elseif turtle.getItemDetail() == nil then
        turtle.suckDown(slot_no)
    elseif turtle.getItemDetail().name ~= "productivebees:bee_cage" then
        print("No bee in selected slot!")
        sleep(10)
    else
        turtle.place()
        sleep(0.2)
        redstone.setOutput(signal_side, true)
        sleep(signal_duration)
        redstone.setOutput(signal_side, false)
        sleep(0.2)
    end
end
